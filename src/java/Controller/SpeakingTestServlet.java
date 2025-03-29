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
import dal.Answer_Listening_ChooseAnswerDAO;
import dal.Answer_Listening_WriteDAO;
import dal.Answer_ReadingDAO;
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
        String topic = request.getParameter("topic");
        int topic_id = Integer.parseInt(topic);
        String test = request.getParameter("test_id");
        int test_id = Integer.parseInt(test);  
        Enumeration<String> parameterNames = request.getParameterNames();
        while (parameterNames.hasMoreElements()) {
            String paramName = parameterNames.nextElement();
            if (paramName.startsWith("answer_choose_")) {
                try {
                    String questListenChoose_id_str = paramName.substring("answer_choose_".length());
                    int questListenChoose_id = Integer.parseInt(questListenChoose_id_str);
                    String content_Answer = request.getParameter(paramName);
                    if (content_Answer != null && !content_Answer.isEmpty()) {
                        Answer_Listening_ChooseAnswerDAO dao = new Answer_Listening_ChooseAnswerDAO();
                        int answerId = dao.insertAnswer_Listening_ChooseAnswerDAO(questListenChoose_id, test_id, content_Answer);
                        if (answerId <= 0) {
                            
                        }
                    } else {
                        Answer_Listening_ChooseAnswerDAO dao = new Answer_Listening_ChooseAnswerDAO();
                        int answerId = dao.insertAnswer_Listening_ChooseAnswerDAO(questListenChoose_id, test_id, content_Answer);
                    }
                } catch (NumberFormatException e) {
                    response.sendError(HttpServletResponse.SC_NOT_FOUND,e.getMessage());
                }
            }
            if (paramName.startsWith("answer_write_")) {
                try {
                    String questListenWrite_id_str = paramName.substring("answer_write_".length());
                    int questListenWrite_id = Integer.parseInt(questListenWrite_id_str);
                    String content_Answer = request.getParameter(paramName);
                    if (content_Answer != null && !content_Answer.isEmpty()) {
                        Answer_Listening_WriteDAO dao = new Answer_Listening_WriteDAO();
                        int answerId = dao.insertAnswer_Listening_WriteDAO(questListenWrite_id, test_id, content_Answer);
                        if (answerId <= 0) {
                            
                        }
                    } else {
                        Answer_Listening_WriteDAO dao = new Answer_Listening_WriteDAO();
                        int answerId = dao.insertAnswer_Listening_WriteDAO(questListenWrite_id, test_id, content_Answer);
                    }
                } catch (NumberFormatException e) {
                    response.sendError(HttpServletResponse.SC_NOT_FOUND,e.getMessage());
                }
            }
        }
        
        
        List<Speaking> lstspeak = new ArrayList<>();
        List<Questions_Speaking> lstqs = new ArrayList<>();
        SpeakingDAO speakdao = new SpeakingDAO();
        Questions_SpeakingDAO qsdao = new Questions_SpeakingDAO();
        lstspeak = speakdao.GetAllSpeaking();
        lstqs = qsdao.GetAllQuestions_Speaking();
        Speaking speak = new Speaking();
        for (int i = 0; i < lstspeak.size(); i++) {
            if(lstspeak.get(i).getTopic_id()== topic_id){
                speak = lstspeak.get(i);
            }
        }
        List<Questions_Speaking> lstqspeak = new ArrayList<>();
        for (int i = 0; i < lstqs.size(); i++) {
            if(lstqs.get(i).getSpeak_id()==speak.getSpeak_id()){
                lstqspeak.add(lstqs.get(i));
            }
        }
        request.setAttribute("topic", topic);
        request.setAttribute("test_id", test_id);
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
