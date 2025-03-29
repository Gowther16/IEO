/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.Exam;
import Model.Point_Listening;
import Model.Point_Reading;
import Model.Point_Speaking;
import Model.Point_Writing;
import Model.User;
import dal.ExamDAO;
import dal.Point_ListeningDAO;
import dal.Point_ReadingDAO;
import dal.Point_SpeakingDAO;
import dal.Point_WritingDAO;
import dal.Student_ResultDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.AbstractList;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author bangc
 */
public class FinishScoreServlet extends HttpServlet {

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
            out.println("<title>Servlet FinishScoreServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet FinishScoreServlet at " + request.getContextPath() + "</h1>");
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
        String test = request.getParameter("test_id");
        int srd_id = Integer.parseInt(srd);
        int test_id = Integer.parseInt(test);
        String m = request.getParameter("mark");
        int markW = Integer.parseInt(m);
        Point_WritingDAO pwd = new Point_WritingDAO();
        pwd.InsertPoint_Writing(user.getId(), markW, srd_id);
        
        Point_ReadingDAO prd = new Point_ReadingDAO();
        Point_ListeningDAO pld = new Point_ListeningDAO();
        Point_SpeakingDAO psd = new Point_SpeakingDAO();
        
        List<Point_Reading> lpr = prd.GetAllPoint_Reading();
        List<Point_Listening> lpl = pld.GetAllPoint_Listening();
        List<Point_Speaking> lps = psd.GetAllPoint_Speaking();
        List<Point_Writing> lpw = pwd.GetAllPoint_Writing();
        
        Point_Reading pr = new Point_Reading();
        Point_Listening pl = new Point_Listening();
        Point_Speaking ps = new Point_Speaking();
        Point_Writing pw = new Point_Writing();
        
        for (int i = 0; i < lpr.size(); i++) {
            if(lpr.get(i).getResult_id()==srd_id){
                pr = lpr.get(i);
            }
        }
        for (int i = 0; i < lpl.size(); i++) {
            if(lpl.get(i).getResult_id()==srd_id){
                pl = lpl.get(i);
            }
        }
        for (int i = 0; i < lps.size(); i++) {
            if(lps.get(i).getResult_id()==srd_id){
                ps = lps.get(i);
            }
        }
        for (int i = 0; i < lpw.size(); i++) {
            if(lpw.get(i).getResult_id()==srd_id){
                pw = lpw.get(i);
            }
        }
        
        int r = pr.getMark();
        int l = pl.getMark();
        int s = ps.getMark();
        int w = pw.getMark();
        
        int total = r+l+s+w;
        
        int mark=total/4;
        Student_ResultDAO sr = new Student_ResultDAO();
        sr.updateStudentResultScore(srd_id, mark);
        
        List<Exam> lstexam = new ArrayList<>();
        ExamDAO examdao = new ExamDAO();
        lstexam = examdao.GetAllExam();
        request.setAttribute("exam", lstexam);
        request.getRequestDispatcher("ExamDetail.jsp").forward(request, response);
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
