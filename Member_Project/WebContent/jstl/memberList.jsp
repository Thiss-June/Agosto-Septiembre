<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<sql:setDataSource dataSource="jdbc/member" var="dataSource" scope="application"/>
<sql:query var="resultSet" dataSource="${dataSource}">
select * from member
</sql:query>

<table boarder="1">
<tr>
<c:forEach items="${resultSet.columnNames}" var="columnName">
	<th>${columnName}</th>
</c:forEach>
</tr>
<c:forEach items="${resultSet.rowsByIndex}" var="row">
	<tr>
	<c:forEach items="${row}" var="column">
		<td>${column}</td>
	</c:forEach>
	</tr>
</c:forEach>
</table>
</body>
</html>




