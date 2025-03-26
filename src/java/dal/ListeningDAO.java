/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import Model.Listening;
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
public class ListeningDAO {
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    
    public List<Listening> GetAllListening(){
        List<Listening> list = new ArrayList<>();
        String sql = "select * from Listening";
        try{
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                list.add(new Listening(rs.getInt(1),rs.getInt(2),rs.getInt(3),rs.getString(4)));
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
    public int InsertListening(int topic_id,int duration,String audio) {
        int listen = 0;
        String sql = "INSERT INTO [Listening]  VALUES (?,?,?)";
        try{
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, topic_id);
            ps.setInt(2, duration);
            ps.setString(3, audio);
            int result = ps.executeUpdate();
            if (result > 0) {
                rs = ps.getGeneratedKeys();
                if (rs.next()) {
                    listen = rs.getInt(1);
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
        return listen;
    }
}


