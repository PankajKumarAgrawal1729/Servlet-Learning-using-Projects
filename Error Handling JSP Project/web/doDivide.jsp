<%-- 
    Document   : doDivide
    Created on : 25-Aug-2023, 12:09:54 pm
    Author     : pankaj-13162
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="errorHandling.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            //fetch numbers
            int num1 = Integer.parseInt(request.getParameter("num1"));
            int num2 = Integer.parseInt(request.getParameter("num2"));
            int ans = num2 / num1;
        %>

        <h1>Result is  <%= ans %> </h1>

    </body>
</html>
