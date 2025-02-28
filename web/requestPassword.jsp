<%-- 
    Document   : requestPassword
    Created on : Feb 21, 2025, 5:17:54 PM
    Author     : Nguyen Duc Tuan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Forget Password</title>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;700&display=swap" rel="stylesheet">

        <!-- Custom CSS -->
        <link rel="stylesheet" href="css/login.css">
    </head>
    <body>
        <div class="wrapper">
            <div id="formContent">
                <!-- Icon -->
                <div class="first">
                    <i class="fas fa-key fa-3x"></i>
                    <h2>Forgot Password</h2>
                </div>

                <!-- Alert Messages -->
                <% if (request.getAttribute("mess") != null) { %>
                <div class="alert alert-danger">
                    <%= request.getAttribute("mess") %>  
                </div>
                <% } %>

                <% if (request.getAttribute("success") != null) { %>
                <div class="alert alert-danger">
                    <%= request.getAttribute("success") %>  
                </div>
                <% } %>

                <!-- Forgot Password Form -->
                <form action="request_password" method="post">
                    <div class="form-group">
                        <input type="email" id="email" class="form-control" name="email" 
                               placeholder="Enter your email" required>
                    </div>
                    <button type="submit" class="login-btn mt-3">Send Reset Link</button>
                    <div id="formFooter" class="mt-3">
                        <a href="login" class="back-to-login">Back to Login</a>
                    </div>
                </form>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
