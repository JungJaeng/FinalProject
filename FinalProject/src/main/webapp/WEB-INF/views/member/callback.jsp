<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  

<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" 
		src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
		charset="utf-8">
</script>
  
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
  
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>

  <div
    style="background-color: #15a181; width: 100%; height: 50px; text-align: center; color: white;">
    <h3>Naver_Login Success</h3>
  </div>
  <br>
  <h2 style="text-align: center" id="name"></h2>
  <h4 style="text-align: center" id="email"></h4>
  
<script type="text/javascript">
  var naver_id_login = new naver_id_login("dUxGrlsV_QuicpElosr7", "http://localhost:8088/member/callback");
  // 접근 토큰 값 출력
  alert(naver_id_login.oauthParams.access_token);
  // 네이버 사용자 프로필 조회
  naver_id_login.get_naver_userprofile("naverSignInCallback()");
  // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
  function naverSignInCallback() {
    alert(naver_id_login.getProfileData('email'));
    alert(naver_id_login.getProfileData('nickname'));
    alert(naver_id_login.getProfileData('age'));
  }
</script>
  
  


</body>
</html>