<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
$(document).ready(function() {
	
	//작성버튼 동작
	$("#btnWrite").click(function() {
		$("form").submit();
	});
	
	//취소버튼 동작
	$("#btnCancel").click(function() {
		history.go(-1);
	});
});
</script>

</head>
<body>

<h1>펜션등록 요청</h1>
<hr>

<div class="container">
    <form action="/pension/register" method="post" enctype="multipart/form-data">
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
      
      <label>이미지 파일 : <input type="file" name="file"/></label>

<div class="text-center">	
	<button type="button" id="btnWrite" class="btn btn-info">등록 신청</button>
	<button type="button" id="btnCancel" class="btn btn-danger">취소</button>
</div>
     
    </form>
</div>

</body>
</html>