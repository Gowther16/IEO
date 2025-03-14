/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.User;
import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Nguyen Duc Tuan
 */
public class EditProfileServlet extends HttpServlet {

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
            out.println("<title>Servlet EditProfile</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditProfile at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("editProfile.jsp").forward(request, response);
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
        HttpSession session = request.getSession();
    UserDAO userDAO = new UserDAO();

    // Get the current user from session
    User currentUser = (User) session.getAttribute("user");
    
    if (currentUser == null) {
        request.setAttribute("mess","User null!" );
        request.getRequestDispatcher("editProfile.jsp").forward(request, response);
        return;
    }

    // Get form parameters
    String name = request.getParameter("name");
    String phone = request.getParameter("phone");
    String password = request.getParameter("password");
    String email = request.getParameter("email");
    String birthdateStr = request.getParameter("birthdate");

    Date birthdate = null;
    if (birthdateStr != null && !birthdateStr.isEmpty()) {
        birthdate = java.sql.Date.valueOf(birthdateStr);
    }

    // If password is empty, keep the old password
    if (password == null || password.isBlank()) {
        password = currentUser.getPassword();
    }

    // Create updated user object
    User updatedUser = new User();
    updatedUser.setId(currentUser.getId());
    updatedUser.setName(name);
    updatedUser.setEmail(email);
    updatedUser.setPassword(password);
    updatedUser.setPhone(phone);
    updatedUser.setBirthdate(birthdate);

    try {
        // Call the void updateProfile method
        userDAO.updateProfile(updatedUser);
        
        // Update session with new user data
        session.setAttribute("user", updatedUser);
        request.setAttribute("successMessage", "Profile updated successfully!");
    } catch (Exception ex) {
        Logger.getLogger(EditProfileServlet.class.getName()).log(Level.SEVERE, null, ex);
        request.setAttribute("errorMessage", "Failed to update profile. Please try again!");
    }

    // Forward to the profile page
    request.getRequestDispatcher("editProfile.jsp").forward(request, response);
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
