<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Score Read</title>

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
        <form action="scoreListen" method="POST">
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
                        <c:forEach items="${lse}" var="r">
                            <tr>
                                <td>${r.getSTT()}</td>
                                <td>${r.getQuestion()}</td>
                                <td>${r.getAnswer()}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
            <input type="hidden" name="ar" value="${ar}">
            <input type="hidden" name="test_id" value="${test_id}">
            <button type="submit" class="btn btn-primary mt-3">Auto Scoring</button>
        </form>
<!--        Footer
        <jsp:include page="Footer.jsp"></jsp:include>
        <script src="js/main.js"></script>-->
    </body>
</html>
