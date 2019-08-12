<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>

<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.js"></script>

<style>
@import url(https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css);
@import url(https://fonts.googleapis.com/css?family=Lato:300,400,700);
	

.btnarea { overflow:hidden;clear:both;width:100% }
.btnarea #btn_idFind{float: left}
.btnarea #btn_Cancel{float: right}


.idFind_content {
	font-family: 'Lato', sans-serif;
	margin: 0 auto;
	max-width: 335px;
	min-width: 200px;
}

.row_group {
	overflow: hidden;
	width: 100%;
}

.idFind_title {
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
	margin: 0px 0 0px;
	text-align: center;
}

.msg {
	text-align: center;
}

.btn_type {
	display: block;
	width: 48%;
	padding: 15px 0 15px;
	font-size: 15px;
	font-weight: 700;
	text-align: center;
	cursor: pointer;
	box-sizing: border-box;
}

</style>


<script type="text/javascript">
$(document).ready(function() {
   
   //아이디찾기 버튼 동작
   $("#btn_idFind").click(function() {
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
	<hr>
	<h1 style="text-align: center;">아이디 찾기</h1>
	<hr>
   
	<form action="/member/idFind" method="post">
   
		<div class="idFind_content">
			<div class="row_group">
				<h3 class="idFind_title">
					<label for="nick">닉네임</label>
				</h3>
				<span class="intext">
					<input type="text" name="user_nick" id="user_nick" class="inputtext" maxlength="20" autofocus/>
				</span>
			</div>
				
			<div class="row_group">
				<h3 class="idFind_title">
					<label for="email">이메일</label>
				</h3>
				<span class="intext">
					<input type="text" name="user_email" id="user_email" class="inputtext" maxlength="100"/>
				</span>
			</div>
			
		   <br>
		   
			<div class="msg">
			   <p style="color:blue;">${idFind }</p>
			
			   
			   <c:if test="${idFind2 == 0 }">
			      <p style="color:red;">만족하는 ID가 없습니다</p>
			   </c:if>
			</div>
		
		   <br>
		   

		    
		   <div class="btnarea">
		   
		      <button type="button" id="btn_idFind" class="btn_type" >
		     	 <span>아이디 찾기</span>
		      </button>
		     
		      <button type="button" id="btn_Cancel" class="btn_type" >
		     	 <span>취소</span>
		      </button>
		      
		   </div>
   
   		</div>	
   </form>
   

</body>
</html>