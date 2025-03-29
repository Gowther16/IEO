/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import Model.Writing;
import dal.Answer_SpeakingDAO;
import dal.Answer_WritingDAO;
import dal.WritingDAO;
import java.io.File;
import java.util.*;

/**
 *
 * @author bangc
 */
public class WritingTestServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet TakeTestServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet TakeTestServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String topic = request.getParameter("topic");
        int topic_id = Integer.parseInt(topic);
        String test = request.getParameter("test_id");
        int test_id = Integer.parseInt(test);
        String speak = request.getParameter("speak_id");
        int write_id = Integer.parseInt(speak);
        String answer = request.getParameter("video");
        Answer_SpeakingDAO dao = new Answer_SpeakingDAO();
        int ans_write = dao.insertAnswer_SpeakingDAO(write_id, test_id, answer);

        List<Writing> lstwrite = new ArrayList<>();
        WritingDAO writedao = new WritingDAO();
        lstwrite = writedao.GetAllWriting();
        Writing write_print = new Writing();
        for (int i = 0; i < lstwrite.size(); i++) {
            if(lstwrite.get(i).getTopic_id()==topic_id){
                write_print = lstwrite.get(i);
            }
        }
        
        request.setAttribute("topic", topic);
        request.setAttribute("test_id", test_id);
        request.setAttribute("writing", write_print);
        request.getRequestDispatcher("WritingTest.jsp").forward(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
