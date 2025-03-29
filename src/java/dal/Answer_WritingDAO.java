/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import Model.Answer_Writing;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author bangc
 */
public class Answer_WritingDAO {
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    public List<Answer_Writing> getAllAnswerWriting() {
        List<Answer_Writing> list = new ArrayList<>();
        String sql = "SELECT * FROM [dbo].[Answer_Writing]";
        try {
            
             ps = con.prepareStatement(sql);
             rs = ps.executeQuery();
            while (rs.next()) {
                Answer_Writing answer = new Answer_Writing();
                answer.setAnswer_id(rs.getInt("answer_id"));
                answer.setWrite_id(rs.getInt("write_id"));
                answer.setTest_id(rs.getInt("test_id"));
                answer.setContent_Answer(rs.getString("Content_Answer"));
                list.add(answer);
            }
        }catch (Exception e) {
            System.out.println("Error retrieving answers: " + e.getMessage());
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (Exception e) {
                System.out.println("Error closing connections: " + e.getMessage());
            }
        }
        return list;
    }
    public int insertAnswer_WriteDAO(int questWrite_id,int test_id,String content_Answer){
        int ans_Write=0;
        String sql = "INSERT INTO [Answer_Writing]  VALUES (?,?,?)";
        try{
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, questWrite_id);
            ps.setInt(2, test_id);
            ps.setString(3, content_Answer);
            int result = ps.executeUpdate();
            if (result > 0) {
                rs = ps.getGeneratedKeys();
                if (rs.next()) {
                    ans_Write = rs.getInt(1);
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
        return ans_Write;
    }
}
