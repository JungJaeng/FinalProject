<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<!-- include summernote css/js -->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.js"></script>
<script type="text/javascript">
$(document).ready(function(){
$('#summernote').summernote({
	  toolbar: [
	    // [groupName, [list of button]]
	    ['style', ['bold' , 'italic', 'underline', 'clear']],
	    ['font', ['strikethrough', 'superscript', 'subscript']],
	    ['fontsize', ['fontsize']],
	    ['color', ['color']],
	    ['para', ['ul', 'ol', 'paragraph']],
	    ['height', ['height']]
	  ],
	  height:500,
	  minHeight:null,
	  maxHeight:null
	});
});
</script>
</head>
<body>
<form action="/board/update" method="post">
<input type="hidden" name="board_no" value="${board.board_no }">

아이디 : ${board.writer_id }<br>

닉네임 : ${board.writer_nick}<br>

<label>제목 : <input type="text" name = "title" value="${board.title }"/></label><br>
<textarea name="content" id="summernote">${board.content }</textarea><br>


<button>수정하기</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<button type="button" onclick="history.back(-1);">돌아가기</button>
</form>
</body>
</html>