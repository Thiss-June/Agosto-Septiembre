<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.member.dto.CommentDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.member.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
int bnum=Integer.parseInt(request.getParameter("num"));
BoardDAO dao=BoardDAO.getInstance();
ArrayList<CommentDTO> carr=dao.commentList(bnum);
JSONObject mainObj=new JSONObject();

JSONArray jarr=new JSONArray();
for(CommentDTO com: carr) {
	JSONObject obj=new JSONObject();
	obj.put("userid",com.getUserid());
	obj.put("bnum",com.getBnum());
	obj.put("cnum",com.getCnum());
	obj.put("msg",com.getMsg());
	obj.put("regdate",com.getRegdate());
	jarr.add(obj);
}
mainObj.put("jarr",jarr);
out.println(mainObj.toString());
%>