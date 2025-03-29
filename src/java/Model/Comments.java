package Model;

import java.util.Date;

public class Comments {
    private int commentId;
    private int userId;
    private String name;
    private String commentText;
    private int replyTo; 
    private Date createAt;
    private Date updateAt;

    public Comments() {
    }

    public Comments(int commentId, int userId, String name, String commentText, Date createAt, Date updateAt, int replyTo) {
        this.commentId = commentId;
        this.userId = userId;
        this.name = name;
        this.commentText = commentText;
        this.createAt = createAt;
        this.updateAt = updateAt;
        this.replyTo = replyTo;
    }

    public Comments(int userId, String name, String commentText, Date createAt, Date updateAt, int replyTo) {
        this.userId = userId;
        this.name = name;
        this.commentText = commentText;
        this.createAt = createAt;
        this.updateAt = updateAt;
        this.replyTo = replyTo;
    }

    // Getters và Setters
    public int getCommentId() {
        return commentId;
    }

    public void setCommentId(int commentId) {
        this.commentId = commentId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCommentText() {
        return commentText;
    }

    public void setCommentText(String commentText) {
        this.commentText = commentText;
    }

    public Date getCreateAt() {
        return createAt;
    }

    public void setCreateAt(Date createAt) {
        this.createAt = createAt;
    }

    public Date getUpdateAt() {
        return updateAt;
    }

    public void setUpdateAt(Date updateAt) {
        this.updateAt = updateAt;
    }

    public int getReplyTo() {
        return replyTo;
    }

    public void setReplyTo(int replyTo) {
        this.replyTo = replyTo;
    }

    @Override
    public String toString() {
        return "Comments{" + "commentId=" + commentId + ", userId=" + userId + ", name=" + name + ", commentText=" + commentText + ", createAt=" + createAt + ", updateAt=" + updateAt + ", replyTo=" + replyTo + '}';
    }
}