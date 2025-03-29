<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="dal.FAQDAO, Model.FAQ" %>
<%@ page import="java.util.List" %>

<%
    String idParam = request.getParameter("id");
    int id = -1;
    FAQ faq = null;

    if (idParam != null && idParam.matches("\\d+")) { //regex: \\d: random number 0-9 , +: repeate 1 or many times
        id = Integer.parseInt(idParam);
        FAQDAO faqDAO = new FAQDAO();
        
        try {
            faq = faqDAO.getFAQById(id);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit FAQ</title>
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
    <jsp:include page="Menu.jsp"></jsp:include>

    <div class="container mt-5">
        <h2 class="text-center mb-4">Edit FAQ</h2>

        <% if (faq != null) { %>
        <form action="FAQServlet" method="post">
            <input type="hidden" name="action" value="update">
            <input type="hidden" name="id" value="<%= faq.getId() %>">
            
            <div class="mb-3">
                <label class="form-label">Question:</label>
                <input type="text" class="form-control" name="question" value="<%= faq.getQuestion() %>" required>
            </div>
            
            <div class="mb-3">
                <label class="form-label">Answer:</label>
                <textarea class="form-control" name="answer" required><%= faq.getAnswer() %></textarea>
            </div>
            
            <button type="submit" class="btn btn-primary">Update FAQ</button>
            <!--chua xu ly duoc phan back cua nut cancel-->
            <a href="faq.jsp" class="btn btn-secondary">Cancel</a>
        </form>
        <% } else { %>
        <div class="alert alert-danger">FAQ not found!</div>
        <% } %>
    </div>

    <!-- Footer -->
    <jsp:include page="Footer.jsp"></jsp:include>

</body>

</html>
