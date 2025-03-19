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
        
        <link rel="stylesheet" href="css/taketest.css">
    </head>

    <body>
        <jsp:include page="Menu.jsp"></jsp:include>
        <jsp:include page="Popup.jsp" />
        <div id="test">
            <form action="readingTest" method="POST">
                <h1 id="t_title">TEST</h1>
                <p class="t_content">1. Make sure you read the exam rules.</p>
                <p class="t_content">2. All exams are timed, and when the time is up, your exam will be automatically submitted.</p>
                <p class="t_content">Finally, we wish you a smooth exam, and that you will get the results you want. Thank you for your trust in us.</p>
                <button class="take_test_btn">Take Test</button>
            </form>
        </div>

        <!--Footer-->
        <jsp:include page="Footer.jsp"></jsp:include>
        <<script src="js/main.js"></script>>
    </body>

</html>