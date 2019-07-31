<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<style>
#info {
margin-left:300px;
}

</style>

<form action="/mypage/infochange" method="post" enctype="multipart/form-data">

<h1>내 정보 변경</h1>
     <hr style="border-top:1px solid #777">
<input type="file" name="file" /><br><br>
<div id="fileload">
<c:if test="${n==0 }">
	<img src="${paceContext.request.contextPath}/resources/image/pen4.jpg"/>
</c:if>
<c:if test="${n==1 }">
	<img src="/upload/${fileup.stored_name }" style="height: 300px; width: 300px;">
</c:if>	
</div>     


<div id="info">
아이디 : <input type="text" id="id"  name="id" value="${member.id }"/>
<br>
이메일 : <input type="text" id="email"  name="email" value="${member.email }"/>
<br>
닉네임 : <input type="text" id="phone"  name="phone" value="${member.nick }"/>
<br>
비밀번호 : <input type="text" id="pw"  name="pw"/>
<br>
	<button>수정</button>
</div>
</form>


</body>
</html>