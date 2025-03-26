<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Writing_Test</title>
    <link rel="stylesheet" href="css/test.css">
    <link rel="stylesheet" href="css/taketest.css">
</head>
<body>
    <div id="container">
        <div id="left-panel">
            <h1>Writing</h1>
            <h3>${writing.getTitle()}</h3>
            <p class="description">
                ${writing.getContent()}
            </p>
        </div>
        <div id="right-panel">
            <h2>Your Answer</h2>
            <p>Time: <span id="timer"></span></p>
            <form class="headings" method="finishTest" method="POST">
                <textarea id="writing" name="writing" rows="50" cols="70" placeholder="Input your writing here..."></textarea><br>
                <button type="submit" class="take_test_btn">Submit </button>
            </form>
        </div>
    </div>
    <script>
            const durationInMinutes = parseInt("${writing.getDuration()}");
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
