<%@page import="org.member.dao.MemberDAOImpl"%>
<%@page import="org.member.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
//String userid=request.getParameter("userid");
String userid=(String)session.getAttribute("userid");
MemberDAO dao=MemberDAOImpl.getInstance();
dao.memDelete(userid);
response.sendRedirect("loginForm.jsp");
%>