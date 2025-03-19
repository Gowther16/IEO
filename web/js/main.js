//Dropdown Nav-main
// function toggleDropdown() {
//   const dropdown = document.querySelector('.dropdown-content');
//   dropdown.style.display = dropdown.style.display === 'block' ? 'none' : 'block';
// }

// Slider
let list = document.querySelector('.slider .list');
let items = document.querySelectorAll('.slider .list .item');
let prev = document.getElementById('prev');
let next = document.getElementById('next');

let active = 0;
let lengthItems = items.length-1;

//Right slider move
next.onclick = function(){
    if(active + 1 > lengthItems){
        active = 0;
    }else{
        active = active +1;
    }
    reloadSlider();
}
//Left slider move
prev.onclick = function () {
    if (active - 1 < 0) {
        active = lengthItems; // Nếu đang ở ảnh đầu, quay về ảnh cuối
    } else {
        active = active - 1; // Lùi về ảnh trước
    }
    reloadSlider();
};
function reloadSlider(){
    let checkLeft = items[active].offsetLeft;
    list.style.left = -checkLeft + 'px';

}

        
//Dropdown auto
        document.addEventListener("DOMContentLoaded", function () {
        var dropdowns = document.querySelectorAll(".nav-item.dropdown");
                dropdowns.forEach(function (dropdown) {
                dropdown.addEventListener("mouseover", function () {
                this.querySelector(".dropdown-menu").classList.add("show");
                });
                        dropdown.addEventListener("mouseout", function () {
                        this.querySelector(".dropdown-menu").classList.remove("show");
                        });
                });
        });
//confirm password
        document.getElementById("confirmPassword").addEventListener("input", function () {
var password = document.getElementById("password").value;
        var confirmPassword = this.value;
        if (password !== confirmPassword) {
alert("Mật khẩu xác nhận không khớp!");
}
});

// Handle tab switching for login and register forms
document.addEventListener('DOMContentLoaded', function() {
    const tabs = document.querySelectorAll('.tab');
    tabs.forEach(tab => {
        tab.addEventListener('click', function() {
            // Remove active class from all tabs
            tabs.forEach(t => t.classList.remove('active'));
            // Add active class to clicked tab
            this.classList.add('active');
            // Get the form to show
            const formToShow = this.getAttribute('data-form');
            // Hide all forms
            document.querySelectorAll('.form-container').forEach(form => {
                form.style.display = 'none';
            });
            // Show the selected form
            document.getElementById(formToShow).style.display = 'block';
        });
    });
});

// Form handling
document.addEventListener('DOMContentLoaded', function() {
    // Reset form on page load
    const registerForm = document.getElementById('registerForm');
    if (registerForm) {
        registerForm.reset();
    }

    // Handle form submission
    registerForm.addEventListener('submit', function(e) {
        const password = document.getElementById('password').value;
        const confirmPassword = document.getElementById('confirmPassword').value;

        if (password !== confirmPassword) {
            e.preventDefault();
            alert("Passwords do not match!");
            return false;
        }
        // Reset form after successful submission
        setTimeout(() => {
            registerForm.reset();
        }, 100);
    });

    // Handle tab switching
    const loginTab = document.querySelector('.inactive.underlineHover');
    if (loginTab) {
        loginTab.addEventListener('click', function() {
            window.location.href = 'login';
        });
    }
});
