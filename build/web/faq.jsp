<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <title>FAQ - Frequently Asked Questions</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
        <link rel="stylesheet" href="css/styleindex.css">
    </head>

    <body>
        <!-- Navbar -->
        <%--<jsp:include page="navbar.jsp" />--%>

        <!-- FAQ -->
        <div class="container py-5">
            <h2 class="text-center mb-4">(FAQ)</h2>
            <div class="accordion" id="faqAccordion">
                <!-- chen cau hoi o day -->
                <!-- Question 1 -->
                <div class="accordion-item">
                    <h2 class="accordion-header" id="headingOne">
                        <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                            How to register a candidate account?
                        </button>
                    </h2>
                    <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#faqAccordion">
                        <div class="accordion-body">
                            You can register an account by clicking the button <a href="Register.jsp">"Register"</a> in the top right corner of the page and fill in the required information.
                        </div>
                    </div>
                </div>

                <!-- Question 2 -->
                <div class="accordion-item">
                    <h2 class="accordion-header" id="headingTwo">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                            I forgot my password, how do I recover it?
                        </button>
                    </h2>
                    <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#faqAccordion">
                        <div class="accordion-body">
                            Please click on the link <a href="#">"forgot password"</a> on the login page and follow the instructions to retrieve your password.
                        </div>
                    </div>
                </div>

                <!-- Question 3 -->
                <div class="accordion-item">
                    <h2 class="accordion-header" id="headingThree">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                            What does the teacher need to do to start marking?
                        </button>
                    </h2>
                    <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#faqAccordion">
                        <div class="accordion-body">
                            After logging in, examiners can access the "Exam Management" section to view and grade candidates' exams.
                        </div>
                    </div>
                </div>

                <!-- Question 4 -->
                <div class="accordion-item">
                    <h2 class="accordion-header" id="headingFour">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
                            Where can I practice IELTS for free?
                        </button>
                    </h2>
                    <div id="collapseFour" class="accordion-collapse collapse" aria-labelledby="headingFour" data-bs-parent="#faqAccordion">
                        <div class="accordion-body">
                            You can access the item <a href="#">"IELTS Exam Library"</a> to do sample tests and practice IELTS skills.
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <h2>Online Support</h2>
        <div id="chat-box" style="border:1px solid #ccc; height:300px; overflow:auto; padding:10px;"></div>
        <input type="text" id="chat-input" placeholder="Nhập tin nhắn..." class="form-control" />
        <button id="send-btn" class="btn btn-primary mt-2">send</button>

        <!-- (popup chat) -->
        <%--<jsp:include page="chatbox.jsp" />--%>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        <script>
            let socket = new WebSocket("ws://localhost:8080/IEO/chat");

            socket.onopen = function (e) {
                console.log("Connected to chat server");
            };

            socket.onmessage = function (event) {
                let chatBox = document.getElementById("chat-box");
                chatBox.innerHTML += "<div>" + event.data + "</div>";
                chatBox.scrollTop = chatBox.scrollHeight;
            };

            socket.onclose = function (event) {
                console.log("Disconnected from chat server");
            };

            socket.onerror = function (error) {
                console.error("WebSocket Error: " + error);
            };

            document.getElementById("send-btn").onclick = function () {
                let input = document.getElementById("chat-input");
                let message = input.value.trim();
                if (message) {
                    socket.send(message);
                    input.value = ""; // clear input
                }
            };
        </script>

    </body>

</html>
