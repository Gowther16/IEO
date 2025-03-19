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

        <!-- Custom CSS -->
        <link rel="stylesheet" href="css/edit_profile.css">
        <link rel="stylesheet" href="css/styleindex.css">
    </head>

    <body>

        <!-- Navbar -->
        <jsp:include page="Menu.jsp"></jsp:include>

            <!-- Edit Profile Section -->
            <div class="container my-5">
                <div class="row justify-content-center">
                    <div class="col-lg-5">
                        <div class="card p-4 shadow-lg profile-card">
                            <!-- Form Section -->
                            <form action="myProfile" method="post">
                            <h3 class="text-center text-primary mb-5 fw-bold ">My Profile</h3>
                            <% if (request.getAttribute("mess") != null) { %>
                            <p class="alert alert-danger text-center"><%= request.getAttribute("mess") %></p>
                            <% } %>
                            <% if (request.getAttribute("successMessage") != null) { %>
                            <p class="alert alert-success text-center"><%= request.getAttribute("successMessage") %></p>
                            <% } %>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="name" class="form-label">Name</label>
                                    <input type="text" name="name" value="${sessionScope.user.name}" class="form-control" id="name" placeholder="Your Name">
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="phone" class="form-label">Phone</label>
                                    <input type="text" value="${sessionScope.user.phone}" name="phone" class="form-control" id="phone" placeholder="Phone Number">
                                </div>
                            </div>

                            <div class="mb-3">
                                <label for="dob" class="form-label">Date of Birth</label>
                                <input type="date" value="${sessionScope.user.birthdate}" name="birthdate" class="form-control" id="dob">
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Password</label>
                                <button type="button" id="changePasswordBtn" class="btn btn-outline-primary w-100">
                                    Change Password
                                </button>
                                <div id="passwordInputGroup" class="d-none mt-2">
                                    <div class="input-group">
                                        <input type="password" value="${sessionScope.user.password}" name="password" class="form-control" id="password"
                                               placeholder="Enter new password">
                                        <button class="btn btn-outline-secondary" type="button" id="togglePassword">
                                            <i class="fa fa-eye"></i>
                                        </button>
                                    </div>
                                    <button type="button" id="cancelChangePassword" class="btn btn-outline-danger w-100 mt-2">
                                        Cancel
                                    </button>
                                </div>
                            </div>

                            <div class="mb-3">
                                <label for="email" class="form-label">Email</label>
                                <input type="email" value="${sessionScope.user.email}" name="email" class="form-control" id="email" 
                                       placeholder="name@example.com">
                            </div>

                            <button type="submit" class="btn btn-primary w-100">Save changes</button>
                        </form>

                    </div>
                </div>
            </div>
        </div>

        <!-- Footer -->
        <jsp:include page="Footer.jsp"></jsp:include>

        <!-- JavaScript -->
        <script src="js/editProfile.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="js/edit_profile.js"></script>

    </body>
</html>
