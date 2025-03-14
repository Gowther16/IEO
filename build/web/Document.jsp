

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Documents</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/styleindex.css">
</head>
<body>
    <div class="container mt-5">
        <h2>Document Management</h2>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Title</th>
                    <th>Content</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <%-- Dữ liệu tài liệu sẽ được lấy từ Servlet và hiển thị bằng JSTL --%>
                <c:forEach var="doc" items="${documentList}">
                    <tr>
                        <td>${doc.d_id}</td>
                        <td>${doc.title}</td>
                        <td>${doc.content}</td>
                        <td>
                            <a href="editDocument?id=${doc.d_id}" class="btn btn-warning btn-sm">Edit</a>
                            <a href="deleteDocument?id=${doc.d_id}" class="btn btn-danger btn-sm">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <a href="AddingDocument.jsp" class="btn btn-success">Add New Document</a>
    </div>
</body>
</html>
