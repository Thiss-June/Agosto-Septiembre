<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
request.setCharacterEncoding("utf-8");
int num1=Integer.parseInt(request.getParameter("num1"));
int num2=Integer.parseInt(request.getParameter("num2"));
int sum=num1+num2;
%>
<body>
 	<%
	out.println("첫번째 값 : " + num1); 
	%>
	<br/>
	<%out.println("두번째 값 : " + num2);%>
	<hr/>
	<%out.println("합 : " + (num1+num2));%>
<%
if(num1%2==0){
	
}else{
	
}
%>
	
</body>
</html>