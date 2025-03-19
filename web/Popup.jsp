<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>



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
                    <a href="#">
                        <img src="images/popup.jpg" alt="Ad Banner">
                    </a>
                </div>
            </div>
        </div>

        <script src="js/popup.js"></script>

    </body>
</html>
