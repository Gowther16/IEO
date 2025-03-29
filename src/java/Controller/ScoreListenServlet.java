/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.Answer_Listening_ChooseAnswer;
import Model.Answer_Listening_Write;
import Model.Answer_Reading;
import Model.Questions_Listening_ChooseAnswer;
import Model.Questions_Reading;
import Model.Student_Results;
import Model.Tests;
import Model.User;
import dal.Answer_Listening_ChooseAnswerDAO;
import dal.Answer_Listening_WriteDAO;
import dal.Answer_ReadingDAO;
import dal.Point_ListeningDAO;
import dal.Point_ReadingDAO;
import dal.Questions_Listening_ChooseAnswerDAO;
import dal.Questions_ReadingDAO;
import dal.Student_ResultDAO;
import dal.TestsDAO;
import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author bangc
 */
public class ScoreListenServlet extends HttpServlet {

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
            out.println("<title>Servlet ScoreListenServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ScoreListenServlet at " + request.getContextPath() + "</h1>");
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
        String test = request.getParameter("test_id");
        int test_id = Integer.parseInt(test);
        TestsDAO testdao = new TestsDAO();
        List<Tests> lsttest = testdao.GetAllTests();
        Tests test1 = new Tests();
        for (int i = 0; i < lsttest.size(); i++) {
            if(lsttest.get(i).getTest_id()==test_id){
                test1=lsttest.get(i);
            }
        }
        UserDAO ud = new UserDAO();
        User lu = ud.getUserById(test1.getUser_id());
        
        
        User user = (User) request.getSession().getAttribute("user");
       List<Answer_Reading> ar =(List<Answer_Reading>) request.getAttribute("ard");
        int count=0;
        Questions_ReadingDAO qrd = new Questions_ReadingDAO();
        List<Questions_Reading> lstquest_read= new ArrayList<>();
        Questions_ReadingDAO quest_readdao = new Questions_ReadingDAO();
        lstquest_read = quest_readdao.GetAllQuestion_Reading();
        for (int i = 0; i < ar.size(); i++) {
            for (int j = 0; j < lstquest_read.size(); j++) {
                if(lstquest_read.get(j).getQuestRead_id()==ar.get(i).getQuestRead_id()){
                    if(ar.get(i).getContent_Answer()==lstquest_read.get(j).getCorrect_answer()){
                        count++;
                    }
                }
            } 
        }
        Student_ResultDAO srd = new Student_ResultDAO();
        int srd_id = srd.insertStudentResult(lu.getId(), test_id, 0);
        Point_ReadingDAO prd = new Point_ReadingDAO();
        prd.InsertPoint_Reading(user.getId(), count, srd_id);
        
        List<Questions_Listening_ChooseAnswer> qlch = new ArrayList<>();
        Questions_Listening_ChooseAnswerDAO qlchdao = new Questions_Listening_ChooseAnswerDAO();
        qlch = qlchdao.GetAllQuestions_Speaking();
        List<Answer_Listening_ChooseAnswer> lalch = new ArrayList<>();
        Answer_Listening_ChooseAnswerDAO alcha = new Answer_Listening_ChooseAnswerDAO();
        lalch = alcha.getAllAnswerListeningChooseAnswer();
        
        List<Answer_Listening_ChooseAnswer> alch = new ArrayList<>();
        for (int i = 0; i < lalch.size(); i++) {
            if(lalch.get(i).getTest_id()==test_id){
                alch.add(lalch.get(i));
            }
        }
        int countL=0;
        for (int i = 0; i <alch.size(); i++) {
            for (int j = 0; j < qlch.size(); j++) {
                if(qlch.get(j).getQuestListen_id()==alch.get(i).getQuestListen_id()){
                    if(alch.get(i).getContent_Answer()==lstquest_read.get(j).getCorrect_answer()){
                        countL++;
                    }
                }
            } 
        }
        List<Answer_Listening_Write> lalb = new ArrayList<>();
        Answer_Listening_WriteDAO alw = new Answer_Listening_WriteDAO();
        lalb = alw.getAllAnswerListeningWrite();
        List<Answer_Listening_Write> alb = new ArrayList<>();
        for (int i = 0; i < lalch.size(); i++) {
            if(lalb.get(i).getTest_id()==test_id){
                alb.add(lalb.get(i));
            }
        }
        request.setAttribute("alw", alb);
        request.setAttribute("mark", countL);
        request.setAttribute("srd_id", srd_id);
        request.setAttribute("test_id", test_id);
        request.getRequestDispatcher("ScoreListen.jsp").forward(request, response);
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
