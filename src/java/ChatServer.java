import Model.Comments;
import dal.CommentDAO;
import jakarta.websocket.*;
import jakarta.websocket.server.ServerEndpoint;
import org.json.JSONObject;
import org.json.JSONArray;
import java.io.IOException;
import java.util.Set;
import java.util.List;
import java.util.concurrent.ConcurrentHashMap;

@ServerEndpoint(value = "/chat")
public class ChatServer {

    private static final Set<Session> clients = ConcurrentHashMap.newKeySet();

    @OnOpen
    public void onOpen(Session session) {
        clients.add(session);
        System.out.println("New WebSocket connection: " + session.getId());
        sendCommentHistory(session);
    }

    @OnMessage
    public void onMessage(String message, Session session) throws IOException {
        JSONObject jsonMessage = new JSONObject(message);
        String action = jsonMessage.optString("action", "");
        String username = jsonMessage.optString("username", "User");
        String text = jsonMessage.optString("message", "");
        String avatar = jsonMessage.optString("avatar", "https://upload.wikimedia.org/wikipedia/commons/9/99/Sample_User_Icon.png");
        int userId = jsonMessage.optInt("userId", 0);

        // Kiểm tra đăng nhập
        if (userId == 0 && !"loadComments".equals(action)) {
            session.getBasicRemote().sendText("{\"error\": \"Bạn phải đăng nhập để thực hiện hành động này.\"}");
            return;
        }

        CommentDAO commentDAO = new CommentDAO();

        // Xử lý các hành động
        if ("loadComments".equals(action)) {
            sendCommentHistory(session);
            return;
        }

        // Thêm bình luận mới
        if (text.isEmpty()) {
            session.getBasicRemote().sendText("{\"error\": \"Tin nhắn không được để trống.\"}");
            return;
        }

        Comments newComment = new Comments();
        newComment.setUserId(userId);
        newComment.setName(username);
        newComment.setCommentText(text);
        newComment.setCreateAt(new java.sql.Timestamp(System.currentTimeMillis()));
        newComment.setUpdateAt(new java.sql.Timestamp(System.currentTimeMillis()));

        try {
            commentDAO.AddComment(newComment);

            JSONObject response = new JSONObject();
            response.put("commentId", newComment.getCommentId());
            response.put("username", username);
            response.put("message", text);
            response.put("avatar", avatar);
            response.put("createAt", newComment.getCreateAt().toString());
            broadcast(response.toString());

        } catch (Exception e) {
            e.printStackTrace();
            session.getBasicRemote().sendText("{\"error\": \"Lỗi khi thêm bình luận: " + e.getMessage() + "\"}");
        }
    }

    @OnClose
    public void onClose(Session session) {
        clients.remove(session);
        System.out.println("User disconnected: " + session.getId());
    }

    @OnError
    public void onError(Session session, Throwable throwable) {
        System.err.println("WebSocket Error: " + throwable.getMessage());
    }

    private void sendCommentHistory(Session session) {
        try {
            CommentDAO commentDAO = new CommentDAO();
            List<Comments> comments = commentDAO.getAllComment();
            JSONArray commentArray = new JSONArray();
            for (Comments comment : comments) {
                JSONObject commentJson = new JSONObject();
                commentJson.put("commentId", comment.getCommentId());
                commentJson.put("username", comment.getName());
                commentJson.put("message", comment.getCommentText());
                commentJson.put("avatar", "https://upload.wikimedia.org/wikipedia/commons/9/99/Sample_User_Icon.png");
                commentJson.put("createAt", comment.getCreateAt().toString());
                commentArray.put(commentJson);
            }
            JSONObject response = new JSONObject();
            response.put("action", "loadComments");
            response.put("comments", commentArray);
            session.getBasicRemote().sendText(response.toString());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void broadcast(String message) throws IOException {
        System.out.println("Broadcasting: " + message);
        for (Session client : clients) {
            if (client.isOpen()) {
                client.getBasicRemote().sendText(message);
            }
        }
    }
}
