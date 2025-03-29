/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.StudentTest;
import Model.Student_Results;
import Model.Tests;
import dal.Student_ResultDAO;
import dal.TestsDAO;
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
public class ScoreTestServlet extends HttpServlet {

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
            out.println("<title>Servlet ScoreTestServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ScoreTestServlet at " + request.getContextPath() + "</h1>");
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
        String exam = request.getParameter("exam_id");
        int exam_id = Integer.parseInt(exam);
        List<Tests> lsttest = new ArrayList<>();
        TestsDAO testdao = new TestsDAO();
        lsttest = testdao.GetAllTests();
        List<Tests> work = new ArrayList<>();
        for (int i = 0; i < lsttest.size(); i++) {
            if(lsttest.get(i).getExam_id()==exam_id){
                work.add(lsttest.get(i));
            }
        }
        Student_ResultDAO srd = new Student_ResultDAO();
        
        List<StudentTest> lst = new ArrayList<>();
        for (int i = 0; i < work.size(); i++) {
            StudentTest studentTest = new StudentTest();
            studentTest.setTest_id(work.get(i).getTest_id());
            studentTest.setStudentName(work.get(i).getStudent_name());
            studentTest.setEmail(work.get(i).getEmail());
            List<Student_Results> sr = srd.findStudentResultByTestId(work.get(i).getTest_id());
            if(sr.isEmpty()){
                studentTest.setStatus("Pending");
            }else{
                studentTest.setStatus("Pointed");
            }
            lst.add(studentTest);
        }
        request.setAttribute("exam", lst);
        request.getRequestDispatcher("ScoringExam.jsp").forward(request, response);
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
