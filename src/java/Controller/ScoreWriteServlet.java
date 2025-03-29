/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.Answer_Reading;
import Model.Answer_Writing;
import Model.Questions_Reading;
import Model.Tests;
import Model.User;
import Model.Writing;
import dal.Answer_ReadingDAO;
import dal.Answer_WritingDAO;
import dal.Point_SpeakingDAO;
import dal.Questions_ReadingDAO;
import dal.TestsDAO;
import dal.WritingDAO;
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
public class ScoreWriteServlet extends HttpServlet {

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
            out.println("<title>Servlet ScoreWriteServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ScoreWriteServlet at " + request.getContextPath() + "</h1>");
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
        User user = (User) request.getSession().getAttribute("user");
        String srd = request.getParameter("srd_id");
        int srd_id = Integer.parseInt(srd);
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
        String m= request.getParameter("mark");
        int mark =Integer.parseInt(m);
        Point_SpeakingDAO psd = new Point_SpeakingDAO();
        psd.InsertPoint_Speaking(user.getId(), mark, srd_id);
        
        Answer_WritingDAO awd = new Answer_WritingDAO();
        List<Answer_Writing> law = awd.getAllAnswerWriting();
        Answer_Writing aw = new Answer_Writing();
        for (int i = 0; i < law.size(); i++) {
            if(law.get(i).getTest_id()==test_id){
                aw=law.get(i);
            }
        }
        WritingDAO qwd = new WritingDAO();
        List<Writing> lw = qwd.GetAllWriting();
        Writing w = new Writing();
        request.setAttribute("w", w);
        request.setAttribute("aw", aw);
        request.setAttribute("srd_id", srd_id);
        request.setAttribute("test_id", test_id);
        request.getRequestDispatcher("ScoreWrite.jsp").forward(request, response);
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
