<%-- 
    Document   : page2
    Created on : 25-Aug-2023, 9:58:29 pm
    Author     : pankaj-13162
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>This is Your Page2!</h1>
        
        <%-- Page Redirection --%>
        <%
        response.sendRedirect("page3.jsp");
        %>
    </body>
</html>
