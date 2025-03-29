<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert Test Page</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <!-- Bootstrap JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Custom CSS -->
    <link rel="stylesheet" href="css/styleindex.css">
    <link rel="stylesheet" href="css/insertTest.css">
</head>
<body>
    <jsp:include page="Menu.jsp"></jsp:include>
    <h1>Insert Test Exam</h1>
    <form action="insertTest" method="post">
        <div class="nav">
            <button type="button" onclick="showTab('reading')">Reading</button>
            <button type="button" onclick="showTab('listening')">Listening</button>
            <button type="button" onclick="showTab('speaking')">Speaking</button>
            <button type="button" onclick="showTab('writing')">Writing</button>
        </div>
        <div class="content">
            <div id="reading" class="tab active">
                <h2>Reading</h2>
                Title: <input type="text" name="readingTitle"><br>
                Content: <textarea id="readingContent" name="readingContent" rows="30" cols="50" placeholder="Input your reading content here..."></textarea><br>
                Duration: <input type="text" name="readingDuration"><br>
                <h3>Questions of Reading</h3>
                <div id="questionsContainerReading" class="questions-container">
                    <div class="question-container">
                        <h2>Question 1</h2>
                        <div>
                            <label for="questionTextR1">Question:</label><br>
                            <textarea id="questionTextR1" name="questionTextR_1" rows="4" cols="50" required></textarea>
                        </div>
                        <h3>Explanation</h3>
                        <div>
                            <label for="explanationR1">Explanation:</label><br>
                            <textarea id="explanationR1" name="explanationR_1" rows="4" cols="50" required></textarea>
                        </div>
                        <h3>Answer Options</h3>
                        <div class="answerOptionsContainer">
                            <div class="answer-option">
                                <label for="answerOptionR1_1">Option 1:</label>
                                <input type="text" id="answerOptionR1_1" name="answerOptionR_1_1" required>
                                <input type="radio" id="correctAnswerR1_1" name="correctAnswerR_1" value="" required>
                                <label for="correctAnswerR1_1">Correct</label>
                            </div>
                        </div>
                        <button type="button" class="addAnswerOption" data-question-id="1" data-tab="reading">Add Answer Option</button>
                    </div>
                </div>
                <button type="button" id="addQuestionReading">Add Question</button>
            </div>
            <div id="listening" class="tab">
                <h1>Listening</h1>
                <input type="file" name="listeningFile" id="listening" accept=".mp3" required><br>
                <button type="button" id="play">
                    <i class="fas fa-play"></i>
                </button>
                <input type="hidden" name="video" id="audioUrl" value="${data.secure_url}" />
                Duration: <input type="text" name="listeningDuration"><br>
                <div id="output"></div> <!-- Thêm div để hiển thị thông báo upload -->
                <h3>Questions of Listening</h3>
                <h4>Multiple Choice</h4>
                <div id="questionsContainerListening" class="questions-container">
                    <div class="question-container">
                        <h2>Question 1</h2>
                        <div>
                            <label for="questionTextL1">Question:</label><br>
                            <textarea id="questionTextL1" name="questionTextL_1" rows="4" cols="50" required></textarea>
                        </div>
                        <h3>Explanation</h3>
                        <div>
                            <label for="explanationL1">Explanation:</label><br>
                            <textarea id="explanationL1" name="explanationL_1" rows="4" cols="50" required></textarea>
                        </div>
                        <h3>Answer Options 1</h3>
                        <div class="answerOptionsContainer">
                            <div class="answer-option">
                                <label for="answerOptionL1_1">Option:</label>
                                <input type="text" id="answerOptionL1_1" name="answerOptionL_1_1" required>
                                <input type="radio" id="correctAnswerL1_1" name="correctAnswerL_1" value="" required>
                                <label for="correctAnswerL1_1">Correct</label>
                            </div>
                        </div>
                        <button type="button" class="addAnswerOption" data-question-id="1" data-tab="listening">Add Answer Option</button>
                    </div>
                </div>
                <button type="button" id="addQuestionListening">Add Question</button>
                <h4>Write</h4>
                <div id="questionsContainerListeningWrite" class="questions-container">
                    <div class="question-container">
                        <h2>Question</h2>
                        <div>
                            <label for="questionTextLW1">Question:</label><br>
                            <textarea id="questionTextLW1" name="questionTextLW_1" rows="4" cols="50" required></textarea>
                        </div>
                    </div>
                </div>
                <button type="button" id="addQuestionListeningWrite">Add Question</button>
            </div>
            <div id="speaking" class="tab">
                <h1>Speaking</h1>
                <h3>Questions of Speaking</h3>
                Duration: <input type="text" name="speakingDuration"><br>
                <div id="questionsContainerSpeaking" class="questions-container">
                    <div class="question-container">
                        <h2>Question Speaking Test</h2>
                        <div>
                            <label for="questionTextS1">Question:</label><br>
                            <textarea id="questionTextS1" name="questionTextS_1" rows="4" cols="50" required></textarea>
                        </div>
                    </div>
                </div>
                <button type="button" id="addQuestionSpeaking">Add Question</button>
            </div>
            <div id="writing" class="tab">
                <h1>Writing</h1>
                Title: <input type="text" name="writingTitle"><br>
                Content: <textarea id="writingContent" name="writingContent" rows="30" cols="50" placeholder="Input your writing content here..."></textarea><br>
                Duration: <input type="text" name="writingDuration"><br>
            </div>
        </div>
        <button type="submit">Save topic exam</button>
    </form>
    <jsp:include page="Footer.jsp"></jsp:include>
    <script src="js/main.js"></script>
    <script>
    let questionCountR = 1;
    let answerOptionCountsR = {1: 1}; 
    let questionCountL = 1;
    let answerOptionCountsL = {1: 1}; 
    let questionCountLW = 1;
    let questionCountS = 1;

    document.getElementById("addQuestionReading").addEventListener("click", function () {
        questionCountR++;
        answerOptionCountsR[questionCountR] = 1;
        const container = document.getElementById("questionsContainerReading");
        const newQuestionDiv = document.createElement("div");
        newQuestionDiv.classList.add("question-container");
        newQuestionDiv.innerHTML = `
            <h2>Question ${questionCountR}</h2>
            <div>
                <label for="questionTextR${questionCountR}">Question:</label><br>
                <textarea id="questionTextR${questionCountR}" name="questionTextR_${questionCountR}" rows="4" cols="50" required></textarea>
            </div>
            <h3>Explanation</h3>
            <div>
                <label for="explanationR${questionCountR}">Explanation:</label><br>
                <textarea id="explanationR${questionCountR}" name="explanationR_${questionCountR}" rows="4" cols="50" required></textarea>
            </div>
            <h3>Answer Options</h3>
            <div class="answerOptionsContainer">
                <div class="answer-option">
                    <label for="answerOptionR${questionCountR}_1">Option 1:</label>
                    <input type="text" id="answerOptionR${questionCountR}_1" name="answerOptionR_${questionCountR}_1" required>
                    <input type="radio" id="correctAnswerR${questionCountR}_1" name="correctAnswerR_${questionCountR}" value="" required>
                    <label for="correctAnswerR${questionCountR}_1">Correct</label>
                </div>
            </div>
            <button type="button" class="addAnswerOption" data-question-id="${questionCountR}" data-tab="reading">Add Answer Option</button>
        `;
        container.appendChild(newQuestionDiv);
    });

    document.getElementById("addQuestionListening").addEventListener("click", function () {
        questionCountL++;
        answerOptionCountsL[questionCountL] = 1;
        const container = document.getElementById("questionsContainerListening");
        const newQuestionDiv = document.createElement("div");
        newQuestionDiv.classList.add("question-container");
        newQuestionDiv.innerHTML = `
            <h2>Question ${questionCountL}</h2>
            <div>
                <label for="questionTextL${questionCountL}">Question:</label><br>
                <textarea id="questionTextL${questionCountL}" name="questionTextL_${questionCountL}" rows="4" cols="50" required></textarea>
            </div>
            <h3>Explanation</h3>
            <div>
                <label for="explanationL${questionCountL}">Explanation:</label><br>
                <textarea id="explanationL${questionCountL}" name="explanationL_${questionCountL}" rows="4" cols="50" required></textarea>
            </div>
            <h3>Answer Options</h3>
            <div class="answerOptionsContainer">
                <div class="answer-option">
                    <label for="answerOptionL${questionCountL}_1">Option 1:</label>
                    <input type="text" id="answerOptionL${questionCountL}_1" name="answerOptionL_${questionCountL}_1" required>
                    <input type="radio" id="correctAnswerL${questionCountL}_1" name="correctAnswerL_${questionCountL}" value="" required>
                    <label for="correctAnswerL${questionCountL}_1">Correct</label>
                </div>
            </div>
            <button type="button" class="addAnswerOption" data-question-id="${questionCountL}" data-tab="listening">Add Answer Option</button>
        `;
        container.appendChild(newQuestionDiv);
    });

    document.getElementById("addQuestionListeningWrite").addEventListener("click", function () {
        questionCountLW++;
        const container = document.getElementById("questionsContainerListeningWrite");
        const newQuestionDiv = document.createElement("div");
        newQuestionDiv.classList.add("question-container");
        newQuestionDiv.innerHTML = `
            <h2>Question ${questionCountLW}</h2>
            <div>
                <label for="questionTextLW${questionCountLW}">Question:</label><br>
                <textarea id="questionTextLW${questionCountLW}" name="questionTextLW_${questionCountLW}" rows="4" cols="50" required></textarea>
            </div>
        `;
        container.appendChild(newQuestionDiv);
    });

    document.getElementById("addQuestionSpeaking").addEventListener("click", function () {
        questionCountS++;
        const container = document.getElementById("questionsContainerSpeaking");
        const newQuestionDiv = document.createElement("div");
        newQuestionDiv.classList.add("question-container");
        newQuestionDiv.innerHTML = `
            <h2>Question ${questionCountS}</h2>
            <div>
                <label for="questionTextS${questionCountS}">Question:</label><br>
                <textarea id="questionTextS${questionCountS}" name="questionTextS_${questionCountS}" rows="4" cols="50" required></textarea>
            </div>
        `;
        container.appendChild(newQuestionDiv);
    });

    document.addEventListener("click", function (event) {
        if (event.target.classList.contains("addAnswerOption")) {
            const questionId = event.target.dataset.questionId;
            const tab = event.target.dataset.tab;
            const answerOptionCounts = (tab === "reading") ? answerOptionCountsR : answerOptionCountsL;
            const currentCount = answerOptionCounts[questionId] || 1;
            answerOptionCounts[questionId] = currentCount + 1;
            const answerOptionCount = answerOptionCounts[questionId];
            const container = event.target.previousElementSibling;
            const newOptionDiv = document.createElement("div");
            newOptionDiv.classList.add("answer-option");
            const prefix = (tab === "reading") ? "R" : "L";

            newOptionDiv.innerHTML = `
                <label for="answerOption${prefix}${questionId}_${answerOptionCount}">Option ${answerOptionCount}:</label>
                <input type="text" id="answerOption${prefix}${questionId}_${answerOptionCount}" name="answerOption${prefix}_${questionId}_${answerOptionCount}" required>
                <input type="radio" id="correctAnswer${prefix}${questionId}_${answerOptionCount}" name="correctAnswer${prefix}_${questionId}" value="" required>
                <label for="correctAnswer${prefix}${questionId}_${answerOptionCount}">Correct</label>
            `;
            container.appendChild(newOptionDiv);
        }
    });

   
    document.addEventListener("input", function (event) {
        if (event.target.name && event.target.name.startsWith("answerOption")) {
            const optionInput = event.target;
            const optionId = optionInput.id;
            const prefix = optionId.charAt(11); // R hoặc L
            const questionId = optionId.split("_")[1];
            const optionIndex = optionId.split("_")[2];
            const radioButton = document.getElementById("correctAnswer" + prefix + questionId + "_" + optionIndex);
            if (radioButton) {
                radioButton.value = optionInput.value || "";
            }
        }
    });

    const fileInput = document.getElementById('listening');
    const playButton = document.getElementById('play');
    let selectedFile;

    const CLOUD_NAME = "dsdwkvvzr";
    const UPLOAD_PRESET = "SWP_PROJECT";

    fileInput.addEventListener('change', async function (event) {
        selectedFile = event.target.files[0];
        if (selectedFile) {
            playButton.disabled = false;
            document.getElementById('output').innerHTML = `Selected file: ${selectedFile.name}`;

            // Upload file lên Cloudinary
            if (!selectedFile) return alert("No file selected!");
            const formData = new FormData();
            formData.append("file", selectedFile);
            formData.append("upload_preset", UPLOAD_PRESET);

            document.getElementById('output').innerHTML = "Uploading...";

            try {
                const response = await fetch(`https://api.cloudinary.com/v1_1/dsdwkvvzr/upload`, {
                    method: "POST",
                    body: formData
                });

                const data = await response.json();
                if (data.secure_url) {
                    document.getElementById('audioUrl').value = data.secure_url; 
                    document.getElementById('output').innerHTML = 
                        `Upload successful! <br><a href="${data.secure_url}" target="_blank">Download Audio</a>`;
                } else {
                    document.getElementById('output').innerHTML = "Upload failed!";
                }
            } catch (error) {
                console.error("Upload error:", error);
                document.getElementById('output').innerHTML = "Upload error!";
            }
        }
    });

    playButton.addEventListener('click', () => {
        if (!selectedFile) return alert("No audio file selected!");
        const audioUrl = URL.createObjectURL(selectedFile);
        const audio = new Audio(audioUrl);
        audio.play();
    });

    function showTab(tabId) {
        const tabs = document.querySelectorAll('.tab');
        tabs.forEach(tab => tab.classList.remove('active'));
        document.getElementById(tabId).classList.add('active');
    }
    </script>
</body>
</html>