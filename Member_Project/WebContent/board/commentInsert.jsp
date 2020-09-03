<%@page import="org.member.dto.CommentDTO"%>
<%@page import="org.member.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
String msg=request.getParameter("msg");
int bnum=Integer.parseInt(request.getParameter("bnum"));
String userid=(String)session.getAttribute("userid");
if(userid==null){ //로그인이 안될 경우
	out.println("1");
}else{ //로그인이 되었을 때
	BoardDAO dao=BoardDAO.getInstance();
	CommentDTO comment=new CommentDTO();
	comment.setUserid(userid);
	comment.setMsg(msg);
	comment.setBnum(bnum);
	dao.commentInsert(comment);
}

%>