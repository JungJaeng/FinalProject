<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<style type="text/css">	

table thead {
	padding: 10px;
    border-top: 2px solid #282c37;
}			
table tbody {
	padding: 10px;
    border-bottom: 2px solid #282c37;
}					
.button-center {
	text-align: center;
}
.tablediv {
	padding: 0 5% 0 5%;
}
.contentdiv{
	padding: 0 10% 0 10%;
}
table{
	width: 100%;
	border-collapse: collapse;
    text-align: center;
    line-height: 1.5;
}
.viewinfo {
	background:#ccc;
}
h1{
	color:#000;
	font:bold 12px tahoma;
	font-size: 32px;
}
hr{
	color: "black";
	border-style: inset;
	border-width: 1px;
}
.wrap{
	padding:0 5% 0 5%;
	border-collapse: collapse;
}
img {
	max-width: 100%;
}
</style>
<table>
<thead>
	<tr>
		<td style="width:33%;text-align:left;">&nbsp;&nbsp;${tripspot.board_no } &nbsp; ${tripspot.region } ${tripspot.region_detail }</td>
		<td style="width:34%;">${tripspot.title }</td>
		<td style="width:33%;text-align:right;"> 조회수 : ${tripspot.hit}&nbsp;&nbsp;</td>
	</tr>
</thead>
<tbody>
	<tr>
		<td colspan="3" style="text-align:right;">
		<fmt:formatDate value="${tripspot.writendate }" pattern="yyyy-MM-dd HH:mm:ss" />
		&nbsp;&nbsp;${tripspot.writer_nick}</td>
	</tr>
</tbody>
</table>
<div class="contentdiv">
${tripspot.content }
</div>
<button onclick="location.href='/tripspot/list'">목록으로</button>&nbsp;&nbsp;&nbsp;
<button onclick="location.href='/tripspot/update?board_no=${tripspot.board_no}'">수정</button>&nbsp;&nbsp;&nbsp;
<button onclick="location.href='/tripspot/delete?board_no=${tripspot.board_no}'">삭제</button>
<hr>