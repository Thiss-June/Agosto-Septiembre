<%@page import="org.member.dto.BoardDTO"%>
<%@page import="org.member.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equv="content-Type" content="text/html"; charset="UTF-8">
<title>Insert title here</title>
<%
request.setCharacterEncoding("utf-8");
int num=Integer.parseInt(request.getParameter("num"));
BoardDAO dao=BoardDAO.getInstance();
BoardDTO board=dao.boardView(num);
%>

</head>
<body>
<h1>글 수정하기</h1>
<form action="updatePro.jsp" method="post">
<input type="hidden" name="num" value=<%=num%>>
<table border="1">
	<tr>
		<td>성명</td>
		<td><%=board.getWriter() %></td>
	</tr>
	<tr>
		<td>제목</td>
		<td><input type="text" name="subject" value="<%=board.getSubject() %>"></td>
	</tr>
	<tr>
		<td>Email</td>
		<td><input type="text" name="email" value="<%=board.getEmail() %>"></td>
	</tr>	
	<tr>
		<td>내용</td>
		<td><textarea cols="50" rows="10" name="content" ><%=board.getContent() %></textarea></td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td><input type="password" name="password"></td>
	</tr>
	<tr>
		<td colspan=2 align="center">
		<input type=submit value="글수정">
		<input type=reset value="다시쓰기">
		</td>
	</tr>
</table>
</form>
</body>
</html>