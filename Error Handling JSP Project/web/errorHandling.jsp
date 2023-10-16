<%-- 
    Document   : errorHandling
    Created on : 25-Aug-2023, 12:20:44 pm
    Author     : pankaj kumar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    </head>
    <body>
        <div class="container p-3 text-center">
            <img src="images/error.png"/>
            <h1 class="display-4">Something went Wrong!!!</h1>
            <p><%= exception %></p>
            <a class="btn btn-outline-primary" href="index.html">Home Page</a>
        </div>
    </body>
</html>
