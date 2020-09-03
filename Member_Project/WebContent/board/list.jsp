<%@page import="org.member.dto.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.member.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" 
href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" 
integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" 
crossorigin="anonymous">
<title>Insert title here</title>
<%
request.setCharacterEncoding("utf-8");
String pageNum=request.getParameter("pageNum");
if(pageNum==null){
	pageNum="1";
}
int currentPage=Integer.parseInt(pageNum);
String field="",word="";
if(request.getParameter("word")!=null){
	word=request.getParameter("word");
	field=request.getParameter("field");
}
int pageSize=5; //한화면에 보여지는 페이지 수
int startRow=(currentPage-1)*pageSize+1; //1 6 11
int endRow=currentPage*pageSize; //5 10 15
String userid=(String)session.getAttribute("userid");
BoardDAO dao=BoardDAO.getInstance();

ArrayList<BoardDTO> arr=dao.boardList(field, word,startRow,endRow); //select * from member
int count=dao.boardCount(field,word); //예 23
int number=count-(currentPage-1)*pageSize; //1번 페이지 ->23, 2번페이지->18
%>
</head>
<body>
<div align="right" style="margin-right:20px">
<%
if(userid!=null) {
%>
<div align="right"><%=userid %>님 반갑습니다! / <a href="/Member_Project/member/logout.jsp">로그아웃</a></div>
<a href="writeForm.jsp">글쓰기</a>
<%
}
%>
</div>
<h2>게시글 목록(<%=count %>)</h2>

<table class="table table-hover">
<thead class="thead-dark">
		<tr>
		<th scope="col">번호</th>
		<th>제목</th>
		<th>작성자</th>
		<th>작성일</th>
		<th>조회수</th>
		<th>IP 주소</th>
	</tr>
</thead>
<tbody>
<% 
	for(BoardDTO board: arr) {
		
%>

	<tr>
		<td><%=number-- %></td>
		<td><a href="boardView.jsp?num=<%=board.getNum() %>"><%=board.getSubject() %></a></td>
		<td><%=board.getWriter() %></td>
		<td><%=board.getReg_date() %></td>
		<td><%=board.getReadcount()%></td>
		<td><%=board.getIp()%></td>
	</tr>
<%		
	}
%>
</tbody>
</table>
<form action="list.jsp" name="search" method="get">
	<select name="field" size=1>
		<option value="subject">제 목</option>
		<option value="writer">작성자</option>
	</select>
	<input type="text" size=16 name="word">
	<input type="button" value="검색">
</form>
<div align="center" >
<%
if(count>0){ //48나누기5에서            + 48%5==0? 0+1
	int pageCount=count/pageSize+(count%pageSize==0? 0:1);
	int pageBlock=3; //페이지 블럭 수
	int startPage=(int)((currentPage-1)/pageBlock)*pageBlock+1;
	int endPage=startPage+pageBlock-1;
	
	if(endPage > pageCount) { 
		endPage=pageCount;
	}
	if(startPage > pageBlock){ //이전
	%>		
		<a href="list.jsp?pageNum=<%=startPage-pageBlock%>&field=<%=field%>&word=<%=word%>">[이전]</a>
	<%	
	}
	for(int i = startPage; i<=endPage; i++){ //페이지 출력
		if(i==currentPage) {
%>			[<%=i%>]
<%		}else{
	%>	
		<a href="list.jsp?pageNum=<%=i%>&field=<%=field%>&word=<%=word%>"><%=i%></a>		
		
		
	<%
	}
}
	if(endPage < pageCount){ //다음
	%>		
		<a href="list.jsp?pageNum=<%=startPage+pageBlock%>&field=<%=field%>&word=<%=word%>">[다음]</a>
	<%	
	}
}
%>
</div>
</body>
</html>