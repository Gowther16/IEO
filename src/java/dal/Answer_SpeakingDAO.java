/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import Model.Answer_Speaking;
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
public class Answer_SpeakingDAO {
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    public List<Answer_Speaking> getAllAnswerSpeaking(){
        List<Answer_Speaking> list = new ArrayList<>();
        String sql = "SELECT * FROM [dbo].[Answer_Speaking]";
        try {
            con = new DBContext().getConnection();
             ps = con.prepareStatement(sql);
             rs = ps.executeQuery();
            while (rs.next()) {
                Answer_Speaking answer = new Answer_Speaking();
                answer.setAnswer_id(rs.getInt("answer_id"));
                answer.setQuest_Speak(rs.getInt("quest_Speak"));
                answer.setTest_id(rs.getInt("test_id"));
                answer.setContent_Answer(rs.getString("Content_Answer"));
                list.add(answer);
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
        
        return list;
    }
    public int insertAnswer_SpeakingDAO(int questSpeak_id,int test_id,String content_Answer){
        int ans_Speak=0;
        String sql = "INSERT INTO [Answer_Speaking]  VALUES (?,?,?)";
        try{
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, questSpeak_id);
            ps.setInt(2, test_id);
            ps.setString(3, content_Answer);
            int result = ps.executeUpdate();
            if (result > 0) {
                rs = ps.getGeneratedKeys();
                if (rs.next()) {
                    ans_Speak = rs.getInt(1);
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
        return ans_Speak;
    }
}
