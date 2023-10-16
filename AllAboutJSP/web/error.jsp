<%-- 
    Document   : error.jsp
    Created on : 25-Aug-2023, 10:02:47 am
    Author     : pankaj-13162
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage = "true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error Handling!!</title>
    </head>
    <body>
        <div style="padding: 20px; color: red; background: #e2e2e2;">
            <h1>Something went Wrong!!</h1>
            <br><br>
            <p><%= exception %> </p>
        </div>
        
    </body>
</html>
