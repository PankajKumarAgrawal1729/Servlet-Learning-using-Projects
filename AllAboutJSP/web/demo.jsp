<%-- 
    Document   : demo
    Created on : 21-Aug-2023, 4:34:04 pm
    Author     : pankaj-13162
--%>
<%-- Page Directive --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page  import="java.util.Random"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            *{
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }
        </style>
    </head>
    <body>
        <%-- Declarative Tag --%>
        <%! 
           int a = 5;
           int b = 6;
public int getSum(){
return a + b;
}
        %> ̰

        <%-- Scriptlet Tag --%>
        <% 
out.println("<h2>First Number: " + a + "</h2>");
out.println("<h2>Second Number: " + b + "</h2>");
        %>

        <%-- Expression Tag --%>

        <h1>Sum is: <%= getSum() %> </h1>
        
        <%-- Include Directive --%>
        <%@include file="header.jsp" %>
        <h1>Random Number: <%
                Random randomObj = new Random();
                int num = randomObj.nextInt(10);
            %>
            <%= num %>
        </h1>
        
        <%-- Directive Tag:
        1. Page Directive
        2. Include Directive
        3. Taglib Directive
        --%>
        
        
        

    </body>
</html>
