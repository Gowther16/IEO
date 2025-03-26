<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Speaking_Test</title>
        <link rel="stylesheet" href="css/test.css">
        <link rel="stylesheet" href="css/taketest.css">
    </head>
    <body>
        <div id="container">
            <div id="left-panel">
                <h1>Speaking</h1>
                <c:forEach var="r" items="${lstqspeak}">
                    <p>${r.getQuestion_text()}</p>
                </c:forEach>
            </div>
            <div id="right-panel">
                <h2>Questions</h2>
                <p>Time: <span id="timer"></span></p>
                <p class="instructions">Choose the correct answer from the list of question below:</p>
                <form class="headings" action="writingTest" method="POST">

                    <h4></h4>
                    <div id="recorderControls">
                        <button id="recordBtn">Start Recording</button>
                    </div>

                    <audio id="audioPlayback" controls style="display:none; margin-top:20px;"></audio>
                    <button type="submit" class="take_test_btn">Submit </button>

                </form>
            </div>
        </div>
        <script>
            const durationInMinutes = parseInt("${speaking.getDuration()}");
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
            
            let isRecording = false; // Tracks recording state
    let isRecording = false;  
let mediaRecorder;  
let audioChunks = [];  
let audioBlob;  

const recordBtn = document.getElementById('recordBtn');  
const audioPlayback = document.getElementById('audioPlayback'); 

recordBtn.addEventListener('click', () => {  
    if (!isRecording) {  
        navigator.mediaDevices.getUserMedia({ audio: true })  
            .then(stream => {  
                let options = { mimeType: 'audio/mp3' };  
                try {  
                    mediaRecorder = new MediaRecorder(stream, options);  
                } catch (e) {  
                    console.warn('audio/mp3 not supported, using default format', e);  
                    mediaRecorder = new MediaRecorder(stream);  
                }  
                mediaRecorder.start();  
                audioChunks = [];  
                isRecording = true;  
                recordBtn.innerText = "Stop Recording";  

                mediaRecorder.addEventListener("dataavailable", event => {  
                    if (event.data.size > 0) {  
                        audioChunks.push(event.data);  
                    }  
                });  

                mediaRecorder.addEventListener("stop", () => {  
                    audioBlob = new Blob(audioChunks, { type: options.mimeType });  
                    const audioUrl = URL.createObjectURL(audioBlob);  
                    audioPlayback.src = audioUrl;  
                    audioPlayback.style.display = 'block';  
                });  
            })  
            .catch(error => {  
                console.error('Error accessing the microphone:', error);  
                alert('Could not access the microphone.');  
            });  
    } else {  
        if (mediaRecorder && mediaRecorder.state !== 'inactive') {  
            mediaRecorder.stop();  
        }  
        isRecording = false;  
        recordBtn.innerText = "Start Recording";  
    }  
});  

function blobToBase64(blob, callback) {  
    const reader = new window.FileReader();  
    reader.readAsDataURL(blob);  
    reader.onloadend = () => {  
        callback(reader.result);  
    };  
}
        </script>
    </body>
</html>
