<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
	    ['insert', ['link', 'hr', 'picture']],
	    ['para', ['ul', 'ol', 'paragraph']],
	    ['height', ['height']],
        ['view', ['fullscreen', 'codeview']]
	  ],
	  height:500,
	  minHeight:500,
	  maxHeight:null,
		callbacks: {
			onImageUpload: function(files, editor) {
				sendFile(files[0],editor);
			}
		}
	});
	
});

function sendFile(file, editor) {
	// 파일 전송을 위한 폼생성
	data = new FormData();
    data.append("file", file);
    data.append("board_no",$('#board_no').val());

    $.ajax({ // ajax를 통해 파일 업로드 처리
        data : data,
        dataType: "json",
        type : "POST",
        url : "/board/imageupload",
        cache : false,
        contentType : false,
        enctype: 'multipart/form-data',
        processData : false,
        success : function(data) { // 처리가 성공할 경우
       		 // 에디터에 이미지 출력   
        	console.log(data);
        	$("#summernote").summernote('insertImage', "/boardimage?fileno="+data.fileno);
        	$('#board_no').val(data.board_no);
        	
        }
    });
}
</script>
<form action="/board/write" method="post">
<input type="text" style="display: none;" id="board_no" name="board_no" value="0"/>
아이디 : ${login_id }<input type="hidden" name="writer_id" value="${login_id  }"/><br>
닉네임 : ${login_nick }<input type="hidden" name="writer_nick" value="${login_nick  }"/><br>
제목 : <input type="text" name = "title"/><br>
<textarea name="content" id="summernote"></textarea><br>
<button>글 작성</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<button type="button" onclick="location.href='/board/list'">돌아가기</button>
</form>
