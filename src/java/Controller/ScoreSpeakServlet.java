/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.Answer_Listening_Write;
import Model.Answer_Speaking;
import Model.Point_Listening;
import Model.Tests;
import Model.User;
import com.mongodb.client.model.geojson.Point;
import dal.Answer_SpeakingDAO;
import dal.Point_ListeningDAO;
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
public class ScoreSpeakServlet extends HttpServlet {

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
            out.println("<title>Servlet ScoreSpeakServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ScoreSpeakServlet at " + request.getContextPath() + "</h1>");
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
        User user = (User) request.getSession().getAttribute("user");
        int markW = (int) request.getAttribute("markW");
        int Lmark=(int) request.getAttribute("mark");
        int mark =(int) (markW+Lmark)/2;
        Point_ListeningDAO pld = new Point_ListeningDAO();
        int srd_id =(int) request.getAttribute("srd_id");
        pld.InsertPoint_Listening(user.getId(), mark, test_id);
        
        List<Answer_Speaking> las = new ArrayList<>();
        Answer_SpeakingDAO asd = new Answer_SpeakingDAO();
        
        
        
        
        
        
        
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
