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

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public TokenForgetDAO() {
        try {
            con = getConnection();
        } catch (Exception ex) {
            System.out.println("Error establishing database connection: " + ex.getMessage());
        }
    }

    public String getFormatDate(LocalDateTime myDateObj) {
        DateTimeFormatter myFormatObj = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        String formattedDate = myDateObj.format(myFormatObj);
        return formattedDate;
    }

    public boolean insertTokenForget(TokenForgetPassword tokenForget) {
        String sql = "INSERT INTO [dbo].[ForgetPassword]\n"
                + "           ([token]\n"
                + "           ,[expiryTime]\n"
                + "           ,[isUsed]\n"
                + "           ,[user_id])\n"
                + "     VALUES(?, ?, ?, ?)";
        try {
            if (con == null) {
                System.out.println("Connection is null, attempting to reconnect...");
                con = getConnection();
                if (con == null) {
                    System.out.println("Failed to establish database connection");
                    return false;
                }
            }
            
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, tokenForget.getToken());
            
            // Convert LocalDateTime to Timestamp
            LocalDateTime expiryTime = tokenForget.getExpiryTime();
            if (expiryTime != null) {
                ps.setTimestamp(2, Timestamp.valueOf(expiryTime));
            } else {
                System.out.println("ExpiryTime is null!");
                return false;
            }
            
            ps.setBoolean(3, tokenForget.isIsUsed());
            ps.setInt(4, tokenForget.getUserId());

            int result = ps.executeUpdate();
            System.out.println("Insert result: " + result);
            return result > 0;
        } catch (SQLException e) {
            System.out.println("SQL Error inserting token: " + e.getMessage());
            e.printStackTrace();
        } catch (Exception e) {
            System.out.println("General Error inserting token: " + e.getMessage());
            e.printStackTrace();
        }
        return false;
    }

    public TokenForgetPassword getTokenPassword(String token) {
        String sql = "Select * from [ForgetPassword] where token = ?";
        try {
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, token);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new TokenForgetPassword(
                        rs.getInt("id"),
                        rs.getInt("userId"),
                        rs.getString("token"),
                        rs.getBoolean("isUsed"),
                        rs.getTimestamp("expiryTime").toLocalDateTime()
                );
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void updateStatus(TokenForgetPassword token) {
        System.out.println("token = " + token);
        String sql = "UPDATE [dbo].[ForgetPassword]\n"
                + "   SET [isUsed] = ?\n"
                + " WHERE token = ?";
        try {
            PreparedStatement st = con.prepareStatement(sql);
            st.setBoolean(1, token.isIsUsed());
            st.setString(2, token.getToken());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

}
