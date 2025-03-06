<%-- 
    Document   : HomeListeningTest
    Created on : Mar 6, 2025, 11:03:05 PM
    Author     : admin
--%>

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
        <div class="ielts-exam-library text-center my-5">
            <h2>IELTS Test Collection</h2>
            <div class="container">
                <div class="ielts-test-collection">
                    <div class="card row">
                        <div class="col-md-2">
                            <img src="./images/Bookimg.png">
                        </div>
                        <div class="card-body col-md-10">
                            <h5 class="card-title">IELTS Mock Test 2024</h5>
                            <div class="month">
                                <button class="btn btn-outline-primary">January reading practice test 1</button>
                                <button class="btn btn-outline-primary">January reading practice test 2</button>
                                <button class="btn btn-outline-primary">February reading practice test 1</button>
                                <button class="btn btn-outline-primary">February reading practice test 2</button>
                                <button class="btn btn-outline-primary">March reading practice test 1</button>
                                <button class="btn btn-outline-primary">March reading practice test 2</button>
                            </div>
<!--                            <div class="month col-md-6">
                                <button class="btn btn-outline-primary">May</button>
                                <button class="btn btn-outline-primary">June</button>
                                <button class="btn btn-outline-primary">July</button>
                                <button class="btn btn-outline-primary">August</button>
                            </div>-->
                            <br>
                            <a href="#" class="btn btn-link">View more</a>
                        </div>

                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="Footer.jsp"></jsp:include>
    </body>
</html>
