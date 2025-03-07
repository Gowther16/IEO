/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.TokenForgetPassword;
import Model.User;
import dal.TokenForgetDAO;
import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author Nguyen Duc Tuan
 */
public class ResetPasswordServlet extends HttpServlet {

    TokenForgetDAO TokenDAO = new TokenForgetDAO();
    UserDAO userDAO = new UserDAO();

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
            out.println("<title>Servlet resetPasswordServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet resetPasswordServlet at " + request.getContextPath() + "</h1>");
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
        String token = request.getParameter("token");

        HttpSession session = request.getSession();
        if (token != null) {
            ResetService service = new ResetService();
            TokenForgetPassword tokenForgetPassword = TokenDAO.getTokenPassword(token);
            if (tokenForgetPassword == null) {
                request.setAttribute("mess", "Token invalid!");
                request.getRequestDispatcher("requestPassword.jsp").forward(request, response);
                return;
            }
            if (service.isExpireTime(tokenForgetPassword.getExpiryTime())) {
                request.setAttribute("mess", "This token has expired!");
                request.getRequestDispatcher("requestPassword.jsp").forward(request, response);
                return;
            }
            User user = userDAO.getUserById(tokenForgetPassword.getUserId());
            if (user == null) {
                request.setAttribute("mess", "User not found for this token!");
                request.getRequestDispatcher("requestPassword.jsp").forward(request, response);
                return;
            }

            if (service.isExpireTime(tokenForgetPassword.getExpiryTime())) {
                request.setAttribute("mess", "This token has expired!");
                request.getRequestDispatcher("requestPassword.jsp").forward(request, response);
                return;
            }
            System.out.println("User found: " + user.getEmail());

            request.setAttribute("email", user.getEmail());
            session.setAttribute("token", tokenForgetPassword.getToken());
            request.getRequestDispatcher("resetPassword.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("requestPassword.jsp").forward(request, response);
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
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        //validate password...
        if (!password.equals(confirmPassword)) {
            request.setAttribute("mess", "Confirm password must same password!");
            request.setAttribute("email", email);
            request.getRequestDispatcher("resetPassword.jsp").forward(request, response);
            return;
        }

        HttpSession session = request.getSession();
        String tokenStr = (String) session.getAttribute("token");

        TokenForgetPassword tokenForgetPassword = TokenDAO.getTokenPassword(tokenStr);
        ResetService service = new ResetService();

        if (tokenForgetPassword == null) {
            request.setAttribute("mess", "Token invalid");
            request.getRequestDispatcher("requestPassword.jsp").forward(request, response);
            return;
        }

        if (tokenForgetPassword.isIsUsed()) {
            request.setAttribute("mess", "This token has already been used!");
            request.getRequestDispatcher("requestPassword.jsp").forward(request, response);
            return;
        }

        if (service.isExpireTime(tokenForgetPassword.getExpiryTime())) {
            request.setAttribute("mess", "This token has expired!");
            request.getRequestDispatcher("requestPassword.jsp").forward(request, response);
            return;
        }

        // Cập nhật mật khẩu
        tokenForgetPassword.setToken(tokenStr);
        tokenForgetPassword.setIsUsed(true);
        userDAO.updatePassword(email, password);
        TokenDAO.updateStatus(tokenForgetPassword);
        User user = userDAO.getUserByEmail(email);
        if (user != null) {
            session.setAttribute("user", user);
            System.out.println("User logged in: " + user.getName());
        } else {
            System.out.println("User not found after password reset!");
        }

        //save user in session and redirect to home
        response.sendRedirect("home");

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
