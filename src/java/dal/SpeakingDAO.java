/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import Model.Speaking;
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
public class SpeakingDAO {
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    
    public List<Speaking> GetAllSpeaking(){
        List<Speaking> list = new ArrayList<>();
        String sql = "select * from Speaking";
        try{
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                list.add(new Speaking(rs.getInt(1),rs.getInt(2),rs.getInt(3)));
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
    public int InsertSpeaking(int topic_id,int duration) {
        int speak = 0;
        String sql = "INSERT INTO [Speaking]  VALUES (?,?)";
        try{
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, topic_id);
            ps.setInt(2, duration);
            int result = ps.executeUpdate();
            if (result > 0) {
                rs = ps.getGeneratedKeys();
                if (rs.next()) {
                    speak = rs.getInt(1);
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
        return speak;
    }
}
