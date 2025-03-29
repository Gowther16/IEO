<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>IEO</title>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
        <!-- Custom CSS -->
        <link rel="stylesheet" href="css/styleindex.css">

    </head>
    <body>  
        <input type="hidden" id="session-username" value="<%= session.getAttribute("username") != null ? session.getAttribute("username") : "" %>">
        <input type="hidden" id="session-userid" value="<%= session.getAttribute("userId") != null ? session.getAttribute("userId") : "" %>">
        <div class="container-comment">
            <h3>Comment</h3>
            <div id="comments-section">
                <div id="comment-list" class="mb-3"></div>
            </div>
        </div>
        <div class="input-group mt-3">
            <input type="text" id="comment-input" class="form-control" placeholder="Viết bình luận...">
            <button id="comment-submit" class="btn btn-primary">
                <i class="fas fa-paper-plane"></i>
            </button>
        </div>
        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Custom JS -->
        <script src="js/chat.js"></script>
    </body>
</html>
