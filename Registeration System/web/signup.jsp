<%-- 
    Document   : signup
    Created on : 04-Aug-2023, 3:03:37 pm
    Author     : pankaj Kumar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!-- Compiled and minified CSS -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">

        <!-- Compiled and minified JavaScript -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>

    </head>
    <body style="background: url(images/wallpaperflare.com_wallpaper.jpg); width: 100vw; height: 100vh; background-attachment: fixed;">
        <div class="container">
            <div class="row">
                <div class="col m10 offset-m1">
                    <div class="card">
                        <div class="card-content">
                            <h2 style="margin-top:10px;" class="center-align">Register Yourself!!</h2>
                            <h5 id="msg" class="center-align"></h5>
                            <div class="form center-align">
                                <form id="register" action="Registration" method="POST">
                                    <input type="text" name="user_name" placeholder="Enter user name here" autocomplete="off">
                                    <input type="password" name="password" placeholder="Enter password here">
                                    <input type="email" name="email" placeholder="Enter your email here" autocomplete="off">
                                    <div class="file-field input-field">
                                        <div class="btn blue">
                                            <span>File</span>
                                            <input name="image" type="file">
                                        </div>
                                        <div class="file-path-wrapper">
                                            <input class="file-path validate" type="text">
                                        </div>
                                    </div>
                                    <button type="submit" class="btn light-blue accent-3">Submit</button>
                                </form>
                            </div>


                            <div class="loader center-align" style="margin-top:10px; display:none;">
                                <div class="preloader-wrapper small active">
                                    <div class="spinner-layer spinner-green-only">
                                        <div class="circle-clipper left">
                                            <div class="circle"></div>
                                        </div><div class="gap-patch">
                                            <div class="circle"></div>
                                        </div><div class="circle-clipper right">
                                            <div class="circle"></div>
                                        </div>
                                    </div>
                                </div>
                                <h6>Please wait...</h6>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
            <script>
                $(document).ready(() => {
                    console.log("Start");
                    $("#register").submit(function (ev, data) { // Use a regular function instead of an arrow function
                        ev.preventDefault();
                        // serialize(if we have text data) all elements, so that we get elements in key-value form
//                        let base = $(this).serialize();
                        let base = new FormData(this);
                        console.log(base);
                        $(".loader").show();
                        $(".form").hide();
                        // ajax request
                        $.ajax({
                            url: "Registration",
                            data: base,
                            type: "POST",
                            success: function (data, textStatus, jqXHR) {
                                console.log("Success");
                                $(".loader").hide();
                                $(".form").show();
                                console.log(data);
                                if (data.trim() === 'done') {
                                    $("#msg").css("color", "green");
                                    $("#msg").html("Successfully Registered!!");
                                    $("#register")[0].reset(); // Reset the form
                                } else {
                                    $("#msg").css("color", "red");
                                    $("#msg").html("Something went Wrong!!");
                                    $("#register")[0].reset();

                                }
                            },
                            error: function (textStatus, errorThrown) {
                                
                                $(".loader").hide();
                                $(".form").show();
                                $("#msg").css("color", "red");
                                $("#msg").html("Something went Wrong!!");
                            },
                            processData: false,
                            contentType: false
                        });
                    });

                });
            </script>
    </body>
</html>
