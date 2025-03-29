<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Score Speak</title>

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
    </head>
    <body>
        <jsp:include page="Menu.jsp"></jsp:include>
        <%--<jsp:include page="Popup.jsp" />--%>
        <div class="container my-5">
            <div class="row">
                <div class="col-md-6 mb-3">
                    <div class="card shadow">
                        <div class="card-body">
                            <h3 class="text-success">Score Speak</h3>
                            <h5 class="mt-4">Question</h5>
                            <c:forEach items="${qs}" var="r">
                                <p class="lead">${r.getQuestion_text()}</p>
                            </c:forEach>
                            <audio controls>
                                <source src="${as.getContent_Answer()}" type="audio/mpeg">
                                Your browser does not support the audio element.
                            </audio>   
                        </div>
                    </div>
                </div>

                <div class="col-md-6 mb-3">
                    <div class="card shadow">
                        <div class="card-body">
                            <h3>Scoring</h3>
                            <p>${aw.getContent_Answer()}</p>
                            <hr>
                            <form action="scoreWrite" method="POST">
                                <div class="mb-3">
                                    <label for="mark" class="form-label fw-bold">Score</label>
                                    <input type="number" name="mark" id="mark" 
                                           class="form-control" min="0" max="10" required>
                                </div>
                                <input type="hidden" name="srd_id" value="${srd_id}">
                                <input type="hidden" name="test_id" value="${test_id}">

                                <button type="submit" class="btn btn-success">Submit</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--Footer-->
        <jsp:include page="Footer.jsp"></jsp:include>
        <script src="js/main.js"></script>
    </body>
</html>
