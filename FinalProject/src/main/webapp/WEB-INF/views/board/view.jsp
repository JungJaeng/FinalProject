<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script type="text/javascript">
$(document).ready(function() {
	var commentno = 0;
	var dept = 0;
	var board_no = ${board.board_no}
	var writer_nick = "${login_nick}";
	
	$("#commentdiv").on("click", ".recommentanchor", function() {
		$("#recommentdiv").remove();
		if(commentno == $(this).parent().parent().parent().parent().parent().parent().attr("data-commentno")){commentno = 0; return false;}
		commentno = $(this).parent().parent().parent().parent().parent().parent().attr("data-commentno");
		$(this).parent().parent().parent().parent().parent().parent().append(
				"<div id='recommentdiv'><textarea id='recommentcontent'></textarea><button id='recommentBtn'>댓글입력</button></div>");
	})
	
	$("#commentdiv").on("click", "#recommentBtn", function() {
// 		console.log("reocomment btn clicked")
		dept = $(this).parent().parent().attr("data-dept");
		var recommentcontent =  $("#recommentcontent").val();
		console.log(dept);
		console.log(commentno);
		$.ajax({
			url : "/board/comment/insert",
			type : "POST",
			data : {"board_no":board_no,
					"content":recommentcontent,
					"writer_nick":writer_nick,
					"commentno":commentno,
					"dept":dept},
			dataType:"html",
	  		success: function(res){
	  			$("#commentdiv").html(res);
			} 
			, error: function(res){

			}
			
		});		
		
	})
	$("#commentinsert").click(function(){
		commentno = 0
		var commentcontent =  $("#commentcontent").val();
		$.ajax({
			url : "/board/comment/insert",
			type : "POST",
			data : {"board_no":board_no,
					"content":commentcontent,
					"writer_nick":writer_nick},
			dataType:"html",
	  		success: function(res){
	  			console.log(res);
	  			$("#commentdiv").html(res);
				$("#commentcontent").val("");
			} 
			, error: function(res){

			}
			
		});
	})
	$("#commentdiv").on("click", ".deleteanchor", function() {
		commentno = $(this).parent().parent().parent().parent().parent().parent().attr("data-commentno");
		
		console.log($(this).parent().parent().parent().parent().parent().parent());
	
		if(confirm("삭제 하시겠습니까?")){
			$.ajax({
				url : "/board/comment/delete",
				type : "POST",
				data : {"commentno":commentno,
						"board_no":board_no},
				dataType:"html",
		  		success: function(res){
		  			$("#commentdiv").html(res);
				} 
				, error: function(res){
	
				}
				
			});
		}
	})

});

</script>
<style type="text/css">
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

.btnDiv{
	text-align: center;
}
</style>
</head>
<body>
<h2>${board.board_no} | ${board.title}</h2>
<h4>${board.writer_nick}</h4>
<table class="view">
	<tr>
		<td style="width: 30%;"><fmt:formatDate value="${board.write_date }" pattern="YYYY년 MM월 dd일 HH:mm:ss "/></td>
		<td style="width: 60%;"></td>
		<td style="width: 10%; text-align:center;">조회수 : ${board.hit}</td>
	</tr>
</table>
<div class="contentDiv">
${board.content}
</div>
<hr>
<div class="btnDiv">
<a class="btn" onclick="location.href='/board/list'">목록으로</a>&nbsp;&nbsp;&nbsp;
<a class="btn" onclick="location.href='/board/update?board_no=${board.board_no}'">수정</a>&nbsp;&nbsp;&nbsp;
<a class="btn" onclick="location.href='/board/delete?board_no=${board.board_no}'">삭제</a>
</div>





<div id="commentdiv">
<c:import url="/WEB-INF/views/board/comment.jsp"/>
</div>
<c:if test="${login_id ne null}">
${login_nick}
<textarea id="commentcontent" name="commentcontent"></textarea>
<button id=commentinsert>댓글입력</button>
</c:if>