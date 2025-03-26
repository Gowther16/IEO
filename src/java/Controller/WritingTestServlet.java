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
import Model.Writing;
import Mongodb.UploadMP3File;
import dal.WritingDAO;
import java.io.File;
import java.util.*;

/**
 *
 * @author bangc
 */
public class WritingTestServlet extends HttpServlet {

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
        String base64String = request.getParameter("recordedAudio");
        if (base64String != null) {
            int commaIndex = base64String.indexOf(',');
            if (commaIndex != -1) {
                String header = base64String.substring(0, commaIndex);
                String data = base64String.substring(commaIndex + 1);
                String format = header.substring(header.indexOf(":") + 1, header.indexOf(";"));
                String extension = format.contains("mp3") ? "mp3" : "webm";
                byte[] decodedBytes = Base64.getDecoder().decode(data);
                String filename = "recording." + extension;
                File file = new File(filename);
                UploadMP3File upload = new UploadMP3File();
                upload.uploadSpeaking(file);
            }
        }

        List<Writing> lstwrite = new ArrayList<>();
        WritingDAO writedao = new WritingDAO();
        lstwrite = writedao.GetAllWriting();
        Writing write_print = new Writing();
        write_print = lstwrite.get(0);
        request.setAttribute("writing", write_print);
        request.getRequestDispatcher("WritingTest.jsp").forward(request, response);
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
