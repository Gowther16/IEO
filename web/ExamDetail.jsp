anm<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>IEO</title>

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
        <jsp:include page="Popup.jsp" />
        <div style="margin-left: auto;margin-right: auto;text-align: center;">
            <c:forEach var="r" items="${exam}">
                <form action="scoreTest" method="GET">
                    <input name="exam_id" value="${r.getExam_id()}">${r.getTest_name()} <button type="Submit">Scoring test</button>
                </form>
                <br>
            </c:forEach>
        </div>

        <!--Footer-->
        <jsp:include page="Footer.jsp"></jsp:include>
        <<script src="js/main.js"></script>>
    </body>

</html>

