<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.js"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>

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
							<td><a href="/member/idFind" style="text-decoration:none; color: black;">&nbsp;아이디 찾기</a></td>
							<td> &nbsp;&nbsp; │ </td>
							<td><a href="/member/pwFind" style="text-decoration:none; color: black;">&nbsp;&nbsp;비밀번호 찾기</a></td>
							<td> &nbsp; │ </td>
							<td><a href="/member/join" style="text-decoration:none; color: black;">&nbsp;&nbsp;회원가입</a></td>
						</tr>
					</table>
				</div>
				
			</div>	
		</form>
	</div>
	<br>
	<!-- 네이버아이디로로그인 버튼 노출 영역 -->
<div id="naver_id_login" style="text-align:center"><a href="${url}">
<img width="223" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png"/></a></div>
<script type="text/javascript"> 
	var naver_id_login = new naver_id_login("dUxGrlsV_QuicpElosr7", "http://localhost:8088/member/callback"); 
	var state = naver_id_login.getUniqState(); 
	naver_id_login.setDomain("http://localhost:8088/member/login"); 
	naver_id_login.setState(state); 
// 	naver_id_login.setPopup(); 
	naver_id_login.init_naver_id_login; 
</script>

</body>
</html>