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

<style type="text/css">
img {
float:left;
}
#mypage {
margin-left:350px;
}
#info2{
margin-left: 250px;
}
</style>


<h1>마이페이지</h1>
<hr>


<form action="/login/mypage" method="post" enctype="multipart/form-data">
<div id="mypage">
<c:if test="${n==0 }">
	<img src="${paceContext.request.contextPath}/resources/image/img4.jpg"/>
</c:if>
<c:if test="${n==1 }">
	<img src="/upload/${fileup.stored_name }" style="height: 150px; width: 150px; ">
</c:if>	
<div id="info2">
<h4>아이디 : ${info.id }</h4>
<h4>이메일 : ${info.email }</h4>
<h4>전화번호 : ${info.phone }</h4><br>
</div>
</div>
</form>

<a href="/login/main"><button>메인 페이지</button></a>
<a href="/login/infochange"><button>내 정보 수정</button></a>
<a href="/login/withdraw"><button>회원 탈퇴</button></a>

</body>
</html>












