<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="dal.DocumentDAO, Model.Document" %>
<%@ page import="java.util.List" %>
<%
    String idParam = request.getParameter("id");
    int id = -1;
    Document document = null;

    if (idParam != null && idParam.matches("\\d+")) { //regex: \\d: random number 0-9 , +: repeate 1 or many times
        id = Integer.parseInt(idParam);
        DocumentDAO documentDAO = new DocumentDAO();
        
        try {
            document = documentDAO.getDocumentById(id);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <jsp:include page="Menu.jsp"></jsp:include>
    <div class="container mt-5">
        <h2 class="text-center mb-4">Edit Document</h2>
        <% if (document != null) { %>
        <form action="DocumentServlet" method="post">
            <input type="hidden" name="action" value="update">
            <input type="hidden" name="id" value="<%= document.getId() %>">
            <div class="mb-3">
                <label>Title:</label>
                <input type="text" class="form-control" name="title" value="<%= document.getTitle() %>" required>
            </div>
            <div class="mb-3">
                <label>Content:</label>
                <textarea class="form-control" name="content"  required><%= document.getContent() %></textarea>
            </div>
            <div class="mb-3">
                <label>File Path:</label>
                <input type="text" class="form-control" name="filePath" value="<%= document.getFilePath() %>">
            </div>
            <button type="submit" class="btn btn-primary">Update</button>
            <a href="DocumentServlet" class="btn btn-secondary">Cancel</a>
        </form>
            <% } else { %>
        <div class="alert alert-danger">Document not found!</div>
        <% } %>
    </div>
    <!--Footer-->
        <jsp:include page="Footer.jsp"></jsp:include>
        <script src="js/main.js"></script>>
</body>
</html>