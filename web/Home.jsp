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
        <jsp:include page="Popup.jsp" />
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

            <div class="buttons">
                <button id="prev">&#10094;</button> 
                <button id="next">&#10095;</button> 
            </div>
        </div>

        <!-- Live Lessons Section -->
        <section class="live-lessons py-5">
            <div class="container">
                <h2 class="text-center mb-4">Join Our Live Lessons for Advice from the Experts</h2>
                <p class="text-center text-muted mb-5">Build your confidence in ALL IELTS skills and prepare for studying abroad with our daily live lessons</p>
                <div class="row">
                    <!-- Lesson 1 -->
                    <div class="col-md-4 mb-4">
                        <div class="card lesson-card">
                            <div class="card-body">
                                <span class="badge bg-warning text-dark mb-2">WRITING</span>
                                <h5 class="card-title">Academic Writing Task 2 - Problem & Solution Essays</h5>
                                <p class="card-text text-muted">InterGreat Education Group</p>
                                <ul class="list-unstyled text-muted">
                                    <li><i class="far fa-calendar-alt me-2"></i> 31/03/2025</li>
                                    <li><i class="far fa-clock me-2"></i> 19:00 - 20:00 (GMT +7)</li>
                                    <li><i class="fas fa-users me-2"></i> 900+ Attending</li>
                                    <li><i class="far fa-comment me-2"></i> English</li>
                                    <li><i class="fas fa-dollar-sign me-2"></i> Free</li>
                                </ul>
                                <a href="lesson1.html" class="btn btn-warning w-100 join-btn">Join</a>
                            </div>
                        </div>
                    </div>
                    <!-- Lesson 2 -->
                    <div class="col-md-4 mb-4">
                        <div class="card lesson-card">
                            <div class="card-body">
                                <span class="badge bg-warning text-dark mb-2">WRITING</span>
                                <h5 class="card-title">Academic Writing Task 1 - Complex Charts</h5>
                                <p class="card-text text-muted">InterGreat Education Group</p>
                                <ul class="list-unstyled text-muted">
                                    <li><i class="far fa-calendar-alt me-2"></i> 03/04/2025</li>
                                    <li><i class="far fa-clock me-2"></i> 19:00 - 20:00 (GMT +7)</li>
                                    <li><i class="fas fa-users me-2"></i> 250+ Attending</li>
                                    <li><i class="far fa-comment me-2"></i> English</li>
                                    <li><i class="fas fa-dollar-sign me-2"></i> Free</li>
                                </ul>
                                <a href="lesson2.html" class="btn btn-warning w-100 join-btn">Join</a>
                            </div>
                        </div>
                    </div>
                    <!-- Lesson 3 -->
                    <div class="col-md-4 mb-4">
                        <div class="card lesson-card">
                            <div class="card-body">
                                <span class="badge bg-danger text-white mb-2">SPEAKING</span>
                                <h5 class="card-title">Academic Writing Task 2 - Complex Charts</h5>
                                <p class="card-text text-muted">InterGreat Education Group</p>
                                <ul class="list-unstyled text-muted">
                                    <li><i class="far fa-calendar-alt me-2"></i> 03/04/2025</li>
                                    <li><i class="far fa-clock me-2"></i> 20:00 - 21:00 (GMT +7)</li>
                                    <li><i class="fas fa-users me-2"></i> 50+ Attending</li>
                                    <li><i class="far fa-comment me-2"></i> Vietnamese</li>
                                    <li><i class="fas fa-dollar-sign me-2"></i> Free</li>
                                </ul>
                                <a href="lesson3.html" class="btn btn-danger w-100 join-btn">Join</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Study Materials Section -->
        <section class="study-materials py-5">
            <div class="container">
                <h2 class="text-center mb-4">Study Materials</h2>
                <p class="text-center text-muted mb-5">Free resources to boost your IELTS performance</p>
                <div class="row">
                    <!-- Material 1 -->
                    <div class="col-md-4 mb-4">
                        <div class="card lesson-card">
                            <div class="card-body">
                                <span class="badge bg-info text-dark mb-2">READING</span>
                                <h5 class="card-title">Essential IELTS Reading Techniques</h5>
                                <p class="card-text text-muted">InterGreat Education Group</p>
                                <ul class="list-unstyled text-muted">
                                    <li><i class="far fa-calendar-alt me-2"></i> Updated: 29/03/2025</li>
                                    <li><i class="far fa-clock me-2"></i> 15 min read</li>
                                    <li><i class="fas fa-file-alt me-2"></i> PDF Format</li>
                                    <li><i class="far fa-comment me-2"></i> English</li>
                                    <li><i class="fas fa-dollar-sign me-2"></i> Free</li>
                                </ul>
                                <a href="material1.html" class="btn btn-info w-100">Read</a>
                            </div>
                        </div>
                    </div>

                    <!-- Material 2 -->
                    <div class="col-md-4 mb-4">
                        <div class="card lesson-card">
                            <div class="card-body">
                                <span class="badge bg-success text-white mb-2">LISTENING</span>
                                <h5 class="card-title">IELTS Listening Tips for High Scores</h5>
                                <p class="card-text text-muted">InterGreat Education Group</p>
                                <ul class="list-unstyled text-muted">
                                    <li><i class="far fa-calendar-alt me-2"></i> Updated: 01/04/2025</li>
                                    <li><i class="far fa-clock me-2"></i> 10 min read</li>
                                    <li><i class="fas fa-headphones me-2"></i> Audio + PDF</li>
                                    <li><i class="far fa-comment me-2"></i> English</li>
                                    <li><i class="fas fa-dollar-sign me-2"></i> Free</li>
                                </ul>
                                <a href="material2.html" class="btn btn-success w-100">Read</a>
                            </div>
                        </div>
                    </div>

                    <!-- Material 3 -->
                    <div class="col-md-4 mb-4">
                        <div class="card lesson-card">
                            <div class="card-body">
                                <span class="badge bg-warning text-dark mb-2">WRITING</span>
                                <h5 class="card-title">Academic Writing Vocabulary</h5>
                                <p class="card-text text-muted">InterGreat Education Group</p>
                                <ul class="list-unstyled text-muted">
                                    <li><i class="far fa-calendar-alt me-2"></i> Updated: 05/04/2025</li>
                                    <li><i class="far fa-clock me-2"></i> 20 min read</li>
                                    <li><i class="fas fa-file-word me-2"></i> DOCX Format</li>
                                    <li><i class="far fa-comment me-2"></i> English</li>
                                    <li><i class="fas fa-dollar-sign me-2"></i> Free</li>
                                </ul>
                                <a href="material3.html" class="btn btn-warning w-100">Read</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>


        <!--Box chat-->
        <jsp:include page="ChatBox.jsp"></jsp:include>

            <!--Footer-->
        <jsp:include page="Footer.jsp"></jsp:include>
        <script src="js/main.js"></script>
    </body>

</html>