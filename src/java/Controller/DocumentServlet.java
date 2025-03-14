/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.Document;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet(name = "DocumentServlet", urlPatterns = {"/DocumentServlet"})
public class DocumentServlet extends HttpServlet {
    private static final String JDBC_URL = "jdbc:sqlserver://localhost:1433;databaseName=SWP_PROJECT";
    private static final String JDBC_USER = "sa";
    private static final String JDBC_PASSWORD = "sa";
    
    

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            List<Document> documents = getDocuments();
            for (Document doc : documents) {
                out.println("<p>ID: " + doc.getId() + " - Title: " + doc.getTitle() + "</p>");
            }
        }
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("add".equals(action)) {
            addDocument(request.getParameter("title"), request.getParameter("content"), Integer.parseInt(request.getParameter("t_id")));
        } else if ("update".equals(action)) {
            updateDocument(Integer.parseInt(request.getParameter("d_id")), request.getParameter("title"), request.getParameter("content"));
        } else if ("delete".equals(action)) {
            deleteDocument(Integer.parseInt(request.getParameter("d_id")));
        }
        response.sendRedirect("DocumentServlet");
    }
    private List<Document> getDocuments() {
        List<Document> list = new ArrayList<>();
        try (Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT * FROM Document")) {
            while (rs.next()) {
                list.add(new Document(rs.getInt("d_id"), rs.getString("Title"), rs.getString("content"), rs.getInt("t_id")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    
    private void addDocument(String title, String content, int t_id) {
        String sql = "INSERT INTO Document (Title, content, t_id) VALUES (?, ?, ?)";
        try (Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, title);
            pstmt.setString(2, content);
            pstmt.setInt(3, t_id);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    private void updateDocument(int d_id, String title, String content) {
        String sql = "UPDATE Document SET Title = ?, content = ? WHERE d_id = ?";
        try (Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, title);
            pstmt.setString(2, content);
            pstmt.setInt(3, d_id);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    private void deleteDocument(int d_id) {
        String sql = "DELETE FROM Document WHERE d_id = ?";
        try (Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, d_id);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
