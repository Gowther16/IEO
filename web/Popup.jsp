<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>

<%
    String adImage = (String) request.getAttribute("adImage");
    String adLink = (String) request.getAttribute("adLink");
%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Pop-up Ads</title>
        <link rel="stylesheet" type="text/css" href="css/popup.css">
    </head>
    <body>


        <div id="popup-overlay">
            <div id="popup-box">
                <button class="close-btn" onclick="closePopup()">X</button>
                <div id="popup-content">
                    <a href="<%= adLink %>">
                        <img src="<%= adImage %>" alt="Ad Banner">
                    </a>
                    <p><b>Ưu đãi đặc biệt!</b> Đăng ký ngay để nhận khuyến mãi hấp dẫn.</p>
                </div>
            </div>
        </div>

        <script src="js/popup.js"></script>

    </body>
</html>
