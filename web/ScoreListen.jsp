<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Score Listen</title>
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
        <form action="scoreSpeak" method="POST">
            <h2>Listening Mutiple Choice</h2>
            <div class="table-responsive">
                <table class="table table-bordered table-striped">
                    <!-- Table Header -->
                    <thead class="table-dark">
                        <tr>
                            <th></th>
                            <th>Question</th>
                            <th>Content Answer</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${lsech}" var="r">
                            <tr>
                                <td>${r.getSTT()}</td>
                                <td>${r.getQuestion()}</td>
                                <td>${r.getAnswer()}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
            <h2>Listening Write</h2>
            <div class="table-responsive">
                <table class="table table-bordered table-striped">
                    <!-- Table Header -->
                    <thead class="table-dark">
                        <tr>
                            <th></th>
                            <th>Question</th>
                            <th>Content Answer</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${lsew}" var="r">
                            <tr>
                                <td>${r.getSTT()}</td>
                                <td>${r.getQuestion()}</td>
                                <td>${r.getAnswer()}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
            <div style="text-align: center">
                <h4>Score</h4>
                Input your score here<input type="number" name="markW" min="0" max="10" required>
            </div>

            <input type="hidden" name="alch" value="${alch}">
            <input type="hidden" name="aw" value="${alw}">
            <input type="hidden" name="srd_id" value="${srd_id}">
            <input type="hidden" name="test_id" value="${test_id}">
            <button type="submit" class="btn btn-primary mt-3">Scoring</button>
        </form>
        <!--Footer-->
        <jsp:include page="Footer.jsp"></jsp:include>
        <script src="js/main.js"></script>
    </body>
</html>
