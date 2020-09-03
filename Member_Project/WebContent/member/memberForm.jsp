<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equv="content-Type" content="text/html"; charset="UTF-8">
<title>Insert title here</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script src = "member.js"></script>
</head>

<body>
<div class="container">
<h2>회원가입</h2>
'*'표시 항목은 필수 입력 항목입니다.
</div>
<p></p>
<div class="container">
<form action="memberPro.jsp" id="frm" method="post">
<div class="form-group">
    <label for="name"> Name:</label>
    <input type="name" class="form-control" placeholder="Enter name" id="name" name="name">
  </div>
  <div class="row">
	<div class="col">
	    <label for="userid">UserId:</label>
		<input type="text" class="form-control" id="userid"	placeholder="Enter userid" name="userid" readonly="readonly">
	</div>
	<div class="col align-self-end">
		<button type="button" id="idcheckBtn" class="btn btn-primary">중복확인</button>
	</div>
</div>

   <div class="form-group">
    <label for="pwd">PWD:</label>
    <input type="password" class="form-control" placeholder="Enter Pwd" id="pwd" name="pwd">
  </div>
   <div class="form-group">
    <label for="pwd_check">PWD_CHECK:</label>
    <input type="password" class="form-control" placeholder="Enter Pwd_check" id="pwd_check" name="pwd_check">
  </div>
   <div class="form-group">
    <label for="email">Email:</label>
    <input type="text" class="form-control" placeholder="Enter Email" id="email" name="email">
  </div>
   <div class="form-group">
    <label for="phone">Phone:</label>
    <input type="text" class="form-control" placeholder="Enter Phone" id="phone" name="phone">
  </div>


  <div class="form-group form-check">
    <label class="form-check-label">
      <input class="form-check-input" type="checkbox"> Remember me
    </label>
  </div>


<div class="form-check-inline">
  <label class="form-check-label">
    <input type="radio" class="form-check-input" name="admin" value="0" checked="checked">일반회원
  </label>
</div>
<div class="form-check-inline">
  <label class="form-check-label">
    <input type="radio" class="form-check-input" name="admin" value="1">관리자
  </label>
</div>
 <br/>
 <p></p>
 <button type="submit" class="btn btn-primary" id="send">Submit</button>

</form>
</div>
</body>
</html>