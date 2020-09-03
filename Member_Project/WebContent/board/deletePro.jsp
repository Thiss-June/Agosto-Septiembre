<%@page import="org.member.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("utf-8");
int num=Integer.parseInt(request.getParameter("num"));
BoardDAO dao=BoardDAO.getInstance();
int flag=dao.boardDelete(num);
if(flag==1){
%>
	<script>
	  alert("삭제완료");
	  location.href="list.jsp";
	</script>
<%
	//response.sendRedirect("list.jsp");
}
%>