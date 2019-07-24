<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.js"></script>

<style>

.login_content {
	margin: 0 auto;
	max-width: 335px;
	min-width: 200px;
}

.row_group {
	overflow: hidden;
	width: 100%;
}

.login_title {
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

.gen {
	width: 100%;
	height: 29px;
	font-size: 15px;
	line-height: 18px;
	color: #000;
	border: none;
	border-radius: 0;
	height: auto;
	margin-top: 3px;
}

.btnarea {
	margin: 30px 0 9px;
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

.menu {
	width: 100%;
	font-size: 13px;
}

</style>

<script type="text/javascript">
$(document).ready(function() {
	
	//로그인버튼 동작
	$("#btn_login").click(function() {
		//form submit 수행
		$("form").submit();
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
			<div class="login_content">
				<div class="row_group">
					<h3 class="login_title">
						<label for="id">아이디</label>
					</h3>
					<span class="intext">
						<input type="text" name="user_id" id="user_id" class="inputtext" maxlength="20" autofocus/>
					</span>
				</div>
				
				<div class="row_group">
					<h3 class="login_title">
						<label for="pw">비밀번호</label>
					</h3>
					<span class="intext">
						<input type="password" name="user_pw" id="user_pw" class="inputtext" maxlength="20"/>
					</span>
				</div>
				
				<div class="btnarea">
					<button type="button" id="btn_login" class="btn_type">
						<span>로그인</span>
					</button>
				</div>
				
				<div class="menu">
					<table>
						<tr>
							<td> </td>
							<td><a href="/member/idFind">&nbsp;아이디 찾기</a></td>
							<td> &nbsp;&nbsp; │ </td>
							<td><a href="/member/pwFind">&nbsp;&nbsp;비밀번호 찾기</a></td>
							<td> &nbsp; │ </td>
							<td><a href="/member/join">&nbsp;&nbsp;회원가입</a></td>
						</tr>
					</table>
				</div>
				
			</div>	
		</form>
	</div>
	<br>

	
 
</body>
</html>