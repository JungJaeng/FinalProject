<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-2.2.4.js"></script>
	
<style>
.error {
	font-size: 10px;
	color: red;
}

.join_content {
	margin: 0 auto;
	max-width: 335px;
	min-width: 200px;
}

.row_group {
	overflow: hidden;
	width: 100%;
}

.join_title {
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
	padding: 21px 0 17px;
	font-size: 20px;
	font-weight: 700;
	text-align: center;
	cursor: pointer;
	box-sizing: border-box;
}
</style>

<script type="text/javascript">
var ch_id=false;
var ch_pw=false;
var ch_pw2=false;
var ch_nick=false;
var ch_email=false;
	//id체크
	function idcheck() {
		var memId = $('#user_id').val();
		$.ajax({
			type : 'POST',
			url : '/member/idcheck',
			data : {
				"user_id" : $('#user_id').val()
			},
			dataType : 'json',
			success : function(res) {
				if( res ) {
					$('#idMsg').html("사용가능한 아이디입니다").css("color", "blue");
					ch_id=true;
				} else {
					console.log( res )
					$('#idMsg').html("중복되거나 이미 있는 아이디입니다").css("color", "red");	
					ch_id=false;
				}
		
			}

		})
	}

	$(function() {
		$('.error').hide();

 		$('#user_id').focus(function() {
 			$('#idMsg').html("")
 		});
 		
 		$('#user_id').blur(
				function() {
					var idok = /[a-z0-9]{5,20}$/;
				$('#idMsg').show();
					if ($('#user_id').val() === ''
							|| $('#user_id').val() === null) {
						 $('#idMsg').html("필수 정보입니다").css("color", "red");	 
						 ch_id=false;
					}else if(!idok.test($('#user_id').val())){
						$('#idMsg').html("5~20자의 영문 소문자, 숫자만 사용 가능합니다.").css("color","red");
						ch_id==false;
					}
					else {
						idcheck();
					}
				}) 

		$('#user_pw').blur(
				function() {
					var pwok1  = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{5,20}$/;
						$('#pwMsg1').show();
					if ($('#user_pw').val() === ''
							|| $('#user_pw').val() === null) {
						$('#pwMsg1').html("필수 정보입니다").css("color", "red");
						ch_pw=false;
					}else if(!pwok1.test($('#user_pw').val())){
						$('#pwMsg1').html("5~20자의 영문,숫자,특문 조합으로 사용 가능합니다.").css("color","red");
						ch_pw=false;
					} 
					else {
						$('#pwMsg1').hide();
						ch_pw=true;
					}
				})

		$('#user_pw2').blur(function() {
			$('#pwMsg2').show();
		})

		$('#user_nick').blur(
				function() {
					if ($('#user_nick').val() === ''
							|| $('#user_nick').val() === null) {
						$('#nickMsg').show();
						ch_nick=false;
					} else {
						$('#nickMsg').hide();
						ch_nick=true;
					}
				})
				
		$('#user_email').blur(
				function() {
					if ($('#user_email').val() === ''
							|| $('#user_email').val() === null) {
						$('#emailMsg').show();
						ch_email=false;
					} else {
						$('#emailMsg').hide();
						ch_email=true;
					}
				})
 
	});

$(function() {

	//비밀번호 확인
	$('#user_pw2').blur(
					function() {
						var pwok2  = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{5,20}$/;
						if ($('#user_pw').val() != $('#user_pw2')
								.val()) {
							$('#pwMsg2').html("위 비밀번호와 일치하지 않습니다").css(
									"color", "red");
							$('#user_pw2').val('');
							ch_pw2=false;
						} else if ($('#user_pw2').val() === ''
								|| $('#user_pw2').val() === null) {
							$('#pwMsg2').html("필수 정보입니다").css("color",
									"red");
							ch_pw2=false;
						}else if(!pwok2.test($('#user_pw').val())){
							$('#pwMsg2').html("5~20자의 영문,숫자,특문 조합으로 사용 가능합니다.").css("color","red");
							$('#user_pw2').val('');
							ch_pw2=false;
						}  
						else {
							$('#pwMsg2').html("두 비밀번호가 일치합니다").css("color","blue");
							ch_pw2=true;
						}
					})
});

$(document).ready(function() {
	//가입 버튼 클릭 시 form submit
	$("#btn_join").click(function() {
		if(ch_id==true && ch_pw==true && ch_pw2==true 
			&& ch_nick==true && ch_email==true){
			$(this).parents("form").submit();
		}if(ch_id==false){ $('#idMsg').show(); 
		}if(ch_pw==false){ $('#pwMsg1').show(); 
		}if(ch_pw2==false){ $('#pwMsg2').show(); 
		}if(ch_nick==false){ $('#nickMsg').show(); 
		}if(ch_email==false){ $('#emailMsg').show(); 
		}
	})
});	
</script>


<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>회원가입</h1>
	<hr>


	<form action="/member/join" method="post">
		<div class="join_content">
	
			<div class="row_group">
				<h3 class="join_title">
					<label for="id">아이디</label>
				</h3>
				<span class="intext"> <input type="text" id="user_id"
					name="user_id" class="inputtext" maxlength="20" />
				</span> <span class="error" id="idMsg">필수 정보입니다</span>
			</div>
			
			<div class="row_group">
				<h3 class="join_title">
					<label for="pw1">비밀번호</label>
				</h3>
				<span class="intext"> <input type="password" id="user_pw"
					name="user_pw" class="inputtext" maxlength="20" />
				</span> <span class="error" id="pwMsg1">필수 정보입니다</span>
				
				<h3 class="join_title">
					<label for="pw2">비밀번호 확인</label>
				</h3>
				<span class="intext"> <input type="password" id="user_pw2"
					name="member_pw2" class="inputtext" maxlength="20" />
				</span> <span class="error" id="pwMsg2">필수 정보입니다</span>
			</div>
			
			<div class="row_group">
				
				<h3 class="join_title">
					<label for="nick">닉네임</label>
				</h3>
				<span class="intext"> <input type="text" id="user_nick"
					name="user_nick" class="inputtext" maxlength="40" />
				</span> <span class="error" id="nickMsg"> 필수 정보입니다 </span>
				
				<h3 class="join_title">
					<label for="email">이메일</label>
				</h3>
				<span class="intext"> <input type="email" id="user_email"
					name="user_email" class="inputtext" maxlength="100" />
				</span> <span class="error" id="emailMsg"> 필수 정보입니다 </span>	
				
				<div class="btnarea">
					<button type="button" id="btn_join" class="btn_type">
						<span>가입하기</span>
					</button>
				</div>					
			</div>
		</div>
	</form>
</body>
</html>