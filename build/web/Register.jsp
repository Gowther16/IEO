<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Register - IEO</title>

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
                <!-- Tabs Titles -->
                <h2 class="inactive underlineHover"> Log In </h2>
                <h2 class="active">Register</h2>
                <!-- Icon -->

                <div class="first">
                    <i class="fas fa-user-plus fa-3x"></i>
                </div>

                <!-- Register Form -->
                <form action="register" method="post" id="registerForm">
                      <% if (request.getAttribute("errorLogin") != null) { %>
                    <p class="text-danger"><%= request.getAttribute("errorLogin") %></p>
                    <% } %>
                    <input type="text" id="username" name="username" placeholder="Username" required>
                    <input type="email" id="email" name="email" placeholder="Email" required>

                    <% if (request.getAttribute("errorEmail") != null) { %>
                    <p class="text-danger"><%= request.getAttribute("errorEmail") %></p>
                    <% } %>

                    <div class="password-container">
                        <input type="password" id="password" class="password-input" name="password" placeholder="Password" required>
                        <i class="far fa-eye" id="togglePassword"></i>
                    </div>

                    <div class="password-container">
                        <input type="password" id="confirmPassword" class="password-input" name="confirmPassword" placeholder="Confirm Password" required>
                        <i class="far fa-eye" id="toggleConfirmPassword"></i>
                    </div>

                    <% if (request.getAttribute("errorPass") != null) { %>
                    <p class="text-danger"><%= request.getAttribute("errorPass") %></p>
                    <% } %>


                    <input type="submit" class="signup-btn" value="Register">
                </form>
                <!-- Login Link -->
                <div id="formFooter">
                    <p>Already have an account? <a href="Login.jsp" class="underlineHover">Login</a></p>
                </div>


            </div>
        </div>

        <!-- jQuery and Bootstrap Bundle (includes Popper) -->
        <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

        <!-- Custom JS -->
        <script>
            // Toggle password visibility
            document.getElementById('togglePassword').addEventListener('click', function () {
                const password = document.getElementById('password');
                if (password.type === 'password') {
                    password.type = 'text';
                    this.classList.remove('fa-eye');
                    this.classList.add('fa-eye-slash');
                } else {
                    password.type = 'password';
                    this.classList.remove('fa-eye-slash');
                    this.classList.add('fa-eye');
                }
            });

            document.getElementById('toggleConfirmPassword').addEventListener('click', function () {
                const confirmPassword = document.getElementById('confirmPassword');
                if (confirmPassword.type === 'password') {
                    confirmPassword.type = 'text';
                    this.classList.remove('fa-eye');
                    this.classList.add('fa-eye-slash');
                } else {
                    confirmPassword.type = 'password';
                    this.classList.remove('fa-eye-slash');
                    this.classList.add('fa-eye');
                }
            });

        </script>
    </body>
</html>
