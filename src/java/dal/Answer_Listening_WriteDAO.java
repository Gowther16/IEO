/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author bangc
 */
public class Answer_Listening_WriteDAO {
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    public int insertAnswer_Listening_WriteDAO(int questListen_Write_id,int test_id,String content_Answer){
        int ans_Listen_Write=0;
        String sql = "INSERT INTO [Answer_Listening_Write]  VALUES (?,?,?)";
        try{
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, questListen_Write_id);
            ps.setInt(2, test_id);
            ps.setString(3, content_Answer);
            int result = ps.executeUpdate();
            if (result > 0) {
                rs = ps.getGeneratedKeys();
                if (rs.next()) {
                    ans_Listen_Write = rs.getInt(1);
                }
            }
        }catch(Exception e){
            System.out.println(e.getMessage());
        }finally{
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (Exception e) {
                System.out.println("Error closing connections: " + e.getMessage());
            }
        }
        return ans_Listen_Write;
    }
}
