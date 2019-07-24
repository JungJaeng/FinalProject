<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html>
<head>

<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.js"></script>

<style>

.pwFind_content {
	margin: 0 auto;
	max-width: 335px;
	min-width: 200px;
}

.row_group {
	overflow: hidden;
	width: 100%;
}

.pwFind_title {
	margin: 19px 0 8px;
	font-size: 14px;
	font-weight: 700;
}

.inputtext {
	border: none;
	display: block;
	position: relative;
	width: 100%;
	height: 29px;
}

.intext, .genderdiv {
	display: block;
	position: relative;
	width: 100%;
	height: 51px;
	border: solid 1px #dadada;
	padding: 10px 14px 10px 14px;
	background: #fff;
	box-sizing: border-box;
	vertical-align: top;
}


.btnarea { 
	margin: 0px 0 0px;
	text-align: center;
}

.msg {
	text-align: center;
}
 
.btn_type {
	display: block;
	width: 100%;
	padding: 15px 0 15px;
	font-size: 15px;
	font-weight: 700;
	text-align: center;
	cursor: pointer;
	box-sizing: border-box;
}

.msg {
	text-align: center;
}


</style>


<script type="text/javascript">
$(document).ready(function() {
   
   //아이디찾기 버튼 동작
   $("#btn_pwFind").click(function() {
      $("form").submit();   
   });
   
   //취소버튼 동작
   $("#btn_Cancel").click(function() {
	   location.href="/member/login";
   });
});
</script>   

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

   <h1>비밀번호 찾기 페이지</h1>
   <hr>
   

	<form action="/member/pwFind" method="post" >
   
		<div class="pwFind_content">
		
			<div class="row_group">
				<h3 class="pwFind_title">
					<label for="id">아이디</label>
				</h3>
				<span class="intext">
					<input type="text" name="user_id" id="user_id" class="inputtext" maxlength="20" autofocus/>
				</span>
			</div>
				
			<div class="row_group">
				<h3 class="pwFind_title">
					<label for="email">이메일</label>
				</h3>
				<span class="intext">
					<input type="text" name="user_email" id="user_email" class="inputtext" maxlength="100"/>
				</span>
			</div>
	
		   <br>
		   	<div class="msg">
			   <p style="color:blue;">비밀번호 찾기 서비스를 이용하시면 <br>
			   임시비밀번호로 변경해서 가입하신 메일로 보내드립니다.</p>
			</div>
		   <br> 
		   
			<div class="btnarea">
				<button type="button" id="btn_pwFind" class="btn_type">
					<span>비밀번호 찾기</span>
				</button>
		     
				<button type="button" id="btn_Cancel" class="btn_type">
					<span>취소</span>
				</button>
		      
			</div>
		</div>	
   </form>

</body>
</html>