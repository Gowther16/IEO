/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal; 
import Model.Writing;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;

/**
 *
 * @author bangc
 */
public class WritingDAO {
    
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    
    public List<Writing> GetAllWriting(){
        List<Writing> list = new ArrayList<>();
        String sql = "select * from Writing";
        try{
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                list.add(new Writing(rs.getInt(1),rs.getInt(2),rs.getInt(3),rs.getString(4),rs.getString(5)));
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
