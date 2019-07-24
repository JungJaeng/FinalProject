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


 #left_box {
	display: block;
	text-align: center;
}

#reg_button {
	display: block;	
	text-align: right;
}




/* #right_box { */
/*       width: 50%; */
/*       float: right; */
/*       position: static; */
/*       box-sizing: inherit; */
/* } */


</style>

<h1>펜션 리스트</h1>
<hr>

<div id="reg_button">
<button type="button" onclick="location.href='/pension/register'" >펜션등록요청</button>


</div>

<div id="left_box">

<div class="serach">
<form action="/pension/list" method="get">
		<h3>펜션 검색</h3>
		
		<select name="name"  style="vertical-align: middle;">
				<option value="pension_name">펜션명</option>
				<option value="pension_location">펜션위치</option>
		</select>
		<input type="text"  name="search" >
	 	<button  style="vertical-align: middle;">검색</button>
</form>
</div>



</div>



<div id="right_box">

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
     <span>펜션위치</span>${i.pension_location}<br />
     <span>펜션소개</span>${i.pension_content}<br />
    </p>
    
   </div>     
  </li>
  </c:forEach>
 </ul>
</section>

</div>



