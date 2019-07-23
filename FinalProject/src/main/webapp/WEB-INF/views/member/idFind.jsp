<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>

<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.js"></script>




<script type="text/javascript">
$(document).ready(function() {

	
	
	//아이디찾기 버튼 동작
	$("#btn_idFind").click(function() {
				
		$("form").submit();	

	});
	
	
	
	
	
	//취소버튼 동작
	$("#btn_Cancel").click(function() {
		history.go(-1);
	});
});
</script>	


<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>아이디 찾기</h1>
	<hr>
	
	<form action="/member/idFind" method="post">
		<label>닉네임 : <input type="text" name="user_nick"/></label>
		<label>이메일 : <input type="text" name="user_email"/></label>
	</form>
	<br><br> 
	
<!-- 	<div id="idFindMsg"> -->
<%-- 		<p>회원님의 아이디는 <p id="idFind">${idFind }<p>입니다<p><br> --%>
<!-- 	</div>  -->
	 
<!-- 	<div id="idFindError"> -->
<!-- 		<span>정보와 일치한 ID가 없습니다.</span> -->
<!-- 	</div> -->
	
	<div>
		${idFind }
	</div>
	
	<br><br>
	
	<div>
		<button type="button" id="btn_idFind">아이디 찾기</button>
		<button type="button" id="btn_Cancel">취소</button>
	</div>
	

</body>
</html>