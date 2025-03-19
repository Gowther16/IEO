/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import Model.Questions_Listening_ChooseAnswer;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author bangc
 */
public class Questions_Listening_ChooseAnswerDAO {
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    
    public List<Questions_Listening_ChooseAnswer> GetAllQuestions_Speaking(){
        List<Questions_Listening_ChooseAnswer> list = new ArrayList<>();
        String sql = "select * from Questions_Listening_ChooseAnswer";
        try{
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                list.add(new Questions_Listening_ChooseAnswer(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getInt(6)));
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
}
