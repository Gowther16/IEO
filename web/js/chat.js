let socket;

function connectWebSocket() {
    socket = new WebSocket("ws://localhost:8080/IEO/chat");

    socket.onopen = function () {
        console.log("Connected to WebSocket server.");
        socket.send(JSON.stringify({ action: "loadComments" }));
    };

    socket.onmessage = function (event) {
        try {
            const messageData = JSON.parse(event.data);
            console.log("Received message:", messageData);

            if (messageData.error) {
                alert(messageData.error);
                return;
            }

            if (messageData.action === "loadComments") {
                messageData.comments.forEach(comment => displayComment(comment));
            } else {
                displayComment(messageData);
            }
        } catch (error) {
            console.error("Lỗi khi xử lý tin nhắn từ WebSocket:", error);
        }
    };

    socket.onerror = function (error) {
        console.error("WebSocket error:", error);
    };

    socket.onclose = function () {
        console.log("WebSocket connection closed. Reconnecting in 5s...");
        setTimeout(connectWebSocket, 5000);
    };
}

function getUsername() {
    return document.getElementById("session-username")?.value || "Guest";
}

function getUserId() {
    const userId = document.getElementById("session-userid")?.value;
    if (!userId) {
        alert("Bạn phải đăng nhập để bình luận.");
        return null;
    }
    return parseInt(userId);
}

function getAvatar() {
    return "https://upload.wikimedia.org/wikipedia/commons/9/99/Sample_User_Icon.png";
}

function sendComment() {
    const inputField = document.getElementById("comment-input");
    const message = inputField.value.trim();
    const username = getUsername();
    const userId = getUserId();
    const avatar = getAvatar();

    if (!message || !userId) return;

    const data = {
        username,
        userId,
        avatar,
        message,
        action: "newComment"
    };

    if (socket && socket.readyState === WebSocket.OPEN) {
        socket.send(JSON.stringify(data));
        inputField.value = "";
    } else {
        console.error("WebSocket is not open.");
    }
}

function displayComment(data) {
    if (!data) {
        console.error("Comment data is null or undefined");
        return;
    }
    if (!data.message) {
        console.error("Comment message is missing:", data);
        return;
    }
    if (data.commentId === undefined || data.commentId === null || typeof data.commentId !== "number") {
        console.error("Comment ID is invalid:", data);
        return;
    }

    const commentList = document.getElementById("comment-list");
    if (!commentList) {
        console.error("Comment list element not found");
        return;
    }

    let commentDiv = document.createElement("div");
    commentDiv.classList.add("comment");
    commentDiv.dataset.commentId = data.commentId;
    console.log("Displaying comment with ID:", data.commentId);

    let userContainer = document.createElement("div");
    userContainer.classList.add("user-container");

    let avatar = document.createElement("img");
    avatar.classList.add("avatar");
    avatar.src = data.avatar || getAvatar();

    let nameSpan = document.createElement("span");
    nameSpan.classList.add("name");
    nameSpan.textContent = data.username || "Unknown User";

    let timeSpan = document.createElement("span");
    timeSpan.classList.add("time");
    timeSpan.textContent = formatDateTime(data.createAt || new Date());

    userContainer.appendChild(avatar);
    userContainer.appendChild(nameSpan);
    userContainer.appendChild(timeSpan);

    let contentDiv = document.createElement("div");
    contentDiv.classList.add("comment-content");

    let textP = document.createElement("p");
    textP.classList.add("text");
    textP.textContent = data.message;

    contentDiv.appendChild(textP);

    commentDiv.appendChild(userContainer);
    commentDiv.appendChild(contentDiv);

    commentList.appendChild(commentDiv);
}

function formatDateTime(dateString) {
    const date = new Date(dateString);
    const day = date.getDate().toString().padStart(2, "0");
    const month = (date.getMonth() + 1).toString().padStart(2, "0"); // Sửa lỗi ở đây
    const year = date.getFullYear();
    const hours = date.getHours().toString().padStart(2, "0");
    const minutes = date.getMinutes().toString().padStart(2, "0");
    return `${day}/${month}/${year} ${hours}:${minutes}`;
}

document.addEventListener("DOMContentLoaded", function () {
    connectWebSocket();

    const sendButton = document.getElementById("comment-submit");
    const inputField = document.getElementById("comment-input");

    if (sendButton && inputField) {
        sendButton.addEventListener("click", sendComment);
        inputField.addEventListener("keypress", (event) => {
            if (event.key === "Enter") sendComment();
        });
    } else {
        console.error("Không tìm thấy input hoặc button.");
    }
});
