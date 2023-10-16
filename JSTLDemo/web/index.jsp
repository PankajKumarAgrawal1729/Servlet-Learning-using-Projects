<%-- 
    Document   : index
    Created on : 27-Aug-2023, 7:13:53 pm
    Author     : pankaj-13162
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>

        <!-- set tag: create variable -->
        <!-- default scope is page -->
        <c:set var="val" value="22" scope="application"></c:set>

            <!-- out tag-->
            <h1><c:out value="${val}"></c:out></h1>

            <!-- remove tag -->
        <%--<c:remove var="val"></c:remove>--%>
        <!--<h1>-->
        <%--<c:out value="${val}">This Variable is removed</c:out>--%>
        <!--</h1>-->

        <hr>

        <!--if tag--> 
        <c:if test="${val == 22}">
            <h1>val is 22</h1>
        </c:if>

        <!--switch tag-->
        <!--tag used: choose, when, otherwise-->
        <c:choose>
            <c:when test="${val > 0}">
                <h1>Case 1: Number is Positive</h1>
            </c:when>
            <c:when test="${val < 0}">
                <h1>Case 2: Number is Negative</h1>
            </c:when>
            <c:otherwise>
                <h1>Default Case: Number is Zero.</h1>
            </c:otherwise>
        </c:choose>
                
        <!-- foreach tag -->
        <c:forEach var="i" begin="1" end="10">
            <h2>Value is: <c:out value="${i}"></c:out></h2>
        </c:forEach>
        
        <!--redirect tag-->
        <%--<c:redirect url="test.jsp"></c:redirect>--%>
        
        <!--param tag-->
        <c:url var="myurl" value="https://www.google.com/search">
            <c:param name="q" value="https://www.linkedin.com/in/pankaj-kumar-0322"></c:param>
        </c:url>
        <h2><c:out value="${myurl}"></c:out></h2>
        <%--<c:redirect url="${myurl}"></c:redirect>--%>
        
        
        
    </body>
</html>
