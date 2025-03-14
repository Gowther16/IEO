/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import Model.TokenForgetPassword;
import Model.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

/**
 *
 * @author HP
 */
public class TokenForgetDAO extends DBContext {
    private Connection con = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;

    public TokenForgetDAO() {
        try {
            con = super.getConnection();
            if (con != null) {
                System.out.println("Database connection established in TokenForgetDAO!");
                System.out.println("Connection status: " + (con.isClosed() ? "Closed" : "Open"));
            }
        } catch (Exception ex) {
            System.out.println("Error in TokenForgetDAO constructor: " + ex.getMessage());
            ex.printStackTrace();
        }
    }

    private void ensureConnection() {
        try {
            if (con == null || con.isClosed()) {
                con = super.getConnection();
                System.out.println("Re-established database connection in TokenForgetDAO");
            }
        } catch (Exception ex) {
            System.out.println("Error ensuring connection: " + ex.getMessage());
            ex.printStackTrace();
        }
    }

    public String getFormatDate(LocalDateTime myDateObj) {
        DateTimeFormatter myFormatObj = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        String formattedDate = myDateObj.format(myFormatObj);
        return formattedDate;
    }

    public boolean insertTokenForget(TokenForgetPassword tokenForget) {
        ensureConnection();
        String sql = "INSERT INTO [dbo].[ForgetPassword] ([token], [expiryTime], [isUsed], [user_id]) VALUES (?, ?, ?, ?)";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, tokenForget.getToken());
            ps.setTimestamp(2, Timestamp.valueOf(getFormatDate(tokenForget.getExpiryTime())));
            ps.setBoolean(3, tokenForget.isIsUsed());
            ps.setInt(4, tokenForget.getUserId());
            
            System.out.println("Inserting token for user ID: " + tokenForget.getUserId());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println("Error inserting token: " + e.getMessage());
            e.printStackTrace();
        } finally {
            try {
                if (ps != null) ps.close();
            } catch (SQLException e) {
                System.out.println("Error closing statement: " + e.getMessage());
            }
        }
        return false;
    }

    public TokenForgetPassword getTokenPassword(String token) {
        ensureConnection();
        String sql = "SELECT * FROM [ForgetPassword] WHERE token = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, token);
            rs = ps.executeQuery();
            
            System.out.println("Searching for token: " + token);
            if (rs.next()) {
                TokenForgetPassword tokenForget = new TokenForgetPassword(
                    rs.getInt("user_id"),
                    rs.getString("token"),
                    rs.getBoolean("isUsed"),
                    rs.getTimestamp("expiryTime").toLocalDateTime()
                );
                System.out.println("Found token for user ID: " + tokenForget.getUserId());
                return tokenForget;
            }
            System.out.println("No token found: " + token);
        } catch (SQLException e) {
            System.out.println("Error retrieving token: " + e.getMessage());
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
            } catch (SQLException e) {
                System.out.println("Error closing resources: " + e.getMessage());
            }
        }
        return null;
    }

    public void updateStatus(TokenForgetPassword token) {
        ensureConnection();
        String sql = "UPDATE [dbo].[ForgetPassword] SET [isUsed] = ? WHERE token = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setBoolean(1, token.isIsUsed());
            ps.setString(2, token.getToken());
            
            System.out.println("Updating status for token: " + token.getToken());
            int updated = ps.executeUpdate();
            System.out.println("Updated " + updated + " records");
        } catch (SQLException e) {
            System.out.println("Error updating token status: " + e.getMessage());
            e.printStackTrace();
        } finally {
            try {
                if (ps != null) ps.close();
            } catch (SQLException e) {
                System.out.println("Error closing statement: " + e.getMessage());
            }
        }
    }
}
