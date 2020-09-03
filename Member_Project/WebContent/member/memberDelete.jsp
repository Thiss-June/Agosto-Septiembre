<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.member.dto.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.member.dao.MemberDAO"%>
<%@page import="org.member.dao.MemberDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String userid=request.getParameter("userid");
	MemberDAO dao=MemberDAOImpl.getInstance();
	dao.memDelete(userid);
	ArrayList<MemberDTO> arr=dao.memList();
	int count=dao.getCount();
	//회원내용, 회원수
	JSONArray jarr=new JSONArray();
	for(MemberDTO m:arr){
		String mode=m.getAdmin()==0?"일반회원":"관리자";
		JSONObject obj=new JSONObject();
		obj.put("name",m.getName());
		obj.put("userid",m.getUserid());
		obj.put("email",m.getEmail());
		obj.put("phone",m.getPhone());
		obj.put("pwd",m.getPwd());
		obj.put("admin",mode);
		jarr.add(obj);
	}
	
	JSONObject countObj=new JSONObject();
	countObj.put("count",count); //회원수
	
	JSONObject mainObj=new JSONObject(); //회원들 내용, 회원수
	mainObj.put("jarr",jarr);
	mainObj.put("countObj",countObj);
	out.println(mainObj.toString());
	
%>