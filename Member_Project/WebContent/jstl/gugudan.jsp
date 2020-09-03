<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h3>구구단</h3>
<table align="center" border="1">
<c:forEach begin="1" end="9" var="dan">
	${dan}단 <br/>
	<c:forEach begin="1" end="9" var="i">
		${dan}*${i}=${dan*i} 
		<br/>
	</c:forEach>
	<br/>
</c:forEach>
</table>

</body>
</html>