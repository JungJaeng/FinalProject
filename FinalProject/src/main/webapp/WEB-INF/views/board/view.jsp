<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script type="text/javascript">
$(document).ready(function() {
	var commentno;
	var dept
	var board_no = ${board.board_no};
	var writer_nick = "${login_nick}";
	
	$("#commentdiv").on("click", ".recommentanchor", function() {
		$("#recommentdiv").remove();
		if(commentno == $(this).parent().attr("data-commentno")){commentno = 0; return false;}
		commentno = $(this).parent().attr("data-commentno");
		$(this).parent().append(
				"<div id='recommentdiv'><textarea id='recommentcontent'></textarea><button id='recommentBtn'>댓글입력</button></div>");
	})
	
	$("#commentdiv").on("click", "#recommentBtn", function() {
// 		console.log("reocomment btn clicked")
		dept = $(this).parent().parent().attr("data-dept");
		var recommentcontent =  $("#recommentcontent").val();
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
	  			console.log(res);
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
		commentno = $(this).parent().attr("data-commentno");
		$.ajax({
			url : "/board/comment/delete",
			type : "POST",
			data : {"commentno":commentno,
					"board_no":board_no},
			dataType:"html",
	  		success: function(res){
	  			console.log(res);
	  			$("#commentdiv").html(res);
			} 
			, error: function(res){

			}
			
		});
	})

});


</script>
</head>
<body>
<table>
<thead>
	<tr>
		<td>글번호</td>
		<td>제목</td>
		<td>내용</td>
		<td>작성자아이디</td>
		<td>작성자닉네임</td>
		<td>조회수</td>
		<td>작성일</td>
	</tr>
</thead>
<tbody>
	<tr>
		<td>${board.board_no}</td>
		<td>${board.title}</td>
		<td>${board.content}</td>
		<td>${board.writer_id}</td>
		<td>${board.writer_nick}</td>
		<td>${board.hit}</td>
		<td>${board.write_date}</td>
	</tr>
</tbody>
</table>
<button onclick="location.href='/board/list'">목록으로</button>&nbsp;&nbsp;&nbsp;
<button onclick="location.href='/board/update?board_no=${board.board_no}'">수정</button>&nbsp;&nbsp;&nbsp;
<button onclick="location.href='/board/delete?board_no=${board.board_no}'">삭제</button>


<hr>
<div id="commentdiv">
<c:import url="/WEB-INF/views/board/comment.jsp"/>
</div>
${login_nick}
<textarea id="commentcontent" name="commentcontent"></textarea>
<button id=commentinsert>댓글입력</button>