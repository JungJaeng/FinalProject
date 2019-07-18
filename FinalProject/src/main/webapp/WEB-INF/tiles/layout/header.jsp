<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style type="text/css">


.subbar{
	text-align: right;
}
a{
	color: black;
	text-decoration: none;
}
.menu{
	display: inline;
	width: 100%;
}
.pagename{
	font-size: 60px;
	padding-left: 30px;
	padding-right: 30px;
	padding-bottom: 30px; 
}
.menuname{
	font-size: 40px;
}
.menuname>a{
	padding-right: 30px;
}
.subbar.hide {
  transform: translateY(-100%);
}
.subbar{
	top:0;
	margin: 0; padding: 0;
	list-style: none;
	position: fixed;
	width: 100%;
	transition: transform .3s;
}
.menubar{
	position: fixed;
}
</style>

<div class="head">
	<div class="subbar">
	<!--       비로그인상태 -->
	      <c:if test="${empty login }">
			<a href="/connectionBinder">현재 접속자</a>&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="/login">로그인</a>&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="/join">회원가입</a>&nbsp;&nbsp;&nbsp;&nbsp;
	      </c:if>
	<!--       로그인상태 -->
	      <c:if test="${login }">
	         <a href="/logout">로그아웃</a>&nbsp;&nbsp;&nbsp;&nbsp;
	         <a href="/mypage">마이페이지</a>&nbsp;&nbsp;&nbsp;&nbsp;
	      </c:if>
	</div>

	<div class="menubar">
		<div class="pagename menu">
			<a>여행어쩌고</a>
		</div>
		<div class="menuname menu">
			<a>Home1</a>
			<a>Home2</a>
			<a>Home3</a>
			<a>Home4</a>			
		</div>
	</div>
	<br><br><br><br><br><br><br>
</div>


