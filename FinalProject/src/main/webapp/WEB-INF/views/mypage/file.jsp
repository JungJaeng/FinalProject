<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="/mypage/file" method="post" enctype="multipart/form-data">
	<label for="title">제목</label>
	<input type="text" name="title" id="title" /><br>

	<label for="file">첨부파일</label>
	<input type="file" name="file" id="file" /><br>

	<button>전송</button>
</form>

</body>
</html>