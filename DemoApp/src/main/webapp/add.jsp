<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body bgcolor='lightyellow'>
<!-- here request, out object is already there it's called implicit object in JSP-->
<!-- Declaration tag: "!" to put all values outside service method -->
<!-- Directive(Import) tag: "@ page import= Package" to import package -->
<!-- Expression Tag: "=" put everthing inside out.println -->
<!-- script let tag: here whole code go in to service method -->

<%
/* Exception Handling in this file itself */
/* try{
    int num1 = Integer.parseInt(request.getParameter("num1"));
	int num2 = Integer.parseInt(request.getParameter("num2"));

	int sum = num1 + num2;
	out.println("Sum is: " + sum);

}
catch(Exception e){
	out.println("Error: " + e.getMessage());
} */
int p = 3/0;

%>

</body>
</html>