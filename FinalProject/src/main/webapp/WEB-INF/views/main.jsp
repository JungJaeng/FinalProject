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
	<h1>메인</h1>
	<hr>
	
	<div>
		<!-- 비로그인상태 -->
		<c:if test="${not login }">
			<strong>로그인이 필요합니다</strong><br>
			<a href="/member/login"><button>로그인</button></a>
			<a href="/member/join"><button>회원가입</button></a>
			<a href="/member/idFind"><button>아이디찾기</button></a>
			<a href=""><button>비밀번호찾기</button></a>
		</c:if>
		
		<!-- 로그인상태 -->
		<c:if test="${login }">
			<strong>${login_nick }님, 환영합니다</strong><br>
			<a href="/board/list"><button>게시판</button></a>
			<a href="/member/mypage"><button>마이페이지</button></a>
			<a href="/member/logout"><button>로그아웃</button></a>
		</c:if>
	</div>
	
</body>
</html>