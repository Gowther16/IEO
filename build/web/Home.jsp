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
        <!-- Hero Section -->
        <div class="slider">
            <div class="list">
                <div class="item">
                    <img src="./images/tai-lieu-ielst-band-8.0.jpg">
                </div>
                <div class="item">
                    <img src="./images/ielts2.jpg">
                </div>
                <div class="item">
                    <img src="./images/ielts3.png">
                </div>
            </div>
        </div>

        <!--button prev and next-->
        <div class="buttons">
            <button id="prev"><</button>
            <button id="next">></button>
        </div>

        <!--Footer-->
        <jsp:include page="Footer.jsp"></jsp:include>
        <<script src="js/main.js"></script>>
    </body>

</html>