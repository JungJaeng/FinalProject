<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>메인 페이지</h1>
<hr>
 
<!-- 로그인상태 -->
<c:if test="${login }">
	<a href="/login/mypage"><button>마이페이지</button></a>
	<a href="/login/logout"><button>로그아웃</button></a>
	<a href="/board/list"><button>게시판 가기</button></a>
</c:if>

<!-- 비로그인상태 -->
<c:if test="${empty login }">
	<a href="/login/login"><button>로그인</button></a>
	<a href="/login/join"><button>회원가입</button></a>
</c:if>

</body>
</html>