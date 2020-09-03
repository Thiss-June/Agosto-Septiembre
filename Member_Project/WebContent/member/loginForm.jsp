<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
$(function(){
	$("#loginBtn").click(function(){
		if($("#userid").val()==""){
			alert("ID 입력");
			$("#userid").focus();
			return false;
		}//userid
		if($("#pwd").val()==""){
			alert("패스워드 입력");
			$("#pwd").focus();
			return false;
		}//pwd
		$.ajax({
			type:"post",
			url:"loginPro.jsp",
			data:{"userid":$("#userid").val(),"pwd":$("#pwd").val()},
			success:function(d){
				//alert(d.trim())
				if(d.trim()==-1){
					alert("회원이 아닙니다. 회원가입하세요");
				}else if(d.trim()==2){
					alert("비밀번호가 틀립니다. 비밀번호 확인하세요.");
				}else if(d.trim()==0){
					alert("일반회원 로그인")
					$(location).attr("href","memberView.jsp");
				}else if(d.trim()==1){
					alert("관리자 로그인")
					$(location).attr("href","memberList.jsp");
				}
			},
			error:function(e){
				alert("error"+e);
			}
		})
	});
});
</script>
</head>
<body>
<table>
	<tr>
		<td>아이디</td>
		<td><input type="text" name ="userid" id="userid"></td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td><input type="password" name ="pwd" id="pwd"></td>
	</tr>

	<tr>
	 <td colspan="2" align="center">
	 <input type="button" value="로그인" id="loginBtn">
	 <input type="reset"  value="취소">
	 <input type="button" value="회원가입" onclick="location.href='memberForm.jsp'">
	 </td>
	 </tr>
</table>
</body>
</html>