<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.js"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<style>

@import url(https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css);
@import url(https://fonts.googleapis.com/css?family=Lato:300,400,700);

.login_content, .Check  {
	font-family: 'Lato', sans-serif;
	
}

.memberCheck {
	text-align: center;
	font-size: 11px;
}

.login_content {
   margin: 0 auto;
   max-width: 335px;
   min-width: 200px;
}

.row_group {
   overflow: hidden;
   width: 100%;
}

.login_title {
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
   padding: 15px 0 15px;
   font-size: 15px;
   font-weight: 700;
   text-align: center;
   cursor: pointer;
   box-sizing: border-box;
}
.loginMenu {
   width: 100%;
   font-size: 13px;

}

</style>
 
<script type="text/javascript">
var ch_id=false;



$(document).ready(function() {
   
   //로그인버튼 동작
   $("#btn_login").click(function() {
      //form submit 수행
      $("form").submit();
   });


	$('#user_pw').keydown(function(e) {
	    if( e.keyCode == 13 ) {
	    	login();
	    }
	});
});

function login(){
	$("#btn_login").click();
}



 
</script>   
   


<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<hr>
	<h1 style="text-align: center;">LOGIN</h1>   
	<hr>
	<div class="Check">
	<br><br>
	<br>
   
	<form action="/member/login" method="post" name="loginForm">
         <div class="login_content">
            <div class="row_group">
               <h3 class="login_title">
                  <label for="id">아이디</label>
               </h3>
               <span class="intext">
                  <input type="text" name="user_id" id="user_id" class="inputtext" maxlength="20" autofocus/>
               </span>
            </div>
            
            <div class="row_group">
               <h3 class="login_title">
                  <label for="pw">비밀번호</label>
               </h3>
               <span class="intext">
                  <input type="password" name="user_pw" id="user_pw" class="inputtext" maxlength="20"/>
               </span>
            </div>
            <br>
			<div class="memberCheck">
				<span style="color: black;">회원 구분을 반드시 체크해주세요</span>
				&nbsp;&nbsp;&nbsp;
				<input type="radio" name="user_join_no" value="1"  checked="checked"/>&nbsp;일반회원 
				&nbsp;&nbsp;
				<input type="radio" name="user_join_no" value="2" />&nbsp;사업자 
			</div>            
            <div class="btnarea">
            	<div>
	            	<button type="button" id="btn_login" class="btn_type">
	                	<span>Login</span>
	            	</button>
            	</div>
            </div>
            
            <div class="loginMenu">
               <table>
                  <tr>
                     <td> </td>
                     <td><a href="/member/idFind" style="text-decoration:none; color: black;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;아이디 찾기</a></td>
                     <td> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; │ </td>
                     <td><a href="/member/pwFind" style="text-decoration:none; color: black;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;비밀번호 찾기</a></td>
                     <td> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; │ </td>
                     <td><a href="/member/join"   style="text-decoration:none; color: black;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;회원가입</a></td>
                  </tr>
               </table>
            </div>
            
         </div>   
      </form>

   <br>
   
   <div class="sns_login">
   <!-- 네이버아이디로로그인 버튼 노출 영역 -->
   <div id="naver_id_login" style="text-align:center">
      <a href="${url}">
         <img width="223" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png"/>
      </a>
   </div>
   <script type="text/javascript"> 
      var naver_id_login = new naver_id_login("dUxGrlsV_QuicpElosr7", "http://192.168.30.53:8088/member/callback"); 
      var state = naver_id_login.getUniqState(); 
      naver_id_login.setDomain("http://192.168.30.53:8088/member/login"); 
      naver_id_login.setState(state); 
   //    naver_id_login.setPopup(); 
      naver_id_login.init_naver_id_login; 
   </script>
   
	<br>
	
   <div id="kakao_id_login" style="text-align:center">
      <a id="kakao-login-btn" 
      href="https://kauth.kakao.com/oauth/authorize?client_id=2c8bb256bd1dfd39210162d0e5b2b96e&redirect_uri=http://192.168.30.53:8088/member/kakaoLogin&response_type=code"></a>
   </div>
   
   
   <!-- Kakao Login -->
   <script type="text/javascript">
      // 사용할 앱의 JavaScript 키를 설정해 주세요.
      Kakao.init('9ec756b514f42f122b54464078ced9f2');
      // 카카오 로그인 버튼을 생성합니다.
      Kakao.Auth.createLoginButton({
         container: '#kakao-login-btn',
         success: function(authObj) {
//          alert(JSON.stringify(authObj));
//          로그인 성공시, API를 호출합니다.
         Kakao.API.request({
            url: '/v1/user/me',
            success: function(res) {
//                console.log(res);
//                console.log(JSON.stringify(res.kaccount_email));
//                console.log(JSON.stringify(res.id));
//                console.log(JSON.stringify(res.properties.profile_image));
//                console.log(JSON.stringify(res.properties.nickname));
                 
//                alert(res.properties.nickname+'님 환영합니다.');
               },
               fail: function(error) {
               alert(JSON.stringify(error));
               }
             });
           },
           fail: function(err) {
             alert(JSON.stringify(err));
           }
         });
      
//       Kakao.init('9ec756b514f42f122b54464078ced9f2');
//        function Kakao_login_call() {
//           Kakao.Auth.login({
//              success: function(authObj) {
//                 alert(JSON.stringify(authObj));
//                 var accessToken = Kakao.Auth.getAccessToken();
//                 var refreshToken = Kakao.Auth.getRefreshToken();
//                 if ( refreshToken ) {
//                    Kakao.API.request({
//                       url: '/v1/user/me',
//                       success: function(res) {
//                          var sData = JSON.stringgify(res);
//                          alert(sData);
//                          sData = JSON.parse(sData);
//                          var nickname = sData.properties.nickname;
//                       }
//                    });
//                 }
//              }
//           });
//        };
       
//    $(document).ready(function() {
//       console.log("ready")
//       Kakao.init('9ec756b514f42f122b54464078ced9f2');
//       Kakao.Auth.createLoginButton({
//          container: '#kakao-login-btn',
//          success: function(authObj) {
//             var access_token = Kakao.Auth.getAccessToken();
//             console.log("*******access_token**********");
//             console.log(access_token);
//             console.log("********access_token*********");
//    //          alert(JSON.stringify(authObj));
//    //          로그인 성공시, API를 호출합니다.
//             var refreshToken = Kakao.Auth.getRefreshToken();
//             console.log("*****************");
//             console.log(refreshToken);
//             Kakao.Auth.setAccessToken(refreshToken , true);
//             console.log("*****************");
//          }
//       });
//       var refreshToken = Kakao.Auth.getRefreshToken();
//       var getAppKey = Kakao.Auth.getAppKey();
//       var getAccessToken=  Kakao.Auth.getAccessToken();
//       console.log("=============refreshToKen==============");
//       console.log(refreshToken);
//       console.log("=============refreshToKen==============");
//       console.log("=============getAppKey==============");
//       console.log(getAppKey);
//       console.log("=============getAppKey==============");
//       console.log("=============getAccessToken==============");
//       console.log(getAccessToken);
//       console.log("=============getAccessToken==============");   
      
//        Kakao.Auth.setAccessToken(refreshToken , true);
//        var getAccessToken=  Kakao.Auth.getAccessToken();
//        console.log(getAccessToken);   
//    });   
   </script>
   </div>
   <br><br>
   </div>
   <hr>
</body>
</html>