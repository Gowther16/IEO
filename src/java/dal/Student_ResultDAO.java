/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import Model.Student_Results;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.sql.Statement;
/**
 *
 * @author bangc
 */
public class Student_ResultDAO {
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<Student_Results> getAllStudentResults(){
        List<Student_Results> list = new ArrayList<>();
        String sql = "SELECT * FROM [dbo].[Student_Results]";
        try {
            con = new DBContext().getConnection();
             ps = con.prepareStatement(sql);
             rs = ps.executeQuery();
            while (rs.next()) {
                Student_Results result = new Student_Results();
                result.setResult_id(rs.getInt("result_id"));
                result.setUser_id(rs.getInt("user_id"));
                result.setTest_id(rs.getInt("test_id"));
                result.setScore(rs.getInt("score"));
                list.add(result);
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
    public int insertStudentResult(int User_id,int Test_id,int Score) {
        String sql = "INSERT INTO [dbo].[Student_Results] (user_id, test_id, score, completed_at) VALUES (?, ?, ?, ?)";
        int sr =0;
        try{
             con = new DBContext().getConnection();
             ps = con.prepareStatement(sql);
            ps.setInt(1, User_id);
            ps.setInt(2, Test_id);
            ps.setInt(3, Score);
            int result = ps.executeUpdate();
            if (result > 0) {
                rs = ps.getGeneratedKeys();
                if (rs.next()) {
                    sr = rs.getInt(1);
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
        return sr;
    }
}
