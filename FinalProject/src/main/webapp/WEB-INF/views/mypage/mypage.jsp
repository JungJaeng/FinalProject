<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
#menu {
margin-left: 300px;
}
</style>
</head>
<body>


<h1>마이페이지</h1>
<hr>


<form action="/mypage/mypage" method="post" enctype="multipart/form-data">
<div id="mypage">
<c:if test="${n==0 }">
	<img src="${paceContext.request.contextPath}/resources/img/img4.jpg"/>
</c:if>
<c:if test="${n==1 }">
	<img src="/upload/${fileup.stored_name }" style="height: 150px; width: 150px; ">
</c:if>	
<div id="info2">
<h4>아이디 : ${info.user_id }</h4>
<h4>이메일 : ${info.user_email }</h4>
<h4>닉네임 : ${info.user_nick }</h4><br>
</div>
</div>
</form>
<br><br>
<div id="menu">
<a href="/main"><button>메인 페이지</button></a>
<a href="/mypage/infochange"><button>내 정보 수정</button></a>
<a href="/mypage/withdraw"><button>회원 탈퇴</button></a>
<a href="/mypage/community"><button>내가 쓴 글 바로가기</button></a>
<a href="/mypage/likepage"><button>추천한 목록 바로가기</button></a>
</div>

</body>
</html>











