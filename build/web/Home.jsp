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
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container-fluid">
                <a class="navbar-brand" href="home">IEO</a>
                <!-- <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                    aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button> -->

                <ul class="navbar-nav me-auto">

                </ul>
                <div class="search-container">
                    <i class="fas fa-search search-icon"></i>
                    <input class="form-control search-input" type="search" placeholder="Search" aria-label="Search">
                </div>          
            </div>
        </nav>

        <!-- Nav-main -->
        <div class="nav-main">
            <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
                <div class="container">
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mainNav"
                            aria-controls="mainNav" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>

                    <div class="collapse navbar-collapse" id="mainNav">
                        <ul class="navbar-nav me-auto">
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="examDropdown" role="button" data-bs-toggle="dropdown">IELTS Exam Library</a>
                                <ul class="dropdown-menu">
                                    <li><a class="dropdown-item" href="#">Practice Test</a></li>
                                    <li><a class="dropdown-item" href="#">Scoring System</a></li>
                                    <li><a class="dropdown-item" href="#">Sample Question</a></li>
                                </ul>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="courseDropdown" role="button" data-bs-toggle="dropdown">IELTS Courses</a>
                                <ul class="dropdown-menu">
                                    <li><a class="dropdown-item" href="#">Practice Test</a></li>
                                    <li><a class="dropdown-item" href="#">Scoring System</a></li>
                                    <li><a class="dropdown-item" href="#">Sample Question</a></li>
                                </ul>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="prepDropdown" role="button" data-bs-toggle="dropdown">IELTS Prep</a>
                                <ul class="dropdown-menu">
                                    <li><a class="dropdown-item" href="#">Practice Test</a></li>
                                    <li><a class="dropdown-item" href="#">Scoring System</a></li>
                                    <li><a class="dropdown-item" href="#">Sample Question</a></li>
                                </ul>
                            </li>
                        </ul>
                        <li class="nav-item ">
                            <ul class="navbar-nav me-auto">
                                <c:if test="${sessionScope.user == null}">
                                    <li class="nav-item"><a class="nav-link" href="login">Sign In</a></li> 
                                    <li class="nav-item"><a class="nav-link" href="Register.jsp">Register</a></li>
                                    </c:if>

                                <c:if test="${sessionScope.user != null}"> 
                                    <li class="nav-item dropdown">
                                        <a class="nav-link dropdown-toggle" href="#" id="prepDropdown" role="button" data-bs-toggle="dropdown">
                                            ${sessionScope.user.name}
                                        </a>
                                        <ul class="dropdown-menu">
                                            <li><a class="dropdown-item" href="#">My Profile</a></li>
                                            <li><a class="dropdown-item" href="logout">Log Out</a></li>
                                        </ul>
                                    </li>
                                </c:if>    
                            </ul>
                        </li>



                    </div>
                </div>
            </nav>
        </div>

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
        <footer class="footer">
            <div class="container">
                <div class="row">
                    <div class="col">
                        <h4>Company</h4>
                        <ul>
                            <li><a href="#">About us</a></li>
                            <li><a href="#">Our services</a></li>
                            <li><a href="#">Privacy policy</a></li>
                            <li><a href="#">Affiliate program</a></li>
                        </ul>
                    </div>
                    <div class="col">
                        <h4>Get help</h4>
                        <ul>
                            <li><a href="#">FAQ</a></li>
                            <li><a href="#">Returns</a></li>
                            <li><a href="#">Payment options</a></li>
                            <li><a href="#">Exam program</a></li>
                        </ul>
                    </div>
                    <div class="col">
                        <h4>Follow us</h4>
                        <div class="social-links">
                            <a href="#"><i class="fab fa-facebook-f"></i></a>
                            <a href="#"><i class="fab fa-twitter"></i></a>
                            <a href="#"><i class="fab fa-instagram"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
        <script type="module" src="./js/main.js"></script>


    </body>

</html>