<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#info {
margin-left:300px;
}

img1{
float:right;
}

img2{
float:right;
}

</style>
</head>
<body>


<form action="/mypage/infochange" method="post" enctype="multipart/form-data">

<h1>내 정보 변경</h1>
     <hr style="border-top:1px solid #777">
<input type="file" name="file" /><br><br>
<div id="fileload">
<c:if test="${n==0 }">
	<img src="${paceContext.request.contextPath}/resources/img/pen4.jpg" id="img1"/>
</c:if>
<c:if test="${n==1 }">
	<img src="/upload/${fileup.stored_name }" id="img2" />
</c:if>	
</div>     


<div id="info">
아이디 : <input type="text" id="id"  name="user_id" value="${login.user_id }"/>
<br>
이메일 : <input type="text" id="email"  name="user_email" value="${login.user_email }"/>
<br>
닉네임 : <input type="text" id="nick"  name="user_nick" value="${login.user_nick }"/>
<br>
비밀번호 : <input type="text" id="pw"  name="user_pw"/>
<br>
	<button>수정</button>
</div>
</form>


</body>
</html>