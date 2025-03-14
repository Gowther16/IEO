<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login - IEO</title>

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
                <h2 class="tab active" data-form="loginForm"> Log In </h2>
                <h2 class="tab inactive underlineHover" data-form="registerForm">Register</h2>

                <!-- Login Form Container -->
                <div id="loginFormContainer" class="form-container active">
                    <div class="first">
                        <i class="fas fa-user-circle fa-3x"></i>
                    </div>
                    <form action="login" method="post" id="loginForm" autocomplete="off"> 
                        
                        <p class="text-danger">${errorLogin}</p>                    
                        <input type="email" id="email" name="email" placeholder="Email"  
                               autocomplete="off" required>
                        <div class="password-container">
                            <input type="password" id="loginPassword" name="password" placeholder="Password" 
                                   autocomplete="off" required>
                            <i class="far fa-eye" id="toggleLoginPassword"></i>
                        </div>
                        <button type="submit" class="login-btn">LOG IN</button>

                        <div id="formFooter">
                            <a class="forgot-link" href="request_password">Forgot Password?</a>
                        </div>
                    </form>
                    <div class="divider">
                        <span>OR</span>
                    </div>

                    <a href ="https://accounts.google.com/o/oauth2/auth?scope=email profile openid&redirect_uri=http://localhost:8080/IEO/login&response_type=code&client_id=696030290050-22djv2eogi6vclhhe9j4np4tmrsfhqdg.apps.googleusercontent.com&access_type=offline&prompt=consent"
                       <a  class="google-btn">
                        <i class="fab fa-google"></i>
                        Login with Google
                    </a>

                    <div id="formFooter">

                        <p class="mt-3">Don't have an account? <a href="register" class="underlineHover">Register</a></p>
                    </div>
                </div>
            </div>
        </div>

        <!-- jQuery and Bootstrap Bundle (includes Popper) -->
        <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

        <!-- Custom JS -->
        <script>
            // Xử lý khi form submit thất bại (có error message)
            if (document.querySelector('.alert-danger') !== null) {
                // Reset form fields
                document.getElementById('loginEmail').value = '';
                document.getElementById('loginPassword').value = '';

                // Tự động focus vào ô email
                document.getElementById('loginEmail').focus();

                // Ẩn error message sau 3 giây
                setTimeout(function () {
                    document.querySelector('.alert-danger').style.display = 'none';
                }, 3000);
            }

            // Toggle password visibility
            document.getElementById('toggleLoginPassword').addEventListener('click', function () {
                const passwordInput = document.getElementById('loginPassword');
                if (passwordInput.type === 'password') {
                    passwordInput.type = 'text';
                    this.classList.remove('fa-eye');
                    this.classList.add('fa-eye-slash');
                } else {
                    passwordInput.type = 'password';
                    this.classList.remove('fa-eye-slash');
                    this.classList.add('fa-eye');
                }
            });
            //reset information
            document.getElementById("loginForm").addEventListener("submit", function () {
                setTimeout(() => {
                    this.reset(); // X�a d? li?u trong form
                }, 100);
            });

            document.getElementById("registerForm").addEventListener("submit", function () {
                setTimeout(() => {
                    this.reset();
                }, 100);
            });

        </script>
    </body>
</html>
