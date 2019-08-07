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
</style>
<script type="text/javascript">
$(document).ready(function(){
	$("#recommendDiv").on("click", ".recommendBtn", function(){
		var board_no = "${tripspot.board_no }";
		var recommender = "${login_id}";
		$.ajax({
			url : "/tripspot/recommend",
			type : "POST",
			data : {"board_no":board_no,
					"recommender":recommender},
			dataType : "text",
	  		success: function(data){
	  			if(data == "추가"){
	  				$("#recommendDiv").html("<button class='recommendBtn'>추천 취소</button>");
	  			}else if(data == "삭제"){
	  				$("#recommendDiv").html("<button class='recommendBtn'>추천</button>");
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
<div id="recommendDiv">
<c:if test="${recommendcnt eq 0}">
<button class="recommendBtn">추천</button>
</c:if>
<c:if test="${recommendcnt eq 1}">
<button class="recommendBtn">추천 취소</button>
</c:if>
</div>
<button onclick="location.href='/tripspot/list'">목록으로</button>&nbsp;&nbsp;&nbsp;
<button onclick="location.href='/tripspot/update?board_no=${tripspot.board_no}'">수정</button>&nbsp;&nbsp;&nbsp;
<button onclick="location.href='/tripspot/delete?board_no=${tripspot.board_no}'">삭제</button>
<hr>