<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<c:forEach var="c" items="${commentlist }">
<div>
	<c:forEach  begin="1" end="${c.dept }">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</c:forEach>
	<c:if test="${c.dept ne 0}">ㄴ</c:if>
	${c.commentno } | 
	${c.ref_commentno } | 
	${c.writer_nick} | 
	${c.content} | 
	${c.write_date }
</div>
</c:forEach>
<hr>
<form action="/comment/insert" method="post">
<input type="hidden" name="board_no" value="${board.board_no }">
<input type="hidden" name="writer_nick" value="${board.writer_nick }"/>

${board.writer_nick}
<textarea name="content"></textarea>
<button>댓글입력</button>
</form>
</body>
</html>