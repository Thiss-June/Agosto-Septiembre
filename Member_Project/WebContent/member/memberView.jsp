<%@page import="org.member.dto.MemberDTO"%>
<%@page import="org.member.dao.MemberDAOImpl"%>
<%@page import="org.member.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
request.setCharacterEncoding("utf-8");
String userid=(String)session.getAttribute("userid");
MemberDAO dao=MemberDAOImpl.getInstance();
MemberDTO member=dao.findById(userid);
%>
</head>
<body>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<%=userid %>님 반갑습니다! / <a href="logout.jsp">로그아웃</a>
<br/><br/>
<a href="../board/list.jsp">게시판으로</a>
<h3>회원정보변경 / <a href="userDelete.jsp">회원탈퇴</a></h3>
<form action="memberUpdate.jsp" method="post">
<input type="hidden" name="userid" value="<%=userid %>">
<table>
	<tr>
		<td>이름</td>
		<td><input type="text" name="name" id="name" value="<%=member.getName()%>"></td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td><input type="password" name="pwd" id="pwd" value="<%=member.getPwd()%>"></td>
		<td></td>
	</tr>
	<tr>
		<td>이메일</td>
		<td><input type="text" name="email" id="email" value="<%=member.getEmail()%>"></td>
		<td></td>
	</tr>
	<tr>
		<td>전화번호</td>
		<td><input type="text" name="phone" id="phone" value="<%=member.getPhone()%>"></td>
		<td></td>
	</tr>
		<tr>
		<td>등급</td>
		<td>
  		<label class="form-check-label">
    	<input type="radio" class="form-check-input" name="admin" value="0" >일반회원
  		</label>
  		<label class="form-check-label">
    	<input type="radio" class="form-check-input" name="admin" value="1">관리자
  		</label>
		<script>
			if(<%=member.getAdmin()%>==0){
				$("input:radio[value=0]").prop("checked",true);
			}else{
				$("input:radio[value=1]").prop("checked",true);
			}
		</script>
		</td>
	</tr>
	<tr>
		<td colspan="2">
		<button id="updateBtn">수정</button>
		<input type="reset" value="취소">
		</td>
	</tr>
</table>
</form>
</body>
</html>