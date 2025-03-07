package Controller;

import dal.UserDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


public class RegisterServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("Register.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        
        // Validate input
        if (username == null || username.trim().isEmpty() ||
            email == null || email.trim().isEmpty() ||
            password == null || password.trim().isEmpty() ||
            confirmPassword == null || confirmPassword.trim().isEmpty()) {
            request.setAttribute("error", "Please fill in all fields");
            request.getRequestDispatcher("Register.jsp").forward(request, response);
            return;
        }
        
        // Validate password match
        if (!password.equals(confirmPassword)) {
            request.setAttribute("error", "Passwords do not match");
            request.getRequestDispatcher("Register.jsp").forward(request, response);
            return;
        }
        
        try {
            UserDAO userDAO = new UserDAO();
            userDAO.register(username, password, email);
            // Redirect to login page after successful registration
            response.sendRedirect("login");
        } catch (Exception e) {
            request.setAttribute("errorEmail", "Registration failed. Please try again.");
            request.getRequestDispatcher("Register.jsp").forward(request, response);
        }
    }
}
