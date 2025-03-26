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
import Model.Reading;
import Model.Questions_Reading;
import Model.Questions_Speaking;
import Model.Speaking;
import dal.ReadingDAO;
import dal.Questions_ReadingDAO;
import dal.Questions_SpeakingDAO;
import dal.SpeakingDAO;
import java.util.*;
/**
 *
 * @author bangc
 */
public class SpeakingTestServlet extends HttpServlet {

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
        List<Speaking> lstspeak = new ArrayList<>();
        List<Questions_Speaking> lstqs = new ArrayList<>();
        SpeakingDAO speakdao = new SpeakingDAO();
        Questions_SpeakingDAO qsdao = new Questions_SpeakingDAO();
        lstspeak = speakdao.GetAllSpeaking();
        lstqs = qsdao.GetAllQuestions_Speaking();
        Speaking speak = lstspeak.get(0);
        List<Questions_Speaking> lstqspeak = new ArrayList<>();
        for (int i = 0; i < lstqs.size(); i++) {
            if(lstqs.get(i).getSpeak_id()==speak.getSpeak_id()){
                lstqspeak.add(lstqs.get(i));
            }
        }
        request.setAttribute("speaking", speak);
        request.setAttribute("lstqspeak", lstqspeak);
        request.getRequestDispatcher("SpeakingTest.jsp").forward(request, response);
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
