/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import Model.Comments;
import dal.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Nguyen Duc Tuan
 */
public class CommentDAO extends DBContext {

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public void AddComment(Comments comment) throws Exception {
    String query = "INSERT INTO Comment (user_id, comment_text, reply_to, created_at, update_time) VALUES (?, ?, ?, ?, ?)";
    try (Connection con = getConnection(); 
         PreparedStatement ps = con.prepareStatement(query)) {
        ps.setInt(1, comment.getUserId());
        ps.setString(2, comment.getCommentText());
        ps.setInt(3, comment.getReplyTo());
        ps.setTimestamp(4, new java.sql.Timestamp(comment.getCreateAt().getTime()));
        ps.setTimestamp(5, new java.sql.Timestamp(comment.getUpdateAt().getTime()));
        ps.executeUpdate();
    } catch (SQLException e) {
        e.printStackTrace();
        throw new Exception("Error while adding comment: " + e.getMessage());
    }
}

public List<Comments> getAllComment() throws Exception {
    List<Comments> comments = new ArrayList<>();
    String query = "SELECT c.comment_id, c.user_id, u.full_name, c.comment_text, c.created_at, c.update_time, c.reply_to " +
                   "FROM Comment c JOIN [Users] u ON c.user_id = u.user_id ORDER BY c.created_at DESC";
    try (Connection con = getConnection(); 
         PreparedStatement ps = con.prepareStatement(query); 
         ResultSet rs = ps.executeQuery()) {
        while (rs.next()) {
            Comments comment = new Comments(
                    rs.getInt("comment_id"),
                    rs.getInt("user_id"),
                    rs.getString("full_name"),
                    rs.getString("comment_text"),
                    rs.getTimestamp("created_at"),
                    rs.getTimestamp("update_time"),
                    rs.getInt("reply_to")
            );
            comments.add(comment);
        }
    } catch (SQLException e) {
        e.printStackTrace();
        throw new Exception("Error retrieving comments: " + e.getMessage());
    }
    return comments;
}
    public void DeleteComment(Comments comment) throws Exception{
        String query = "Delete from Comment where comment_id = ?";
    try (Connection con = getConnection(); 
         PreparedStatement ps = con.prepareStatement(query)) {
        ps.setInt(1, comment.getCommentId());     
        ps.executeUpdate();
    } catch (SQLException e) {
        e.printStackTrace();
        throw new Exception("Error while deleting comment: " + e.getMessage());
    }
    }
   public Comments getCommentById(int commentId) throws Exception {
    String query = "SELECT c.comment_id, c.user_id, u.full_name, c.comment_text, c.created_at, c.update_time, c.reply_to " +
                   "FROM Comment c JOIN [Users] u ON c.user_id = u.user_id " +
                   "WHERE c.comment_id = ?";
    try (Connection con = getConnection(); 
         PreparedStatement ps = con.prepareStatement(query)) {
        ps.setInt(1, commentId);
        try (ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                return new Comments(
                    rs.getInt("comment_id"),
                    rs.getInt("user_id"),
                    rs.getString("full_name"),
                    rs.getString("comment_text"),
                    rs.getTimestamp("created_at"),
                    rs.getTimestamp("update_time"),
                    rs.getInt("reply_to")
                );
            }
            return null; // Return null if no comment is found
        }
    } catch (SQLException e) {
        e.printStackTrace();
        throw new Exception("Error retrieving comment by ID: " + e.getMessage());
    }
}
   public void DeleteReplies(int parentCommentId) throws Exception {
    String query = "DELETE FROM Comment WHERE reply_to = ?";
    try (Connection con = getConnection(); 
         PreparedStatement ps = con.prepareStatement(query)) {
        ps.setInt(1, parentCommentId);
        ps.executeUpdate();
    } catch (SQLException e) {
        e.printStackTrace();
        throw new Exception("Error while deleting replies: " + e.getMessage());
    }
}
public int getLastInsertedId() throws Exception {
        String query = "SELECT SCOPE_IDENTITY() AS last_id";
        try (Connection con = getConnection(); 
             PreparedStatement ps = con.prepareStatement(query); 
             ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                return rs.getInt("last_id");
            }
            return -1; // Trả về -1 nếu không lấy được ID
        } catch (SQLException e) {
            e.printStackTrace();
            throw new Exception("Error retrieving last inserted ID: " + e.getMessage());
        }
    }
}
