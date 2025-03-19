/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
    // Hiển thị pop-up sau 3 giây với hiệu ứng xổ xuống
    setTimeout(function() {
        document.getElementById("popup-overlay").classList.add("show");
        document.getElementById("popup-box").classList.add("show");
    }, 3000);

    // Đóng pop-up khi nhấn nút "X"
    function closePopup() {
        document.getElementById("popup-box").classList.remove("show");
        setTimeout(function() {
            document.getElementById("popup-overlay").classList.remove("show");
        }, 500); // Chờ hiệu ứng kết thúc
    }

