<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equv="content-Type" content="text/html"; charset="UTF-8">
<title>Insert title here</title>
</head>
<%
request.setCharacterEncoding("utf-8");
int num=0, ref=1, re_step=0, re_level=0;
if(request.getParameter("num")!=null){ //답글
	num = Integer.parseInt(request.getParameter("num"));
	ref = Integer.parseInt(request.getParameter("ref"));
	re_step=Integer.parseInt(request.getParameter("re_step"));
	re_level=Integer.parseInt(request.getParameter("re_level"));
}
%>
<body>
<h1>글쓰기</h1>
<form action="writePro.jsp" method="post">
<input type="hidden" name="num" value=<%=num %>>
<input type="hidden" name="ref" value=<%=ref %>>
<input type="hidden" name="re_step" value=<%=re_step %>>
<input type="hidden" name="re_level" value=<%=re_level %>>

<table border="1">
	<tr>
		<td align="right" colspan="2"><a href="list.jsp">글목록</a>
	</tr>
	<tr>
		<td>성명</td>
		<td><input type="text" name="writer"></td>
	</tr>
	<tr>
		<td>제목</td>
		<td><%
		if(request.getParameter("num")!=null){ //답글
		%>		
		<input type="text" name="subject" value="[답글]">
		<% 		
		}else{ //새글
		%>		
		<input type="text" name="subject">
		<% 		
		}
		%>
		</td>
	</tr>
	<tr>
		<td>Email</td>
		<td><input type="text" name="email"></td>
	</tr>	
	<tr>
		<td>내용</td>
		<td><textarea cols="50" rows="20" name="content"></textarea></td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td><input type="password" name="password"></td>
	</tr>
	<tr>
		<td colspan=2 align="center">
		<input type=submit value="글쓰기">
		<input type=reset value="다시쓰기">
		</td>
	</tr>
</table>
</form>
</body>
</html>