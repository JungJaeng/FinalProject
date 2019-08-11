<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<style type="text/css">	

table thead {
	padding: 10px;
    border-top: 2px solid #282c37;
}			
table tbody {
	padding: 10px;
    border-bottom: 2px solid #282c37;
}					
.button-center {
	text-align: center;
}
.tablediv {
	padding: 0 5% 0 5%;
}
.contentdiv{
	padding: 0 10% 0 10%;
}
table{
	width: 100%;
	border-collapse: collapse;
    text-align: center;
    line-height: 1.5;
}
.viewinfo {
	background:#ccc;
}
h1{
	color:#000;
	font:bold 12px tahoma;
	font-size: 32px;
}
hr{
	color: "black";
	border-style: inset;
	border-width: 1px;
}
.wrap{
	padding:0 5% 0 5%;
	border-collapse: collapse;
}
img {
	max-width: 100%;
}
.btn {
	-moz-box-shadow:inset 0px 0px 0px 0px #ffffff;
	-webkit-box-shadow:inset 0px 0px 0px 0px #ffffff;
	box-shadow:inset 0px 0px 0px 0px #ffffff;
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #ffffff), color-stop(1, #f6f6f6));
	background:-moz-linear-gradient(top, #ffffff 5%, #f6f6f6 100%);
	background:-webkit-linear-gradient(top, #ffffff 5%, #f6f6f6 100%);
	background:-o-linear-gradient(top, #ffffff 5%, #f6f6f6 100%);
	background:-ms-linear-gradient(top, #ffffff 5%, #f6f6f6 100%);
	background:linear-gradient(to bottom, #ffffff 5%, #f6f6f6 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffffff', endColorstr='#f6f6f6',GradientType=0);
	background-color:#ffffff;
	-moz-border-radius:10px;
	-webkit-border-radius:10px;
	border-radius:10px;
	border:1px solid #dcdcdc;
	display:inline-block;
	cursor:pointer;
	color:#666666;
	font-family:Arial;
	font-size:15px;
	font-weight:bold;
	padding:8px 8px;
	text-decoration:none;
	text-shadow:0px 0px 0px #bfbdbf;
	line-height: 10px !important;
}
.btn:hover {
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #f6f6f6), color-stop(1, #ffffff));
	background:-moz-linear-gradient(top, #f6f6f6 5%, #ffffff 100%);
	background:-webkit-linear-gradient(top, #f6f6f6 5%, #ffffff 100%);
	background:-o-linear-gradient(top, #f6f6f6 5%, #ffffff 100%);
	background:-ms-linear-gradient(top, #f6f6f6 5%, #ffffff 100%);
	background:linear-gradient(to bottom, #f6f6f6 5%, #ffffff 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#f6f6f6', endColorstr='#ffffff',GradientType=0);
	background-color:#f6f6f6;
}
.btn:active {
	position:relative;
	top:1px;
}
.view{
	border-top:1px solid black;
	background-color: #d9e1e8;
	width : 100%;
	height: 20px;
}

.btnDiv,.recommendDiv{
	text-align: center;
}
.recommendadd {
	-moz-box-shadow:inset 0px -3px 7px 0px #29bbff;
	-webkit-box-shadow:inset 0px -3px 7px 0px #29bbff;
	box-shadow:inset 0px -3px 7px 0px #29bbff;
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #2dabf9), color-stop(1, #0688fa));
	background:-moz-linear-gradient(top, #2dabf9 5%, #0688fa 100%);
	background:-webkit-linear-gradient(top, #2dabf9 5%, #0688fa 100%);
	background:-o-linear-gradient(top, #2dabf9 5%, #0688fa 100%);
	background:-ms-linear-gradient(top, #2dabf9 5%, #0688fa 100%);
	background:linear-gradient(to bottom, #2dabf9 5%, #0688fa 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#2dabf9', endColorstr='#0688fa',GradientType=0);
	background-color:#2dabf9;
	-moz-border-radius:3px;
	-webkit-border-radius:3px;
	border-radius:3px;
	border:1px solid #0b0e07;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:Arial;
	font-size:15px;
	padding:15px 10px;
	text-decoration:none;
	text-shadow:0px 1px 0px #263666;
}
.recommendadd:hover {
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #0688fa), color-stop(1, #2dabf9));
	background:-moz-linear-gradient(top, #0688fa 5%, #2dabf9 100%);
	background:-webkit-linear-gradient(top, #0688fa 5%, #2dabf9 100%);
	background:-o-linear-gradient(top, #0688fa 5%, #2dabf9 100%);
	background:-ms-linear-gradient(top, #0688fa 5%, #2dabf9 100%);
	background:linear-gradient(to bottom, #0688fa 5%, #2dabf9 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#0688fa', endColorstr='#2dabf9',GradientType=0);
	background-color:#0688fa;
}
.recommendadd:active {
	position:relative;
	top:1px;
}
.recommenddelete {
	-moz-box-shadow:inset 0px -3px 7px 0px #e67a73;
	-webkit-box-shadow:inset 0px -3px 7px 0px #e67a73;
	box-shadow:inset 0px -3px 7px 0px #e67a73;
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #e4685d), color-stop(1, #eb675e));
	background:-moz-linear-gradient(top, #e4685d 5%, #eb675e 100%);
	background:-webkit-linear-gradient(top, #e4685d 5%, #eb675e 100%);
	background:-o-linear-gradient(top, #e4685d 5%, #eb675e 100%);
	background:-ms-linear-gradient(top, #e4685d 5%, #eb675e 100%);
	background:linear-gradient(to bottom, #e4685d 5%, #eb675e 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#e4685d', endColorstr='#eb675e',GradientType=0);
	background-color:#e4685d;
	-moz-border-radius:3px;
	-webkit-border-radius:3px;
	border-radius:3px;
	border:1px solid #ffffff;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:Arial;
	font-size:15px;
	padding:15px 10px;
	text-decoration:none;
	text-shadow:0px 1px 0px #b23e35;
}
.recommenddelete:hover {
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #eb675e), color-stop(1, #e4685d));
	background:-moz-linear-gradient(top, #eb675e 5%, #e4685d 100%);
	background:-webkit-linear-gradient(top, #eb675e 5%, #e4685d 100%);
	background:-o-linear-gradient(top, #eb675e 5%, #e4685d 100%);
	background:-ms-linear-gradient(top, #eb675e 5%, #e4685d 100%);
	background:linear-gradient(to bottom, #eb675e 5%, #e4685d 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#eb675e', endColorstr='#e4685d',GradientType=0);
	background-color:#eb675e;
}
.recommenddelete:active {
	position:relative;
	top:1px;
}

</style>
<script type="text/javascript">
$(document).ready(function(){
	$(".recommendDiv").on("click", "#recommendBtn", function(){
		var board_no = "${tripspot.board_no }";
		var recommender = "${login_id}";
		$.ajax({
			url : "/tripspot/recommend",
			type : "POST",
			data : {"board_no":board_no,
					"recommender":recommender},
			dataType : "text",
	  		success: function(data){
	  			if(data == "insert"){
	  				$(".recommendDiv").html("<a id='recommendBtn' class='recommenddelete'>취소</a>");
	  			}else if(data == "delete"){
	  				$(".recommendDiv").html("<a id='recommendBtn' class='recommendadd'>추천</a>");
	  			}
			} 
			, error: function(res){
			}
			
		});		
	})
});
</script>
<table>
<thead>
	<tr>
		<td style="width:33%;text-align:left;">&nbsp;&nbsp;${tripspot.board_no } &nbsp; ${tripspot.region } ${tripspot.region_detail }</td>
		<td style="width:34%;">${tripspot.title }</td>
		<td style="width:33%;text-align:right;"> 조회수 : ${tripspot.hit}&nbsp;&nbsp;</td>
	</tr>
</thead>
<tbody>
	<tr>
		<td colspan="3" style="text-align:right;">
		<fmt:formatDate value="${tripspot.writendate }" pattern="yyyy-MM-dd HH:mm:ss" />
		&nbsp;&nbsp;${tripspot.writer_nick}</td>
	</tr>
</tbody>
</table>
<div class="contentdiv">
${tripspot.content }
</div>
<div class="recommendDiv">
<c:if test="${recommendcnt eq 0}">
<a id="recommendBtn" class="recommendadd">추천</a>
</c:if>
<c:if test="${recommendcnt eq 1}">
<a id="recommendBtn" class="recommenddelete">취소</a>
</c:if>
</div>
<br><br>
<div class="btnDiv">
<button class="btn" onclick="location.href='/tripspot/list'">목록으로</button>&nbsp;&nbsp;
<button class="btn" onclick="location.href='/tripspot/update?board_no=${tripspot.board_no}'">수정</button>&nbsp;&nbsp;&nbsp;
<button class="btn" onclick="location.href='/tripspot/delete?board_no=${tripspot.board_no}'">삭제</button>
</div>
<hr>