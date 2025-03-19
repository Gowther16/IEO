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
            //reset information
            document.getElementById("loginForm").addEventListener("submit", function () {
                setTimeout(() => {
                    this.reset(); //Delete information
                }, 100);
            });

            document.getElementById("registerForm").addEventListener("submit", function () {
                setTimeout(() => {
                    this.reset();
                }, 100);
            });
