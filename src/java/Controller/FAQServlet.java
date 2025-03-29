/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import dal.FAQDAO;
import Model.FAQ;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author bangc
 */
@WebServlet(name = "FAQServlet", urlPatterns = {"/FAQServlet"})
public class FAQServlet extends HttpServlet {
    private FAQDAO faqDao = new FAQDAO();
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
            out.println("<title>Servlet FAQServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet FAQServlet at " + request.getContextPath() + "</h1>");
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
        try {
            List<FAQ> faqs = faqDao.getAllFAQs();
            request.setAttribute("faqs", faqs);
            request.getRequestDispatcher("faq.jsp").forward(request, response);
        } catch (Exception ex) {
            Logger.getLogger(FAQServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

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
        String action = request.getParameter("action");

        try {
            if ("add".equals(action)) {
                String question = request.getParameter("question");
                String answer = request.getParameter("answer");
                faqDao.addFAQ(question, answer);
            } else if ("update".equals(action)) {
                int id = Integer.parseInt(request.getParameter("id"));
                String question = request.getParameter("question");
                String answer = request.getParameter("answer");
                faqDao.updateFAQ(id, question, answer);
            } else if ("delete".equals(action)) {
                int id = Integer.parseInt(request.getParameter("id"));
                faqDao.deleteFAQ(id);
            }

            response.sendRedirect("FAQServlet");
        } catch (Exception ex) {
            Logger.getLogger(FAQServlet.class.getName()).log(Level.SEVERE, "Lỗi khi xử lý yêu cầu", ex);
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Lỗi xử lý dữ liệu FAQ");
        }

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
