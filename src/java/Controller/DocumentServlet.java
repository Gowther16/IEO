/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.Document;
import dal.DocumentDAO;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.PrintWriter;

/**
 *
 * @author bangc
 */
@WebServlet(name = "DocumentServlet", urlPatterns = {"/DocumentServlet"})
public class DocumentServlet extends HttpServlet {
    private DocumentDAO documentDAO = new DocumentDAO();
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
            out.println("<title>Servlet DocumentServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DocumentServlet at " + request.getContextPath() + "</h1>");
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
            List<Document> documentList = documentDAO.getAllDocuments();

            System.out.println("Tổng số tài liệu lấy từ CSDL: " + documentList.size());
            for (Document doc : documentList) {
                System.out.println("ID: " + doc.getId() + ", Title: " + doc.getTitle() + ", Content: " + doc.getContent());
            }

            request.setAttribute("documents", documentList);
            request.getRequestDispatcher("Document.jsp").forward(request, response);
        } catch (Exception ex) {
            System.err.println("Error in doGet: " + ex.getMessage());
            ex.printStackTrace();
            request.setAttribute("errorMessage", "Lỗi khi lấy dữ liệu tài liệu: " + ex.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
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
            if ("delete".equals(action)) {
                deleteDocument(request, response);
            } else if ("update".equals(action)) {
                updateDocument(request, response);
            } else {
                addDocument(request, response);
            }

            response.sendRedirect("DocumentServlet");

        } catch (Exception ex) {
            System.err.println("Error in doPost: " + ex.getMessage());
            ex.printStackTrace();
            request.setAttribute("errorMessage", "Lỗi xử lý yêu cầu: " + ex.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }

    }
    
    private void addDocument(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String title = request.getParameter("Title");
        String content = request.getParameter("content");
        String typeIdStr = request.getParameter("t_id");
        String filePath = request.getParameter("filePath");
        if (title == null || title.trim().isEmpty() || content == null || typeIdStr == null) {
            throw new Exception("Dữ liệu đầu vào không hợp lệ");
        }
        int typeId = Integer.parseInt(typeIdStr);
        documentDAO.addDocument(title, content, typeId, filePath);
    }

    private void deleteDocument(HttpServletRequest request, HttpServletResponse response) throws Exception {
        int id = Integer.parseInt(request.getParameter("id"));
        documentDAO.deleteDocument(id);
    }

    private void updateDocument(HttpServletRequest request, HttpServletResponse response) throws Exception {
        int id = Integer.parseInt(request.getParameter("id"));
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        String filePath = request.getParameter("filePath");

        documentDAO.updateDocument(id, title, content, filePath);
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
