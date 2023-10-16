<%-- 
    Document   : jstlDemo
    Created on : 22-Aug-2023, 9:49:27 am
    Author     : pankaj Kumar
--%>
<%--  --%>
<%@taglib prefix="p" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page errorPage="error.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <p:set var="name" value="Pankaj Kumar"></p:set>
        <p:out value="${name}"></p:out>
        <p:if test="${3 > 2}">
            <h2>This is Correct!</h2>

            <%-- Error Handling in JSP --%>

            <%!
                int n1 = 0;
                int n2 = 30;
            %>
            <%
                int div = n2 / n1;
            %>
            <h1>Division is: <%=div%></h1>
        </p:if>
    </body>
</html>
