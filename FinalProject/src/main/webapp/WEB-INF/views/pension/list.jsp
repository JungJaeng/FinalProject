<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<style type="text/css">



 section#content ul li { margin:10px 0; list-style: none;}
 section#content ul li img { width:250px; height:250px; }
 section#content ul li::after { content:""; display:block; clear:both; }
 section#content div.thumb { float:left; width:250px; }
 section#content div.pensionInfo { float:right; width:calc(100% - 270px); }
 section#content div.pensionInfo { font-size:20px; line-height:2; }
 section#content div.pensionInfo span { display:inline-block; width:100px; font-weight:bold; margin-right:10px; }

 A:link {text-decoration:none; color: #646464;}
 A:visit {text-decoration:none; color: #646464;}
 A:hover {text-decoration:none; color: #646464;}


 #search_box {	
	display:block;
	text-align:center; 

}

#reg_Btn {
	-webkit-border-radius:10px;
	-moz-border-radius:5px;
	border-radius:5px;
	border:1px solid #ccc;
	display:inline-block;
	font-size:1px;
	padding:7px 7px;
	font-family:Arial;
	color:#585858;
	cursor:pointer;
	font-weight:bold;
	text-decoration:none;
	text-shadow:0px 0px 0px #ccc;
	line-height: 10px !important;
	width: 100px;
	size: 10cm;
}
.reg {
	text-align: right;
}

.searchBtn {
	-webkit-border-radius:10px;
	-moz-border-radius:5px;
	border-radius:5px;
	border:1px solid #ccc;
	display:inline-block;
	font-size:1px;
	padding:7px 7px;
	font-family:Arial;
	color:#585858;
	cursor:pointer;
	font-weight:bold;
	text-decoration:none;
	text-shadow:0px 0px 0px #ccc;
	line-height: 10px !important;
	width: 100px;
	size: 10cm;
	}
.serach { 
 	display:block;
	text-align:center; 
	background:#efe8e8;
	padding:0 0 0 35px;
	font-size:18px;
	color:#5e5e5e;
	font-weight:bold;
	line-height: 50px;
	cursor:pointer;
	box-sizing: content-box;
	margin: 10px 0; !important
	
}



</style>

<h2>펜션 리스트</h2>
<hr>

<c:if test="${login_user_join_no eq '2' }">
<div class="reg">
<button type="button" id="reg_Btn" onclick="location.href='/pension/register_apply'" >펜션등록요청</button>
</div>
</c:if>

<div id="search_box">

<div class="serach">
<form action="/pension/list" method="get">
		
		<select name="name"  style="vertical-align: middle;">
				<option value="pension_name">펜션명</option>
				<option value="pension_address">펜션위치</option>
		</select>
		<input type="text"  name="search" >
	 	<button class="searchBtn">검색</button>
</form>
</div>
<hr>



</div>



<div id="right_box">

<div class="paging">
<section id="content">
 <ul>
  <c:forEach items="${pensionlist}" var="i">
  <li>  
   <div class="thumb">
    <a href="/pension/room_view?pension_no=${i.pension_no }"><img src="/resources/img/pen1.jpg" /></a>
   </div>   
   <div class="pensionInfo">
    <p>
     <span>펜션번호</span>${i.pension_no}<br />
     <a href="/pension/room_view?pension_no=${i.pension_no }"><span>펜션명</span>${i.pension_name}<br /></a>
     <span>펜션위치</span>${i.pension_postcode}<br />
     ${i.pension_address}
     ${i.pension_detailAddress } <br>
     <span>펜션소개</span>${i.pension_content}<br />
    </p>
    
   </div>     
  </li>
  </c:forEach>
 </ul>
</section>
</div>
</div>
<div class="clearfix"></div>

<jsp:include page="/WEB-INF/views/pension/paging.jsp" />
