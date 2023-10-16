<%-- 
    Document   : home
    Created on : 14-Aug-2023, 4:30:53 pm
    Author     : pankaj Kumar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        
        <%-- Directive Tag: used to import any java package --%>
        <%@page import="java.util.Scanner" %>
        
        <%-- Declarative Tag: code inside it goes outside the service method --%>
        <%!
            int value = 3;
        %>
        
        <%-- Scriptlet tag: code inside it goes in service method --%>
        <%
            int num = 22;
            out.println("Hii Pankaj");
        %>
        
        <%--  --%>
        <%= "My Fav is: " + value %>
        
        <%-- JSP Directive
        @page: importing package. 
        Syntax: <%@page attribute="value"   ..%>
        
        @include: to include another JSP file. Syntax: <%@ include file="filename" %>
        ex: <%@ include file="header.jsp" %>
        
        @taglib: to use some external tag. like used spring framework tag.
        Syntax: <%@ taglib uri="uri" prefix="fx" %>
        ex: <fx:pankaj>
        --%>
    </body>
</html>
