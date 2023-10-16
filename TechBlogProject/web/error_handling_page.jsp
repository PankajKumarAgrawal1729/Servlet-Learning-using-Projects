<%-- 
    Document   : error_handling_page
    Created on : 11-Sept-2023, 9:35:10 pm
    Author     : pankaj Kumar
--%>
<%@page isErrorPage="true" %>
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
        <title>Sorry! Something went wrong</title>
    </head>
    <body>
        <div class="container text-center">
            <img class="img-fluid" src="images/error.png" alt="Error Image"/>
            <h3 class="display-3">Sorry ! Something went wrong.</h3>
            <%= exception %>
            <a class="btn primary-background btn-lg text-white mt-3" href="profile.jsp">Go to Home Page</a>
        </div>

    </body>
</html>
