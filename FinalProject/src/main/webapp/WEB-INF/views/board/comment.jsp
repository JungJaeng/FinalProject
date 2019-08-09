<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<style type="text/css">

.tab { white-space: pre; }

.commentdiv1,.commentdiv2{
	display: inline-block;
}
.commentdiv2{
	background: #EEE;
	border: 1px solid black;
	
}
.commentconetnt{
	border-top: 1px solid #AAA;
	background: #DDD;
}
</style>
<c:forEach var="c" items="${commentlist }">
<div class="comment" data-commentno="${c.commentno }" data-ref_commentno="${c.ref_commentno }" data-dept="${c.dept }">
<c:forEach  begin="1" end="${c.dept }"><div class="commentdiv1"><span class="tab">&#9;</span></div></c:forEach>
	<c:if test="${c.dept ne 0}">ㄴ</c:if>
	<div class="commentdiv2">
	<table>
		<tr>
		<td style="width:10%">${c.writer_nick}</td>
		<td style="width:50%"></td>
		<td style="width:40%" style="text-align: right;">
			<fmt:formatDate value="${c.write_date }" pattern="MM-dd HH:mm:ss "/>
			<c:if test="${c.dept < 2 }"><a class="recommentanchor">답글달기</a></c:if>
			<c:if test="${login_nick eq c.writer_nick}"><a class="deleteanchor">| 삭제</a></c:if>
		</td>
		</tr>
	</table>
	<div class="commentcontent">
	${c.content}
	</div>
	</div>
</div>
</c:forEach>