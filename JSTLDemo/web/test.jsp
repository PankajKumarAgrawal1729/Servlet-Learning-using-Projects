<%-- 
    Document   : test
    Created on : 27-Aug-2023, 7:20:28 pm
    Author     : pankaj-13162
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Test Page!</h1>
        <h1>
            <c:out value="${val}"></c:out>
            </h1>


            <!--funtion taglib-->
            <h1>length of Pankaj is <c:out value='${fn:length("Pankaj")}'></c:out></h1>
        <h1>toLowerCase: <c:out value="${fn:toLowerCase('PANKAJ')}"></c:out></h1>
        <h1>contains: <c:out value="${fn:contains('PANKAJ', 'AJ')}"></c:out></h1>
    </body>
</html>
