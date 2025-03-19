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
                    <c:forEach items="${readContent}" var="r">
                        <p>${r}</p>
                    </c:forEach>
                </div>

                <!-- Thêm MP3 Player vào ?ây -->
                <h2>Audio Listening</h2>

                <audio id="audioPlayer" controls>
                    <source src="${audio}" type="audio/mpeg">
                    Your browser does not support the audio element.
                </audio>
<!--                <input type="range" id="progressBar" value="0" max="100">
                <div>
                    <span id="currentTime">0:00</span> / <span id="duration">0:00</span>
                </div>-->
            </div>

            <div id="right-panel">
                <h2>Questions</h2>
                <p class="instructions">Choose the correct answer from the list of question below:</p>
                <form class="headings" method="speakingTest" method="POST">
                    
                        <button type="submit" class="take_test_btn">Submit </button>
                </form>
            </div>
        </div>
        <script src="js/audio.js"/>
    </body>
</html>
