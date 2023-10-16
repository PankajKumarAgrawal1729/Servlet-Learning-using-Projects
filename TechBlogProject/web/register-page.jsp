<%-- 
    Document   : register_page
    Created on : 09-Sept-2023, 3:40:58 pm
    Author     : pankaj-13162
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="css/styles.css"/>
        <style>
            .banner-background{
                clip-path: polygon(30% 0, 70% 0, 100% 0, 100% 91%, 63% 100%, 22% 91%, 0 99%, 0 0);
            }
        </style>
        <title>Register Page</title>
    </head>
    <body>
        <%@include file="navbar.jsp" %>
        <main class="d-flex align-items-center primary-background banner-background" style="padding-bottom: 80px; padding-top: 80px;">
            <div class="container">
                <div class="col-md-6 offset-md-3">
                    <div class="card">
                        <div class="card-header primary-background text-white text-center">
                            <span class="fa fa-user-circle fa-3x"><h3>Register Here</h3></span>
                        </div>

                        <div class="card-body">  
                            <form id="reg-form" action="RegisterServlet" method="POST">
                                <div class="mb-3">
                                    <label for="user_name" class="form-label">User Name</label>
                                    <input name="user_name" type="text" class="form-control" id="user_name" aria-describedby="emailHelp" placeholder="Enter Name" required>

                                </div>

                                <div class="mb-3">
                                    <label for="exampleInputEmail1" class="form-label">Email address</label>
                                    <input name="user_email" type="email" class="form-control" id="user_email" aria-describedby="emailHelp" placeholder="Enter email" required>
                                    <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
                                </div>

                                <div class="mb-3">
                                    <label for="exampleInputPassword1" class="form-label">Password</label>
                                    <input name="user_password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password" required>
                                </div>

                                <div class="mb-3">
                                    <label for="gender" class="form-label">Select Gender</label>
                                    <br>
                                    <input type="radio" id="male" name="gender" value="Male" required> Male
                                    <input type="radio" id="female" name="gender" value="Female"> Female
                                    <input type="radio" id="other" name="gender" value="Other"> Other
                                </div>

                                <div class="form-group">
                                    <textarea class="form-control" id="about" name="about" rows="5" cols="30" placeholder="Enter something anout yourself..."></textarea>
                                </div>

                                <br/>
                                <div class="mb-3 form-check">
                                    <input name="check" type="checkbox" class="form-check-input" id="exampleCheck1" required>
                                    <label class="form-check-label" for="exampleCheck1">Agree terms and conditions</label>
                                </div>

                                <div id="loader" class="container text-center" style="display: none;">
                                    <span class="fa fa-refresh fa-spin fa-2x"></span>
                                    <h5>Please wait...</h5>

                                </div>
                                <button id="submit-btn" type="submit" class="btn btn-primary">Submit</button>

                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </main>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
        <script src="js/script.js" type="text/javascript"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <script>
            $(document).ready(function () {
                $("#reg-form").on("submit", function (ev) {
                    ev.preventDefault();
                    $("#submit-btn").hide();
                    $("#loader").show();
                    let form = new FormData(this);
                    //send to registerservlet
                    $.ajax({
                        url: "RegisterServlet",
                        type: "POST",
                        data: form,
                        success: function (data) {
                            console.log(data);
                            $("#submit-btn").show();
                            $("#loader").hide();
                            $("#reg-form")[0].reset();
                            if(data.trim() === 'Done'){
                                swal("Registered Successfully.")
                                    .then(() => {
                                        window.location = "login-page.jsp";
                                    });
                            }
                            else{
                                swal(data);
                            }
                        },
                        error: function () {
                            $("#submit-btn").show();
                            $("#loader").hide();
                            swal("Something went wrong.");

                        },
                        processData: false,
                        contentType: false
                    })
                });
            });
        </script>
    </body>
</html>
