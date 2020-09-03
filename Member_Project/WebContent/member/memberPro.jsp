<%@page import="org.member.dao.MemberDAOImpl"%>
<%@page import="org.member.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="member" class="org.member.dto.MemberDTO"/>
<jsp:setProperty property="*" name="member"/>
<%
MemberDAO dao=MemberDAOImpl.getInstance();
dao.memInsert(member);
response.sendRedirect("loginForm.jsp");
%>