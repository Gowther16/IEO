/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import Bcryst.BCrypt;
import dal.DBContext;
import Model.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Date;
import java.sql.Statement;
import java.sql.SQLException;
import javax.lang.model.util.Types;

/**
 *
 * @author Nguyen Duc Tuan
 */
public class UserDAO extends DBContext {

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

   public User login(String email, String password) {
    User user = getUserByEmail(email);
    if (user == null) {
        System.out.println("User not found with email: " + email);
        return null;
    }
    // Laays mk db
    String hashedPassword = user.getPassword();
    
    // So sánh mk nhập vào với mk đã mã hóa trong db
    if (BCrypt.checkpw(password, hashedPassword)) {
        try {
            System.out.println("Login successful for user: " + email);
            con = new DBContext().getConnection();
            if (con == null) {
                System.out.println("Failed to get database connection");
                return null;
            }
            
            String sql = "SELECT * FROM Users WHERE email = ?";
            ps = con.prepareStatement(sql);
            ps.setString(1, email);
            rs = ps.executeQuery();
            
            if (rs.next()) {
                user.setId(rs.getInt(1));
                user.setName(rs.getString(2));
                user.setEmail(rs.getString(3));
                user.setBirthdate(rs.getDate(5));
                user.setPhone(rs.getString(6));
                user.setCreatedAt(rs.getDate(7));
                user.setLastLogin(rs.getDate(8));

                // Cập nhật thời gian đăng nhập cuối cùng
                updateLastLoginTime(user.getId());

                return user;
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
    } else {
        System.out.println("Invalid password for user: " + email);
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
            ps.setString(3, BCrypt.hashpw(password, BCrypt.gensalt()));

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
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (con != null) {
                    con.close();
                }
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
                user.setPhone(rs.getString(5));
                user.setBirthdate(rs.getDate(6));
  
                System.out.println("Found user with email: " + email);
                return user;
            } else {
                System.out.println("No user found with email: " + email);
                
            }
        } catch (Exception e) {
            System.out.println("Error getting user by email: " + e.getMessage());
            e.printStackTrace();
        }
        return null;
    }

    public User getUserById(int Id) {
        String sql = "Select * from [Users] where user_id = ?";
        try {
            // Khởi tạo connection
            con = new DBContext().getConnection();
            if (con == null) {
                System.out.println("Failed to get database connection in getUserById");
                return null;
            }

            ps = con.prepareStatement(sql);
            ps.setInt(1, Id);
            rs = ps.executeQuery();

            System.out.println("Executing getUserById for ID: " + Id);

            if (rs.next()) {
                User user = new User(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getDate(5),
                        rs.getDate(6),
                        rs.getString(7),
                        rs.getDate(8)
                );
                System.out.println("Found user with ID: " + Id);
                return user;
            } else {
                System.out.println("No user found with ID: " + Id);
            }
        } catch (Exception e) {
            System.out.println("Error in getUserById: " + e.getMessage());
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (Exception e) {
                System.out.println("Error closing connections: " + e.getMessage());
            }
        }
        return null;
    }

    private int updateLastLoginTime(int userId) {
        String sql = "UPDATE Users SET last_login = ? WHERE [user_id] = ?";
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

        }
        return 0;
    }

    public void updatePassword(String email, String newPassword) {

        String sql = "UPDATE [Users] SET [password] = ? WHERE [email] = ?";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, newPassword);
            ps.setString(2, email);
            int result = ps.executeUpdate();

        } catch (Exception e) {
            System.out.println("Error updating password: " + e.getMessage());

        }
    }

    public boolean createUserWithGG(User user, int roleId) throws Exception {
        String sqlUser = "INSERT INTO Users (full_name, email, password) VALUES (?, ?, ?)";
        String sqlRole = "INSERT INTO Role (user_id, role) VALUES (?, 1)";

        try {
            con = new DBContext().getConnection();
            if (con == null) {
                System.out.println("Failed to get database connection");
                return false;
            }

            con.setAutoCommit(false); // Bắt đầu transaction

            //Them 1 user vao db
            ps = con.prepareStatement(sqlUser, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            ps.setString(3, ""); // Google Login không cần mật khẩu

            int result = ps.executeUpdate();
            if (result > 0) {
                rs = ps.getGeneratedKeys();
                if (rs.next()) {
                    int userId = rs.getInt(1);
                    user.setId(userId); // Lưu ID mới vào User object

                    ps.close(); // Đóng ps trước khi mở lại
                    ps = con.prepareStatement(sqlRole);
                    ps.setInt(1, userId);
                    ps.setInt(2, roleId); // 1 = Học sinh
                    ps.executeUpdate();

                    con.commit();
                    System.out.println("Google user created successfully with user_id: " + userId);
                    return true;
                }
            }

            // Nếu có lỗi, rollback transaction
            con.rollback();
            System.out.println("Failed to insert Google user.");
        } catch (SQLException e) {
            try {
                if (con != null) {
                    con.rollback(); // Rollback nếu có lỗi
                }
            } catch (SQLException rollbackEx) {
                rollbackEx.printStackTrace();
            }
            e.printStackTrace();
        } finally {
            // Đảm bảo đóng tài nguyên
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return false;
    }

  public void updateProfile(User user) throws Exception {
    String sql = "UPDATE [dbo].[Users] SET [full_name] = ?, [email] = ?, [password] = ?, [phone] = ?, [birthdate] = ? WHERE user_id = ?";
    Connection con = null;
    PreparedStatement ps = null;
    try {
        con = new DBContext().getConnection();
        
        // Kiểm tra nếu người dùng thay đổi mật khẩu thì mã hóa
        String hashedPassword = user.getPassword();
        if (hashedPassword != null && !hashedPassword.isEmpty()) {
            hashedPassword = BCrypt.hashpw(hashedPassword, BCrypt.gensalt()); // Mã hóa mật khẩu
        } else {
            // Nếu không nhập mật khẩu mới, giữ nguyên mật khẩu cũ
            String queryPass = "SELECT password FROM Users WHERE user_id = ?";
            try (PreparedStatement psGet = con.prepareStatement(queryPass)) {
                psGet.setInt(1, user.getId());
                ResultSet rs = psGet.executeQuery();
                if (rs.next()) {
                    hashedPassword = rs.getString("password");
                }
            }
        }

        ps = con.prepareStatement(sql);
        ps.setString(1, user.getName());
        ps.setString(2, user.getEmail());
        ps.setString(3, hashedPassword);
        ps.setString(4, user.getPhone());
        ps.setDate(5, new java.sql.Date(user.getBirthdate().getTime()));
    

        ps.setInt(6, user.getId());
        ps.executeUpdate();

        System.out.println("Profile updated successfully for user ID: " + user.getId());
    } catch (SQLException e) {
        System.out.println("Error updating profile: " + e.getMessage());
        e.printStackTrace();
        throw e; 
    } finally {
        try {
            if (ps != null) ps.close();
            if (con != null) con.close();
        } catch (SQLException e) {
            System.out.println("Error closing resources: " + e.getMessage());
        }
    }
}
    public static void main(String[] args) {
         UserDAO userDAO = new UserDAO(); 

        int testUserId = 19; 

        User user = userDAO.getUserById(testUserId); 

        if (user != null) {
            System.out.println("User found:");
            System.out.println("ID: " + user.getId());
            System.out.println("Name: " + user.getName());
            System.out.println("Email: " + user.getEmail());
            System.out.println("Password: " + user.getPassword());
            System.out.println("Phone: " + user.getPhone());
            System.out.println("Birthdate: " + user.getBirthdate());
        } else {
            System.out.println("No user found with ID: " + testUserId);
        }
    }
    
}
