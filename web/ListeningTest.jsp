<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Listening_Test</title>
        <link rel="stylesheet" href="css/test.css">
        <link rel="stylesheet" href="css/taketest.css">

    </head>
    <body>
        <div id="container">
            <div id="left-panel">
                <h1>Listening</h1>
                <div class="description">

                </div>
                <h2>Audio Listening</h2>
                <audio id="audioPlayer" controls>
                    <source src="AudioListening?audio=${listening.getVideo_listen()}" type="audio/mpeg">
                </audio>
            </div>

            <div id="right-panel">
                <h2>Questions</h2>
                <p>Time: <span id="timer"></span></p>
                <form class="headings" action="speakingTest" method="post">
                    <p class="instructions">Choose the correct answer from the list of question below:</p>
                    <c:forEach items="${qlchoose}" var="r">
                        <h4>${r.getQuestion_text()}</h4>
                        <c:forTokens var="option" items="${r.getAnswer_options()}" delims="|">
                            <input type="radio" name="answer_choose_${r.getQuestion_text()}" value="${option}" id="option_${r.getQuestion_text()}_${option}" />
                            <label for="option_${r.getQuestion_text()}_${option}">${option}</label><br/>
                        </c:forTokens>
                        <br>
                    </c:forEach>
                    <p class="instructions">Type answer from the list of question below:</p>
                    <c:forEach items="${qlw}" var="s">
                        ${s.getQuestion_test()} <input type="text" name="answer_write_${s.getQuest_Listen()}"/><br>
                    </c:forEach>
                    <button type="submit" class="take_test_btn">Submit </button>
                </form>
            </div>
        </div>

        <script>
            const durationInMinutes = parseInt("${listening.getDuration()}");
            let timeLeft = durationInMinutes * 60;
            function updateTimer() {
                const minutes = Math.floor(timeLeft / 60);
                const seconds = timeLeft % 60;
                document.getElementById("timer").innerText = minutes.toString().padStart(2, '0') + ":" + seconds.toString().padStart(2, '0');
                timeLeft--;
                if (timeLeft < 0) {
                    clearInterval(timerInterval);
                    alert("Time's up!");
                    document.querySelector("form").submit();
                }
            }
            const timerInterval = setInterval(updateTimer, 1000);
            updateTimer();
        </script>
    </body>
</html>
