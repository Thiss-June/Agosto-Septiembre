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
<%
String[] movieList={"타이타닉","시네마천국","혹성탈출","킹콩"};
pageContext.setAttribute("movieList", movieList);
%>

<table>
	<tr>
		<th>index</th>
		<th>count</th>
		<th>title</th>
	</tr>
<c:forEach items="${movieList}" var="movie" varStatus="st"> //반복문
	<tr>
		<td>${st.index}</td>
		<td>${st.count}</td>
		<td>${movie}</td>
		<th>
			<c:if test="${st.first}">
			첫번째
			</c:if>
			<c:if test="${st.last==true}">
			마지막
			</c:if>
		</th>
	</tr>
</c:forEach>
</table>

</body>
</html>