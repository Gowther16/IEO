<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
        <div>
            <h2>Scoring Test</h2>
            <div>
                <div class="container mt-4">
                    <h2>Scoring Test</h2>
                    <div class="table-responsive">
                        <table class="table table-striped table-hover">
                            <thead class="table-dark">
                                <tr>
                                    <th>Test</th>
                                    <th>Student Name</th>
                                    <th>Email</th>
                                    <th>Score</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="r" items="${exam}">
                                <form action="scoreRead" method="POST">
                                    <tr>
                                        <td>${r.getTestId()}<input type="hidden" name="test_id" value="${r.getTestId()}"/></td>
                                        <td>${r.getStudent_name()}<input type="hidden" name="test_id" value="${r.getStudent_name()}"/></td>
                                        <td>${r.getEmail()}<input type="hidden" name="test_id" value="${r.getEmail()}"/></td>
                                        <td><button type="submit">Score</button></td>
                                    </tr>
                                </form>
                                    
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="Footer.jsp"></jsp:include>
        <<script src="js/main.js"></script>>
    </body>

</html>
