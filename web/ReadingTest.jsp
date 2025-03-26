<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.Arrays" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Reading_Test</title>
        <link rel="stylesheet" href="css/test.css">
        <link rel="stylesheet" href="css/taketest.css">
    </head>
    <body>
        <div id="container">
            <div id="left-panel">
                <h1>Reading</h1>
                <h2>${reading.getTitle()}</h2>
                <div class="description">
                    <c:forEach items="${readContent}" var="content">
                        <p>${content}</p>
                    </c:forEach>
                </div>
            </div>
            <div id="right-panel">
                <h2>Questions</h2>
                <p>Time: <span id="timer"></span></p>
                <p class="instructions">Choose the correct answer from the list of question below:</p>
                <form class="headings" action="listeningTest" method="POST">
                    <c:forEach items="${quest_read}" var="r">
                        <h4>${r.getQuestion_text()}</h4>
                        <c:forTokens var="option" items="${r.getAnswer_options()}" delims="|">
                            <input type="radio" name="answer_${r.getQuestRead_id()}" value="${option}" id="option_${r.getQuestRead_id()}_${option}" />
                            <label for="option_${r.getQuestRead_id()}_${option}">${option}</label><br/>
                        </c:forTokens>
                        <br>
                    </c:forEach>
                        <button type="submit" class="take_test_btn">Submit </button>
                </form>
            </div>
        </div>
        <script>
//            const durationInMinutes = parseInt("${reading.getDuration()}"); // Fetching duration properly
            const durationInMinutes = 25;
            let timeLeft = durationInMinutes * 60;
            function updateTimer() {
                const minutes = Math.floor(timeLeft / 60);
                const seconds = timeLeft % 60;
                document.getElementById("timer").innerText = minutes.toString().padStart(2, '0') + ":" + seconds.toString().padStart(2, '0');
                timeLeft--;
                if (timeLeft < 0) {
                    clearInterval(timerInterval);
                    alert("Time's up!");
                    document.querySelector("form").submit(); // Automatically submit form when time is up
                }
            }
            const timerInterval = setInterval(updateTimer, 1000); // Update every second
            updateTimer();
        </script>
    </body>
</html>
