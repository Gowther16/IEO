<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>FAQ - Frequently Asked Questions</title>
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
            <div class="container mt-4">
                <h2>FAQ Management</h2>

                <!-- Form Thêm Câu Hỏi -->
                <form action="FAQServlet" method="post">
                    <input type="hidden" name="action" value="add">
                    <div class="mb-3">
                        <label class="form-label">Question:</label>
                        <input type="text" class="form-control" name="question" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Answer:</label>
                        <textarea class="form-control" name="answer" required></textarea>
                    </div>
                    <button type="submit" class="btn btn-success">Add FAQ</button>
                </form>

                <hr>

                <!-- Danh sách câu hỏi -->
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Question</th>
                            <th>Answer</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="faq" items="${faqs}">
                        <tr>
                            <td>${faq.id}</td>
                            <td>${faq.question}</td>
                            <td>${faq.answer}</td>
                            <td>
                                <a href="EditFAQ.jsp?id=${faq.id}" class="btn btn-warning">Edit</a>
                                <form action="FAQServlet" method="post">
                                    <input type="hidden" name="action" value="delete">
                                    <input type="hidden" name="id" value="${faq.id}">
                                    <button type="submit" class="btn btn-danger btn-sm" onclick="return confirm('Bạn có chắc muốn xóa?');">Delete</button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        <!--Footer-->
        <jsp:include page="Footer.jsp"></jsp:include>
        <script src="js/main.js"></script>>
    </body>

</html>
