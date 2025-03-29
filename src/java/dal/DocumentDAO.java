/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import Model.Document;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author bangc
 */
public class DocumentDAO {
    public List<Document> getAllDocuments() throws Exception {
    List<Document> documents = new ArrayList<>();
    String sql = "SELECT * FROM Document";
    DBContext db = new DBContext();
    Connection conn = db.getConnection();

    if (conn == null) {
        throw new Exception("Không thể kết nối đến cơ sở dữ liệu.");
    }

    try (PreparedStatement stmt = conn.prepareStatement(sql);
         ResultSet rs = stmt.executeQuery()) {

        while (rs.next()) {
            Document doc = new Document(
                rs.getInt("d_id"),
                rs.getString("Title"), 
                rs.getString("content"),
                rs.getInt("t_id"),
                rs.getString("filePath") 
            );
            documents.add(doc);
            System.out.println("Retrieved document: ID=" + doc.getId() + ", Title=" + doc.getTitle());
        }
    } catch (SQLException e) {
        System.err.println("SQL Error in getAllDocuments: " + e.getMessage());
        e.printStackTrace();
        throw new Exception("Lỗi khi lấy danh sách tài liệu từ database: " + e.getMessage());
    } finally {
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                System.err.println("Error closing connection: " + e.getMessage());
            }
        }
    }
    return documents;
}

    public Document getDocumentById(int id) throws Exception {
        String sql = "SELECT * FROM Document WHERE d_id = ?"; 
        DBContext db = new DBContext();

        try (Connection conn = db.getConnection(); 
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return new Document(
                        rs.getInt("d_id"),        
                        rs.getString("title"),
                        rs.getString("content"),
                        rs.getInt("t_id"),        
                        rs.getString("filepath")  
                    );
                }
            }
        } catch (SQLException e) {
            System.err.println("Error in getDocumentById: " + e.getMessage());
            e.printStackTrace();
            throw new Exception("Lỗi khi lấy tài liệu từ database: " + e.getMessage());
        }
        return null;
    }

    public void addDocument(String title, String content, int typeId, String filePath) throws Exception {
        String sql = "INSERT INTO Document (title, content, t_id, filepath) VALUES (?, ?, ?, ?)";
        DBContext db = new DBContext();

        try (Connection conn = db.getConnection(); 
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, title);
            pstmt.setString(2, content);
            pstmt.setInt(3, typeId);    
            pstmt.setString(4, filePath); 
            pstmt.executeUpdate();
        } catch (SQLException e) {
            System.err.println("Error in addDocument: " + e.getMessage());
            e.printStackTrace();
            throw new Exception("Lỗi khi thêm tài liệu: " + e.getMessage());
        }
    }

    public void deleteDocument(int id) throws Exception {
        String sql = "DELETE FROM Document WHERE d_id = ?";  // Using d_id from database
        DBContext db = new DBContext();

        try (Connection conn = db.getConnection(); 
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, id);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            System.err.println("Error in deleteDocument: " + e.getMessage());
            e.printStackTrace();
            throw new Exception("Lỗi khi xóa tài liệu: " + e.getMessage());
        }
    }

    public void updateDocument(int id, String title, String content, String filePath) throws Exception {
        String sql = "UPDATE Document SET title = ?, content = ?, filepath = ? WHERE d_id = ?";
        DBContext db = new DBContext();

        try (Connection conn = db.getConnection(); 
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, title);
            pstmt.setString(2, content);
            pstmt.setString(3, filePath); 
            pstmt.setInt(4, id);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            System.err.println("Error in updateDocument: " + e.getMessage());
            e.printStackTrace();
            throw new Exception("Lỗi khi cập nhật tài liệu: " + e.getMessage());
        }
    }

}
