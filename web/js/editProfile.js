document.addEventListener("DOMContentLoaded", function () {
    const changePasswordBtn = document.getElementById("changePasswordBtn");
    const passwordInputGroup = document.getElementById("passwordInputGroup");
    const cancelChangePassword = document.getElementById("cancelChangePassword");
    const togglePasswordBtn = document.getElementById("togglePassword");
    const passwordField = document.getElementById("password");

    changePasswordBtn.addEventListener("click", function () {
        passwordInputGroup.classList.remove("d-none");
        changePasswordBtn.classList.add("d-none");
    });

    cancelChangePassword.addEventListener("click", function () {
        passwordInputGroup.classList.add("d-none");
        changePasswordBtn.classList.remove("d-none");
    });

    togglePasswordBtn.addEventListener("click", function () {
        const icon = togglePasswordBtn.querySelector("i");
        if (passwordField.type === "password") {
            passwordField.type = "text";
            icon.classList.remove("fa-eye");
            icon.classList.add("fa-eye-slash");
        } else {
            passwordField.type = "password";
            icon.classList.remove("fa-eye-slash");
            icon.classList.add("fa-eye");
        }
    });
});
