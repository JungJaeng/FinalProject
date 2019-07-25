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



$(document).ready(function() {
	
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
	
	
	
	
	//작성버튼 동작
	$("#btnWrite").click(function() {
		$("form").submit();
	});
	
	//취소버튼 동작
	$("#btnCancel").click(function() {
		history.go(-1);
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
	           $("#summernote").summernote('insertImage', "/upload?fileno="+data.fileno);
	           $('#board_no').val(data.board_no);
	           
	        }
	    });
	}
	
</script>

</head>
<body>

<h1>펜션등록 요청</h1>
<hr>

<div class="container">
    <form action="/pension/register_apply" method="post" enctype="multipart/form-data">
            
            
      <div class="form-group">
        <label for="writer_id">작성자</label>
        <input type="text" class="form-control" value="${user_nick }" readonly="readonly" >
      </div>
      
      
      
      <div class="form-group">
        <label for="pension_name">펜션명</label>
        <input type="text" class="form-control" name="pension_name" placeholder="펜션명을 입력하세요.">
      </div>
      
      <div class="form-group">
        <label for="pension_location">펜션 위치</label>
        <input type="text" class="form-control" name="pension_location" placeholder="위치를 입력하세요.">
      </div>
      
      <div class="form-group">
        <label for="pension_content">펜션 소개</label>
        <textarea class="form-control" name="pension_content"></textarea>
      </div>
      
      <div class="form-group">
        <label for="room_name">객실명</label>
        <input type="text" class="form-control" name="room_name">
      </div>
      
      <div class="form-group">
        <label for="room_content">객실 소개</label>
        <textarea class="form-control" name="room_content"></textarea>
      </div>
      
      <div class="form-group">
        <label for="room_personnel">인원</label>
        <input type="text" class="form-control" name="room_personnel">
      </div>
      
      <div class="form-group">
        <label for="room_size">크기</label>
        <input type="text" class="form-control" name="room_size">
      </div>
      
       <div class="form-group">
        <label for="room_price">요금</label>
        <input type="text" class="form-control" name="room_price">
      </div>  
      
       <div class="form-group">
        <label for="room_content">방 소개</label>
        <textarea class="form-control" name="room_content"></textarea>
      </div>        
      
      <label>이미지 파일 : <input type="file" name="file"/></label>

<div class="text-center">	
	<button type="button" id="btnWrite" class="btn btn-info">등록 신청</button>
	<button type="button" id="btnCancel" class="btn btn-danger">취소</button>
</div>
     
    </form>
</div>

</body>
</html>