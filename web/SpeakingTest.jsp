<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Speaking_Test</title>
    <link rel="stylesheet" href="css/test.css">
    <link rel="stylesheet" href="css/taketest.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
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
            <p class="instructions">Choose the correct answer from the list of questions below:</p>
            <form class="headings" action="writingTest" method="POST" id="testForm">
                <h4></h4>
                <div class="control-buttons">
                    <button type="button" class="mic-button" id="recordButton">
                        <i class="fas fa-microphone"></i>
                    </button>
                    <button type="button" id="play">
                        <i class="fas fa-play"></i>
                    </button>
                </div>
                <div id="output"></div>
                <input type="hidden" name="video" id="audioUrl" value="${data.secure_url}" />
                <input type="hidden" name="test_id" value="${test_id}" />
                <input type="hidden" name="speak_id" value="${speaking.getSpeak_id()}" />
                <input type="hidden" name="topic" value="${topic}" />
                <button type="submit" class="take_test_btn">Submit</button>
            </form>
        </div>
    </div>

    <script>
    const durationInMinutes = parseInt("${speaking.getDuration()}") || 25; // Fallback to 25 if undefined
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

    
    const recordButton = document.getElementById('recordButton');
    const playButton = document.getElementById('play');
    const testForm = document.getElementById('testForm');
    const output = document.getElementById('output');
    let audioRecorder = null;
    let audioChunks = [];
    let audioBlob = null;
    let isRecording = false;
    let isPlaying = false;
    let audio = null;

    const CLOUD_NAME = "dsdwkvvzr";
    const UPLOAD_PRESET = "SWP_PROJECT";

   
    async function initializeRecorder() {
        try {
            const stream = await navigator.mediaDevices.getUserMedia({ audio: true });
            audioRecorder = new MediaRecorder(stream);

            audioRecorder.ondataavailable = (event) => {
                audioChunks.push(event.data);
            };

            
            recordButton.onclick = (e) => {
                e.preventDefault();
                if (!isRecording) {
                    audioChunks = [];
                    audioRecorder.start();
                    recordButton.classList.add('recording');
                    output.innerHTML = 'Recording started! Speak now.';
                    isRecording = true;
                } else {
                    audioRecorder.stop();
                    recordButton.classList.remove('recording');
                    output.innerHTML = 'Recording stopped!';
                    isRecording = false;
                }
            };

            
            playButton.onclick = (e) => {
                e.preventDefault();
                if (!audioBlob) {
                    alert("No audio recorded!");
                    return;
                }

                if (!isPlaying) {
                    const audioUrl = URL.createObjectURL(audioBlob);
                    audio = new Audio(audioUrl);
                    audio.play();
                    playButton.innerHTML = '<i class="fas fa-pause"></i>';
                    isPlaying = true;

                    audio.onended = () => {
                        playButton.innerHTML = '<i class="fas fa-play"></i>';
                        isPlaying = false;
                    };
                } else {
                    audio.pause();
                    playButton.innerHTML = '<i class="fas fa-play"></i>';
                    isPlaying = false;
                }
            };

            
            audioRecorder.onstop = async () => {
                try {
                    audioBlob = new Blob(audioChunks, { type: 'audio/webm' });
                    const formData = new FormData();
                    formData.append("file", audioBlob);
                    formData.append("upload_preset", UPLOAD_PRESET);

                    output.innerHTML = "Uploading to Cloudinary...";
                    
                    const response = await fetch(`https://api.cloudinary.com/v1_1/dsdwkvvzr/video/upload`, {
                        method: "POST",
                        body: formData
                    });

                    if (!response.ok) {
                        throw new Error(`HTTP error! status: ${response.status}`);
                    }

                    const data = await response.json();
                    if (data.secure_url) {
                        document.getElementById('audioUrl').value = data.secure_url;
                        output.innerHTML = `Upload successful!`;
                    } else {
                        output.innerHTML = "Upload failed!";
                    }
                } catch (error) {
                    console.error("Upload error:", error);
                    output.innerHTML = "Upload error: " + error.message;
                }
            };

        } catch (err) {
            console.error('Error accessing microphone:', err);
            output.innerHTML = "Error accessing microphone: " + err.message;
        }
    }

    
    initializeRecorder().catch(err => {
        console.error("Initialization error:", err);
        output.innerHTML = "Initialization error: " + err.message;
    });
    </script>
</body>
</html>
