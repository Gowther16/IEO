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

                String sql = "SELECT u.*, r.role FROM Users u JOIN Role r ON u.user_id = r.user_id WHERE u.email = ? ";
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
                    user.setRole(rs.getInt("role"));

                    // Cập nhật thời gian đăng nhập cuối cùng
                    updateLastLoginTime(user.getId());

                    return user;
                }
            } catch (Exception e) {
                System.out.println("Error at login: " + e.getMessage());
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

    public User getUserByUsername(String username) throws SQLException, Exception {
        String query = "SELECT * FROM Users WHERE full_name = ?";
        try (Connection con = getConnection(); PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new User(
                        rs.getInt("user_id"),
                        rs.getString("full_name"),
                        rs.getString("email")
                );
            }
        }
        return null;
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
                try {
                    java.sql.Date birthdate = rs.getDate("Bithdate");
                    user.setBirthdate(birthdate);
                } catch (SQLException e) {

                    user.setBirthdate(null);
                    System.out.println("Warning: Invalid date format in Bithdate column for user: " + email);
                }

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

    public int getUserIdByUsername(String username) throws Exception {
        int userId = 0;
        String query = "SELECT user_id FROM user WHERE full_name = ?";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(query);
            ps.setString(1, username);
            rs = ps.executeQuery();
            if (rs.next()) {
                userId = rs.getInt("user_id");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new Exception("Error while retrieving user_id: " + e.getMessage());
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return userId;
    }

    public User getUserById(int Id) {
        String sql = "select u.*, r.role from Users u inner join Role r on u.user_id = r.user_id where u.user_id = ?";
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
                User user;
                user = new User(
                        rs.getInt("user_id"),
                        rs.getString("full_name"),
                        rs.getString("email"),
                        rs.getString("password"),
                        rs.getDate("Bithdate"),
                        rs.getString("phoneNumber"),
                        rs.getDate("created_at"),
                        rs.getDate("last_login")
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

    public int updateLastLoginTime(int userId) {
        String sql = "UPDATE Users SET last_login = ? WHERE [user_id] = ?";
        try {
            System.out.println("Updating last login for user: " + userId);
            con = new DBContext().getConnection();
            if (con == null) {
                System.out.println("Failed to get database connection");
                return 0;
            }
            ps = con.prepareStatement(sql);
            ps.setTimestamp(1, new java.sql.Timestamp(System.currentTimeMillis()));
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
        String sql = "UPDATE [dbo].[Users] SET [full_name] = ?, [email] = ?, [password] = ?, [Bithdate] = ?, [phoneNumber] = ? WHERE user_id = ?";
        Connection con = null;
        PreparedStatement ps = null;

        try {
            con = new DBContext().getConnection();

            // Lấy mật khẩu từ user
            String password = user.getPassword();

            // Nếu mật khẩu chưa mã hóa, thì mới hash
            String hashedPassword;
            if (password != null && !password.isEmpty() && !password.startsWith("$2a$")) {
                hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());
            } else if (password != null && !password.isEmpty()) {
                hashedPassword = password; // đã được hash rồi
            } else {
                // Nếu không có mật khẩu mới, lấy lại mật khẩu cũ từ DB
                String queryPass = "SELECT password FROM Users WHERE user_id = ?";
                try (PreparedStatement psGet = con.prepareStatement(queryPass)) {
                    psGet.setInt(1, user.getId());
                    ResultSet rs = psGet.executeQuery();
                    if (rs.next()) {
                        hashedPassword = rs.getString("password");
                    } else {
                        throw new Exception("Không tìm thấy mật khẩu người dùng!");
                    }
                }
            }

            ps = con.prepareStatement(sql);
            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            ps.setString(3, hashedPassword);

            // Handle birthdate
            if (user.getBirthdate() != null) {
                ps.setDate(4, new java.sql.Date(user.getBirthdate().getTime()));
            } else {
                ps.setNull(4, java.sql.Types.DATE);
            }

            ps.setString(5, user.getPhone());
            ps.setInt(6, user.getId());

            ps.executeUpdate();

            System.out.println("✅ Profile updated successfully for user ID: " + user.getId());

        } catch (SQLException e) {
            System.out.println("❌ Error updating profile: " + e.getMessage());
            e.printStackTrace();
            throw e;
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                System.out.println("⚠ Error closing resources: " + e.getMessage());
            }
        }
    }
    public boolean checkEmailExists(String email) throws SQLException, Exception {
    String sql = "SELECT 1 FROM Users WHERE email = ?";
    try (Connection conn = new DBContext().getConnection();
         PreparedStatement ps = conn.prepareStatement(sql)) {
        ps.setString(1, email);
        try (ResultSet rs = ps.executeQuery()) {
            return rs.next();
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
