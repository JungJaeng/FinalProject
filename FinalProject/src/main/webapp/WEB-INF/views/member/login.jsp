<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	
	//로그인버튼 동작
	$("#btn_login").click(function() {
		//form submit 수행
		$("form").submit();
	});
	
	//취소버튼 동작
	$("#btn_Cancel").click(function() {
		history.go(-1);
	});
	
	//아이디찾기 버튼 동작
	$("#btn_idFind").click(function() {
		location.href='/member/idFind';
	});
	
	//비밀번호찾기 버튼 동작
	$("#btn_pwFind").click(function() {
		location.href='/member/pwFind';
	});
	
});
</script>	
	


<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>로그인</h1>
	<hr>
	
	<div>
		<form action="/member/login" method="post">
			<label>ID : <input type="text" name="user_id"/></label>
			<label>PW : <input type="password" name="user_pw"/></label>
		</form>
	</div>
	<br>
	
	<div>
		<button type="button" id="btn_login">로그인</button>
		<button type="button" id="btn_Cancel">취소</button><br><br>
		<button type="button" id="btn_idFind">아이디 찾기</button>
		<button type="button" id="btn_pwFind">비밀번호 찾기</button>
	</div>
	
 
</body>
</html>