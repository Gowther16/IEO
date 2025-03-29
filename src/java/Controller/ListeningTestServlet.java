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
import Model.Listening;
import Model.Questions_Listening_ChooseAnswer;
import Model.Questions_Listening_Write;
import dal.Answer_ReadingDAO;
import dal.ListeningDAO;
import dal.Questions_Listening_ChooseAnswerDAO;
import dal.Questions_Listening_WriteDAO;
import java.io.File;
import java.io.InputStream;
import java.util.*;
/**
 *
 * @author bangc
 */
public class ListeningTestServlet extends HttpServlet {

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
            if (paramName.startsWith("answer_")) {
                try {
                    String questRead_id_str = paramName.substring("answer_".length());
                    int questRead_id = Integer.parseInt(questRead_id_str);
                    String content_Answer = request.getParameter(paramName);
                    if (content_Answer != null && !content_Answer.isEmpty()) {
                        Answer_ReadingDAO dao = new Answer_ReadingDAO();
                        int answerId = dao.insertAnswer_ReadingDAO(questRead_id, test_id, content_Answer);
                        if (answerId <= 0) {
                            
                        }
                    } else {
                        Answer_ReadingDAO dao = new Answer_ReadingDAO();
                        int answerId = dao.insertAnswer_ReadingDAO(questRead_id, test_id, content_Answer);
                    }
                } catch (NumberFormatException e) {
                    response.sendError(HttpServletResponse.SC_NOT_FOUND,e.getMessage());
                }
            }
        }
        
        
        
        List<Listening> lstlisten = new ArrayList<>();
        List<Questions_Listening_ChooseAnswer> lstqlchoose = new ArrayList<>();
        List<Questions_Listening_Write> lstqlw = new ArrayList<>();
        ListeningDAO listendao = new ListeningDAO();
        Questions_Listening_ChooseAnswerDAO qlchoosedao = new Questions_Listening_ChooseAnswerDAO();
        Questions_Listening_WriteDAO qlwdao = new Questions_Listening_WriteDAO();
        lstlisten = listendao.GetAllListening();
        lstqlchoose = qlchoosedao.GetAllQuestions_Listening_ChooseAnswer();
        lstqlw = qlwdao.GetAllQuestions_Listening_Write();
        Listening listen = new Listening();
        for (int i = 0; i < lstlisten.size(); i++) {
            if(lstlisten.get(i).getTopic_id()==topic_id){
                listen = lstlisten.get(i);
            }
        }
        List<Questions_Listening_ChooseAnswer> qlchoose = new ArrayList<>();
        List<Questions_Listening_Write> qlw = new ArrayList<>();
        for (int i = 0; i < lstqlchoose.size(); i++) {
            if(lstqlchoose.get(i).getListen_id()==listen.getListen_id()){
                qlchoose.add(lstqlchoose.get(i));
            }
        }
        for (int i = 0; i < lstqlw.size(); i++) {
            if(lstqlw.get(i).getListen_id()==listen.getListen_id()){
                qlw.add(lstqlw.get(i));
            }
        }
        listen.getVideo_listen();
        request.setAttribute("topic", topic);
        request.setAttribute("test_id", test_id);
        request.setAttribute("listening", listen);
        request.setAttribute("qlchoose", qlchoose);
        request.setAttribute("qlw", qlw);
        request.getRequestDispatcher("ListeningTest.jsp").forward(request, response);
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
