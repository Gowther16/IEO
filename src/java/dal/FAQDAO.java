/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import dal.DBContext;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import Model.FAQ;

/**
 *
 * @author bangc
 */
public class FAQDAO {
    public static List<FAQ> getAllFAQs() throws Exception {
        List<FAQ> faqs = new ArrayList<>();
        String sql = "SELECT * FROM Help_Center_FAQs";
        DBContext db = new DBContext();
        try (
                Connection conn = db.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql); ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                faqs.add(new FAQ(rs.getInt("faq_id"), rs.getString("question"), rs.getString("answer")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return faqs;
    }

    public FAQ getFAQById(int id) throws Exception {
        String sql = "SELECT * FROM Help_Center_FAQs WHERE faq_id=?";
        DBContext db = new DBContext();
        FAQ faq = null;

        try (
                Connection conn = db.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                faq = new FAQ(rs.getInt("faq_id"), rs.getString("question"), rs.getString("answer"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new Exception("Lỗi khi lấy FAQ: " + e.getMessage());
        }
        return faq;
    }

    public void addFAQ(String question, String answer) throws Exception {
        String sql = "INSERT INTO Help_Center_FAQs (question, answer, t_id) VALUES (?, ?, 1)";
        DBContext db = new DBContext();
        try (
                Connection conn = db.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, question);
            stmt.setString(2, answer);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateFAQ(int id, String question, String answer) throws Exception {
        String sql = "UPDATE Help_Center_FAQs SET question=?, answer=? WHERE faq_id=?";
        DBContext db = new DBContext();
        try (
                Connection conn = db.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, question);
            stmt.setString(2, answer);
            stmt.setInt(3, id);

            int affectedRows = stmt.executeUpdate();
            if (affectedRows == 0) {
                throw new SQLException("Cập nhật thất bại: Không tìm thấy FAQ với ID = " + id);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new Exception("Lỗi khi cập nhật FAQ: " + e.getMessage());
        }
    }

    public void deleteFAQ(int id) throws Exception {
        String sql = "DELETE FROM Help_Center_FAQs WHERE faq_id=?";
        DBContext db = new DBContext();
        try (
                Connection conn = db.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);

            int affectedRows = stmt.executeUpdate();
            if (affectedRows == 0) {
                throw new SQLException("Xóa thất bại: Không tìm thấy FAQ với ID = " + id);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new Exception("Lỗi khi xóa FAQ: " + e.getMessage());
        }
    }

}
