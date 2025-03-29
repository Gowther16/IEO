<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Add Document</title>

        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link rel="stylesheet" href="css/styleindex.css">
    </head>
    <body>
        <div class="container mt-5">
            <h2 class="text-center">Add New Document</h2>
            <form action="DocumentServlet" method="post">
                <div class="mb-3">
                    <label for="Title" class="form-label">Title</label>
                    <input type="text" class="form-control" id="Title" name="Title" required>
                </div>
                <div class="mb-3">
                    <label for="content" class="form-label">Content</label>
                    <textarea class="form-control" id="content" name="content" rows="5" required></textarea>
                </div>
                <div class="mb-3">
                    <label for="t_id" class="form-label">Type ID</label>
                    <input type="number" class="form-control" id="t_id" name="t_id" required>
                </div>
                <div class="mb-3">
                    <label for="filePath" class="form-label">Document Link</label>
                    <input type="url" class="form-control" id="filePath" name="filePath" placeholder="Enter document link (Google Drive, OneDrive, etc.)" required>
                </div>
                <button type="submit" class="btn btn-primary">Add Document</button>
                <a href="Document.jsp" class="btn btn-secondary">Cancel</a>
            </form>
        </div>
    </body>
</html>
