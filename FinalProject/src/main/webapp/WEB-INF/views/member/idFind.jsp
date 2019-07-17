<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>

<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.js"></script>


<script type="text/javascript"> 

var ch_nick=false;
var ch_email=false;

	function idFind() {
		var idFindUser_nick = $('#user_nick').val();
		var idFindUser_email = $('#user_email').val();
		
		$.ajax({
			type : 'POST',
			url : '/member/idFind',
			data : {
				"user_nick" : $('#user_nick').val(),
				"user_email" : $('#user_email').val()
			},
			dataType : 'json',
			success : function(res) {
				if( res ) {
					$('#idFindMsg').css("color", "blue");
					ch_nick=true;
					ch_email=true;
				} else {
					console.log( res )
					$('#idFindError').css("color", "red");	
					ch_nick=false;
					ch_email=false;
				}
		
			}
	
		});
	}


	$(function () {
		$('#idFindError').hide();
		$('#idFindMsg').hide();

 		$('#btn_idFind').click(
 				function() { 
					if( 
							$('#user_nick') != null || $('#user_nick') != '' || 
							$('#user_email') != null || $('#user_email') != '' 
						) {
						
						$('#idFindMsg').show();
						$('idFindMsg').css("color","blue") 
					}
				}) 
	});
	

</script>


<script type="text/javascript">
// $(document).ready(function() {
	
// 	//아이디찾기 버튼 동작
// 	$("#btn_idFind").click(function() {
// 		$("form").submit();	
// 	});
	
// 	//취소버튼 동작
// 	$("#btn_Cancel").click(function() {
// 		history.go(-1);
// 	});
// });
</script>	


<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>아이디 찾기</h1>
	<hr>
	
	<form action="/member/idFind">
		<label>닉네임 : <input type="text" name="user_nick"/></label>
		<label>이메일 : <input type="text" name="user_email"/></label>
	</form>
	<br><br> 
	
	<div id="idFindMsg">
		<span>회원님의 아이디는 ${idFind }입니다</span><br>
	</div> 
	 
	<div id="idFindError">
		<span>정보와 일치한 ID가 없습니다.</span>
	</div>
	


	<br><br>
	
	<div>
		<button type="button" id="btn_idFind" onclick="idFind()">아이디 찾기</button>
		<button type="button" id="btn_Cancel">취소</button>
	</div>
	

</body>
</html>