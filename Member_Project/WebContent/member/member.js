var exp=/^[0-9]{3}-[0-9]{4}-[0-9]{4}$/

$(function(){
	$("#send").click(function(){
		if($("#name").val()==""){
			alert("이름을 넣어주세요.");
			$("#name").focus();
			return false;
			}
		if($("#userid").val()==""){
			alert("아이디를 넣어주세요.");
			$("#userid").focus();
			return false;
			}
		if($("#pwd").val()==""){
			alert("비밀번호를 넣어주세요.");
			$("#pwd").focus();
			return false;
			}
		if($("#pwd").val()!=$("#pwd_check").val()){
			alert("비밀번호가 일치하지 않습니다.");
			$("#pwd_check").focus();
			return false;
			}
		if($("#email").val()==""){
			alert("이메일을 넣어주세요.");
			$("#email").focus();
			return false;
			}
		if($("#phone").val()==""){
			alert("전화번호를 넣어주세요.");
			$("#phone").focus();
			return false;
			}
		if(!$("#phone").val().match(exp)){
				alert("전화번호 양식이 아닙니다.")
				$("#phone").focus();
			return false;
			}
		$("#frm").submit();
	})
	//아이디 입력창
	$("#idcheckBtn").click(function(){
		window.open("idCheck.jsp","","width=800 height=500");
	})
	//아이디 중복확인
	$("#idBtn").on("click",function(){
		$.ajax({
			type:"post",
			url:"idCheckPro.jsp",
			data:{"userid":$("#userid").val()},
			success:function(d){
				//alert(d.trim());
				if(d.trim()=="yes"){
					alert("사용 가능한 아이디입니다.")
					$(opener.document).find("#userid").val($("#userid").val());
					self.close();
				}else{
					alert("사용 불가능한 아이디입니다.")
				}
			},
			error:function(e){
				alert("error:"+e);
			}
		})
	})
	
})//document
//회원 삭제
function del(userid,mode){
	if(mode=='관리자'){
		alert("관리자는 삭제할 수 없습니다.");
		return;
	}
	$.getJSON("memberDelete.jsp",{"userid":userid},function(data){
		var htmlStr="";
		$.each(data.jarr,function(key,val){
			htmlStr +="<tr>";
			htmlStr +="<td>"+val.name+"</td>";
			htmlStr +="<td>"+val.userid+"</td>";
			htmlStr +="<td>"+val.phone+"</td>";
			htmlStr +="<td>"+val.email+"</td>";
			htmlStr +="<td>"+val.admin+"</td>";
			htmlStr +="<td><a href=javascript:del('"+val.userid+"','"+val.admin+"')>삭제</a></td>";
			htmlStr +="</tr>";
			
		}); //each
		$("table tbody").html(htmlStr);
		$("#countSpan").text(data.countObj.count);
		}//
	);//getJSON
}