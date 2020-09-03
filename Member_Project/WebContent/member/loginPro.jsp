<%@page import="org.member.dao.MemberDAOImpl"%>
<%@page import="org.member.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String userid=request.getParameter("userid");
	String pwd=request.getParameter("pwd");
	MemberDAO dao=MemberDAOImpl.getInstance();
	//로그인 체크
	int flag=dao.loginCheck(userid,pwd);
	if(flag==0 || flag==1){
		session.setAttribute("userid", userid);
	}
	out.println(flag);
%>