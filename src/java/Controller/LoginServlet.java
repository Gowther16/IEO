/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.GoogleAccount;
import Model.User;
import dal.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Nguyen Duc Tuan
 */
public class LoginServlet extends HttpServlet {

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {
        response.setContentType("text/html;charset=UTF-8");

        String code = request.getParameter("code");
        String error = request.getParameter("error");

        if (error != null) {
            request.setAttribute("mess", "Google authentication failed.");
            request.getRequestDispatcher("Login.jsp").forward(request, response);
            return;
        }
        if (code == null) {
            request.setAttribute("mess", "Google login code is missing.");
            request.getRequestDispatcher("Login.jsp").forward(request, response);
            return;
        }

        // Lấy access token từ Google
        GoogleLogin gg = new GoogleLogin();
        String accessToken = gg.getToken(code);

        // Lấy thông tin người dùng từ Google
        GoogleAccount ggAcc = gg.getUserInfo(accessToken);
        if (ggAcc == null || ggAcc.getEmail() == null) {
            request.setAttribute("mess", "Cannot retrieve Google account information.");
            request.getRequestDispatcher("Login.jsp").forward(request, response);
            return;
        }

        System.out.println("Google User: " + ggAcc);

        // Kiểm tra xem tài khoản đã có trong database chưa
        UserDAO uDao = new UserDAO();
        HttpSession sess = request.getSession();
        User user = uDao.getUserByEmail(ggAcc.getEmail());

        if (user == null) {
            user = new User();
            user.setName(ggAcc.getName());
            user.setEmail(ggAcc.getEmail());
            user.setPassword(""); 

            boolean isInserted = uDao.createUserWithGG(user, 1);
            if (!isInserted) {
                request.setAttribute("mess", "Fail to create Google account.");
                request.getRequestDispatcher("Login.jsp").forward(request, response);
                return;
            }

            // Lấy lại user từ DB sau khi tạo để đảm bảo có ID
            user = uDao.getUserByEmail(ggAcc.getEmail());
            System.out.println("New Google account added to DB: " + user.getEmail());
        }

        // Lưu user vào session và chuyển hướng về home.jsp
        sess.setAttribute("user", user);
        response.sendRedirect("home");
  }


    @Override
protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            //  request.getRequestDispatcher("Login.jsp").forward(request, response);
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
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

        UserDAO userDAO = new UserDAO();
        User user = userDAO.login(email, password);

        if (user != null) {
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            response.sendRedirect("home");
        } else {
            request.setAttribute("errorLogin", "Invalid email or password!");
            request.getRequestDispatcher("Login.jsp").forward(request, response);
        }
    }
}
