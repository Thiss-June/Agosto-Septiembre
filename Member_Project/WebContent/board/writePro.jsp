<%@page import="org.member.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="board" class="org.member.dto.BoardDTO"/>
<jsp:setProperty property="*" name="board"/>
<%
BoardDAO dao=BoardDAO.getInstance();
String ip=request.getRemoteAddr(); //ip주소
board.setIp(ip);
dao.boardInsert(board); //10개 컬럼 세팅

response.sendRedirect("list.jsp");
%>