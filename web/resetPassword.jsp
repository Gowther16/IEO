<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reset Password</title>
    
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
            <h2 class="active">Reset Password</h2>
            
            <form action="resetPassword" method="post" id="resetPasswordForm">
                   <% if (request.getAttribute("mess") != null) { %>
                <div class="alert alert-danger">
                    <%= request.getAttribute("mess") %>  
                </div>
                <% } %>
                <input type="email" id="email" name="email" value="${email}" placeholder="Email" required>
                
                <div class="password-container">
                    <input type="password" id="password" name="password" placeholder="New Password" required>
                    <i class="far fa-eye" id="togglePassword"></i>
                </div>
                
                <div class="password-container">
                    <input type="password" id="confirmPassword" name="confirmPassword" placeholder="Confirm Password" required>
                    <i class="far fa-eye" id="toggleConfirmPassword"></i>
                </div>
                
                <button type="submit" class="login-btn">Reset password</button>
            </form>
        </div>
    </div>
    
    <!-- jQuery and Bootstrap Bundle (includes Popper) -->
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    
    <script>
        // Toggle password visibility
        document.getElementById('togglePassword').addEventListener('click', function() {
            const passwordInput = document.getElementById('password');
            if (passwordInput.type === 'password') {
                passwordInput.type = 'text';
                this.classList.replace('fa-eye', 'fa-eye-slash');
            } else {
                passwordInput.type = 'password';
                this.classList.replace('fa-eye-slash', 'fa-eye');
            }
        });
        
        document.getElementById('toggleConfirmPassword').addEventListener('click', function() {
            const confirmPasswordInput = document.getElementById('confirmPassword');
            if (confirmPasswordInput.type === 'password') {
                confirmPasswordInput.type = 'text';
                this.classList.replace('fa-eye', 'fa-eye-slash');
            } else {
                confirmPasswordInput.type = 'password';
                this.classList.replace('fa-eye-slash', 'fa-eye');
            }
        });
    </script>
</body>
</html>
