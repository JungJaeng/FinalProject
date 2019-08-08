<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script type="text/javascript">
var last_top = 0;
$(window).scroll(function() {
  var this_top = $(this).scrollTop();
  if( this_top) {
    $(".subbar").addClass("hide");
  }
  else {
    $(".subbar").removeClass("hide");
  }
   last_top = this_top;  
}); 
 

</script>

<style type="text/css">

.outside{
   height: 100px;
   width: 100%;
}
.menucls {
        position: fixed;
        top: 0px;
      }
.atag{
   color: black !important;
   text-decoration: none !important; 
}
.menu{
   display: inline;
   width: 1200px;
}
.pagename{
   font-size: 50px;
   padding-left: 30px;
   padding-right: 80px;
   padding-bottom: 30px; 
}
.menuname{
   font-size: 30px;
}
.menuname>a{
   padding-right: 60px;
}
.subbar.hide {
  transform: translateY(-100%);
}
.subbar{
   top:0;
   margin: 0; padding: 0;
   list-style: none;
   position: fixed;
   width: 1200px;
   transition: transform .3s;
   text-align: right;
}
.menubar{
   padding-top: 50px;
}
</style>
<div class="outside">
   <div class="subbar">
   <!--       비로그인상태 -->
         <c:if test="${empty login and empty naverLogin and empty KakaoLogin}"> 
         <a class="atag" href="/member/login">로그인</a>&nbsp;&nbsp;&nbsp;&nbsp;
         <a class="atag" href="/member/join">회원가입</a>&nbsp;&nbsp;&nbsp;&nbsp;
         </c:if>
   <!--       로그인상태 -->
         <c:if test="${not empty login and login_nick ne '관리자' }">
         <a class="atag" href="/chatting/chatting">채팅</a>&nbsp;&nbsp;&nbsp;&nbsp;
            <a class="atag" href="/member/logout">로그아웃</a>&nbsp;&nbsp;&nbsp;&nbsp;
            <a class="atag" href="/mypage/mypage">마이페이지</a>&nbsp;&nbsp;&nbsp;&nbsp;
         </c:if> 
         
   <!--       네이버 로그인상태 -->
      <c:if test="${naverLogin }">
         <a class="atag" href="/chatting/chatting">채팅</a>&nbsp;&nbsp;&nbsp;&nbsp;
         <a class="atag" href="/member/logout">로그아웃</a>&nbsp;&nbsp;&nbsp;&nbsp;
         <a class="atag" href="/mypage/mypage">마이페이지</a>&nbsp;&nbsp;&nbsp;&nbsp;
      </c:if>
      
   <!--       카카오 로그인상태 --> 
      <c:if test="${KakaoLogin }">
         <a class="atag" href="/chatting/chatting">채팅</a>&nbsp;&nbsp;&nbsp;&nbsp;
         <a class="atag" href="/member/logout">로그아웃</a>&nbsp;&nbsp;&nbsp;&nbsp;
         <a class="atag" href="/mypage/mypage">마이페이지</a>&nbsp;&nbsp;&nbsp;&nbsp; 
      </c:if>
         
   <!--       관리자상태 -->
        <c:if test="${login_nick eq '관리자' }">
         <a href="/admin/member_list">회원관리</a>&nbsp;&nbsp;&nbsp;&nbsp;
            <a href="/admin/apply_post">펜션등록</a>&nbsp;&nbsp;&nbsp;&nbsp;
            <a href="/admin/apply_list">펜션요청확인</a>&nbsp;&nbsp;&nbsp;&nbsp;
            <a href="/member/logout">로그아웃</a>&nbsp;&nbsp;&nbsp;&nbsp;
         </c:if>
   </div>

   <div class="menubar">
      <div class="pagename menu">
         <a class="atag" href="/main">여행어쩌고</a>
      </div>
      <div class="menuname menu">
         <a class="atag" href="/main">Home</a>
         <a class="atag" href="/pension/list">펜션 간편예약</a>
         <a class="atag" href="/tripspot/list">여행지 추천</a>
         <a class="atag" href="/board/list">커뮤니티</a>         
      </div>
   
   </div>
</div>

