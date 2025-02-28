/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import dal.DBContext;
import Model.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Date;
import java.sql.Statement;

/**
 *
 * @author Nguyen Duc Tuan
 */
public class UserDAO extends DBContext {

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public User login(String email, String password) {
        // First check if user exists
        User user = getUserByEmail(email);
        if (user == null) {
            System.out.println("User not found with email: " + email);
            return null;
        }

        String sql = "select * from Users where email = ? and password = ?";
        try {
            System.out.println("Attempting to login user: " + email);
            con = new DBContext().getConnection();
            if (con == null) {
                System.out.println("Failed to get database connection");
                return null;
            }
            ps = con.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password);
            rs = ps.executeQuery();
            if (rs.next()) {
                System.out.println("Login successful for user: " + email);
                user = new User();
                user.setId(rs.getInt(1));
                user.setName(rs.getString(2));
                user.setEmail(rs.getString(3));
                user.setPassword(rs.getString(4));
                user.setCreatedAt(rs.getDate(5));
                user.setLastLogin(rs.getDate(6));
                
                // Update last login time
                updateLastLoginTime(user.getId());
                return user;
            } else {
                System.out.println("Invalid password for user: " + email);
                return null;
            }
        } catch (Exception e) {
            System.out.println("Error at login: " + e.getMessage());
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (Exception e) {
                System.out.println("Error closing connections: " + e.getMessage());
            }
        }
        return null;
    }
    
    public void register(String username, String password, String email) {
    String sqlUser = "INSERT INTO Users (full_name, email, password) VALUES (?, ?, ?)";
    String sqlRole = "INSERT INTO Role (user_id, role) VALUES (?, 1)"; 
    try {
        con = new DBContext().getConnection();
        if (con == null) {
            System.out.println("Failed to get database connection");
            return;
        }

        con.setAutoCommit(false); // Bắt đầu transaction

        // Chèn vào bảng Users
        ps = con.prepareStatement(sqlUser, Statement.RETURN_GENERATED_KEYS);
        ps.setString(1, username);
        ps.setString(2, email);
        ps.setString(3, password);

        int result = ps.executeUpdate();
        if (result > 0) {
            rs = ps.getGeneratedKeys();
            if (rs.next()) {
                int userId = rs.getInt(1); // Lấy user_id vừa tạo

                // Chèn vào bảng Role với user_id lấy từ Users
                ps = con.prepareStatement(sqlRole);
                ps.setInt(1, userId);
                ps.executeUpdate();

                con.commit(); // Xác nhận transaction
                System.out.println("User registered successfully with user_id: " + userId);
            }
        }
    } catch (Exception e) {
        System.out.println("Error at register: " + e.getMessage());
        e.printStackTrace();
        try {
            con.rollback(); // Rollback nếu có lỗi
        } catch (Exception rollbackEx) {
            System.out.println("Error during rollback: " + rollbackEx.getMessage());
        }
    } finally {
        try {
            if (rs != null) rs.close();
            if (ps != null) ps.close();
            if (con != null) con.close();
        } catch (Exception e) {
            System.out.println("Error closing connections: " + e.getMessage());
        }
    }
}


    public User getUserByEmail(String email) {
        String sql = "SELECT * FROM Users WHERE email = ?";
        try {
            System.out.println("Getting user by email: " + email);
            con = new DBContext().getConnection();
            if (con == null) {
                System.out.println("Failed to get database connection");
                return null;
            }
            ps = con.prepareStatement(sql);
            ps.setString(1, email);
            rs = ps.executeQuery();
            
            if (rs.next()) {
                User user = new User();
                user.setId(rs.getInt(1));
                user.setName(rs.getString(2));
                user.setEmail(rs.getString(3));
                user.setPassword(rs.getString(4));
                
                return user;
            }
        } catch (Exception e) {
            System.out.println("Error getting user by email: " + e.getMessage());
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (Exception e) {
                System.out.println("Error closing connections: " + e.getMessage());
            }
        }
        return null;
    }
    
     public User getUserById(int Id) {
        String sql = "Select * from [Users] where id = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, Id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {                
                return new User(
                        rs.getInt(1),
                        rs.getString(2), 
                        rs.getString(3), 
                        rs.getString(4),
                        rs.getDate(5),
                        rs.getDate(6));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }
    


    private int updateLastLoginTime(int userId) {
        String sql = "UPDATE Users SET lastLogin = ? WHERE Id = ?";
        try {
            System.out.println("Updating last login for user: " + userId);
            con = new DBContext().getConnection();
            if (con == null) {
                System.out.println("Failed to get database connection");
                return 0;
            }
            ps = con.prepareStatement(sql);
            ps.setDate(1, new java.sql.Date(new Date().getTime()));
            ps.setInt(2, userId);
            return ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("Error at updateLastLogin: " + e.getMessage());
            e.printStackTrace();
        } finally {
            try {
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (Exception e) {
                System.out.println("Error closing connections: " + e.getMessage());
            }
        }
        return 0;
    }

    public User updatePassword(String email, String newPassword) {
        User user = getUserByEmail(email);
        if (user == null) {
            return null;
        }

        String sql = "UPDATE Users SET password = ? WHERE email = ?";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, newPassword);
            ps.setString(2, email);
            int result = ps.executeUpdate();
            if (result > 0) {
                user.setPassword(newPassword);
                return user;
            }
        } catch (Exception e) {
            System.out.println("Error updating password: " + e.getMessage());
        } finally {
            try {
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (Exception e) {
                System.out.println("Error closing connections: " + e.getMessage());
            }
        }
        return null;
    }
}
