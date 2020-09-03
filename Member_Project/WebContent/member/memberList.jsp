
<%@page import="org.member.dto.MemberDTO"%>
<%@page import="org.member.dao.MemberDAOImpl"%>
<%@page import="org.member.dao.MemberDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="member.js"></script>
<%
String userid=(String)session.getAttribute("userid");
request.setCharacterEncoding("utf-8");
MemberDAO dao=MemberDAOImpl.getInstance();
ArrayList<MemberDTO>arr=dao.memList(); //select * from member
int count=dao.getCount();
%>
</head>
<body>
<div class="container">

<div align="right"><a href="memberView.jsp"><%=userid %> 관리자님 반갑습니다.</a>
<a href="logout.jsp">로그아웃</a><br>
<a href="../board/list.jsp">게시판으로</a>
<h4>전체회원수: <span id="countSpan"><%=count %>명</h4></span>
</div>
<h3>회원목록</h3>
<table class="table table-hover">
<thead class="thead-dark">
	<tr>
		<th>이름</th>
		<th>아이디</th>
		<th>전화번호</th>
		<th>이메일</th>
		<th>구분</th>
		<th>삭제</th>
	</tr>
</thead>
<tbody>
<% 
	for(MemberDTO member: arr) {
		String mode=member.getAdmin()==0?"일반회원":"관리자";
%>

	<tr>
		<td><%=member.getName() %></td>
		<td><%=member.getUserid() %></td>
		<td><%=member.getPhone() %></td>
		<td><%=member.getEmail() %></td>
		<td><%=mode%></td>
		<td><a href="javascript:del('<%=member.getUserid() %>','<%=mode%>')">삭제</a></td>
	</tr>
<%		
	}
%>
</tbody>
</tbody>
</table>
</div>
</body>
</html>