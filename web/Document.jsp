<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Manage Documents</title>

        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="css/styleindex.css">
    </head>
        <body>
        <jsp:include page="Menu.jsp"></jsp:include>

        <div class="container mt-5">
            <h2>Document Management</h2>
            <c:if test="${empty documents}">
                <p class="text-danger text-center">Không có tài liệu nào.</p>
            </c:if>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Title</th>
                        <th>Content</th>
                        <th>File</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="doc" items="${documents}">
                        <tr>
                            <td>${doc.id}</td>
                            <td>${doc.title}</td>
                            <td>${doc.content}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${not empty doc.filePath}">
                                        <a href="${doc.filePath}" target="_blank" class="btn btn-link">View</a>
                                    </c:when>
                                    <c:otherwise>
                                        No file
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td>
                                <a href="EditDocument.jsp?id=${doc.id}" class="btn btn-warning btn-sm">Edit</a>
                                <form action="DocumentServlet" method="post" style="display:inline;">
                                    <input type="hidden" name="action" value="delete">
                                    <input type="hidden" name="id" value="${doc.id}">
                                    <button type="submit" class="btn btn-danger btn-sm" onclick="return confirm('Bạn có chắc muốn xóa tài liệu này?');">
                                        Delete
                                    </button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <a href="AddingDocument.jsp" class="btn btn-success">Add New Document</a>
        </div>

        <jsp:include page="Footer.jsp"></jsp:include>
    </body>
</html>
