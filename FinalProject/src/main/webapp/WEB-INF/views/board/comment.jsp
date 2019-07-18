<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:forEach var="c" items="${commentlist }">
<div class="comment" data-commentno="${c.commentno }" data-ref_commentno="${c.ref_commentno }" data-dept="${c.dept }">
	<c:forEach  begin="1" end="${c.dept }">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</c:forEach>
	<c:if test="${c.dept ne 0}">ㄴ</c:if>
	${c.commentno } | 
	${c.ref_commentno } | 
	${c.writer_nick} | 
	${c.content} | 
	${c.write_date } |
	<c:if test="${c.dept < 2 }"><a class="recommentanchor">답글달기</a></c:if>
	<hr>
	<div></div>
</div>
</c:forEach>