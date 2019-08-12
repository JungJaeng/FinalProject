<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>

<!-- WebSocket : sock.js CDN -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.3.0/sockjs.js"></script>

<style type="text/css">
.member{
	float: right;
	background-color: darkgray;
}
.member_list{
	overflow: auto;
	height: 150px;
	width: 200px;
	background-color: #ccc;
	margin-left: 50px;
	margin-right: 50px;
    margin-top: 15%;
}
.memlist{
	text-align: center;
}

.chat{
	float: left;
}
.chat_list{
	overflow: auto;
	height: 300px;
	width: 700px;
	background-color: #ccc;
	margin-left: auto;
	border: double;
}

.list-group{
    margin: 0;
    padding: 0;
}
.input-group-append{
	padding: 0px;
}
.chatPtag{
	margin-left: 285px;
	font-size: 50px;
}
.nowmem{
	text-align: center;
}
#message{
	width: 600px;
}
#sendBtn{
	width: 90px;
}
.intext{
	margin-left: 75px;
	width: 700px;
	border: ridge;
}
</style>
</head>
<body>

<c:if test="${not login}"><h1>권한이 없습니다</h1></c:if>
<c:if test="${login}">
<div class="input-group mb-3">
<!--   <input type="text" id="message" class="form-control" placeholder="Message"> -->
  <div class="input-group-append">
<!--     <button id="sendBtn" class="btn btn-outline-secondary" type="button">Send</button> -->
    <p class="chatPtag">채팅방</p>
    <div class="member">
    	<div class="member_list" id="member_list">
		</div>
		<div class="nowmember">
		
		</div>
	</div>
  </div>
</div>
<div class="chat_list" id="chat_list">
	<ul class="list-group list-group-flush" id="data">
	<c:forEach items="${chatlist}" var="l">
		<tr class="content">
			<th>${l.chat_memberid}</th>
			<th> : ${l.chat_content}</th><br>
		</tr>
	</c:forEach>
	</ul>
</div>
	<div class="intext">
	<input type="text" id="message" class="form-control" placeholder="내용을 입력하세요">
	<button id="sendBtn" class="btn btn-outline-secondary" type="button">보내기</button>
	</div>
<script type="text/javascript">
$(document).ready(function() {
       $("#sendBtn").click(function() {
               sendMessage();
               $('#message').val('')
       });
       $("#message").keydown(function(key) {
               if (key.keyCode == 13) {// 엔터
                      sendMessage();
                      $('#message').val('')
               }
       });

});

// 웹소켓을 지정한 url로 연결한다.
// var ws = new WebSocket("ws://"+window.location.host+"${pageContext.request.contextPath}/echo"); //WebSocket사용
var ws = new SockJS("<c:url value='/echo'/>"); //SockJs 사용
ws.onopen = onOpen;
ws.onmessage = onMessage;
ws.onclose = onClose;

console.log(ws)

function onOpen(){
	console.log('websocket opened');
// 	var json = JSON.parse(msg.data);
// 	console.log(json);
}

// 서버로부터 메시지를 받았을 때
function onMessage(msg) {
       
		console.log(msg);
// 	var data = msg.data;
	var json = JSON.parse(msg.data);
	console.log(json); 
       $("#data").append(json.msg + "<br>");
       $(".nowmem").remove();
       $(".memlist").remove();
       $(".nowmember").append("<p class='nowmem'>현재접속자 수 : "+json.usercnt+"명</p>")
       
       $.ajax({
		type:'POST'
		,url:'/chatting/chatting'
		,dataType:'json'
		,success : function(res) {
			console.log(res)
			
			for(var i in res){
			console.log(res[i].chat_memberid)
				$(".member_list").append("<p class='memlist'>"+res[i].chat_memberid+"</p>");
			}
		}
	})

	$('#chat_list').scrollTop($('#chat_list').prop('scrollHeight'));

}

// function changelist() {
// 	$.ajax({
// 		type:'POST'
// 		,url:'/chatting/chatting'
// 		,dataType:'json'
// 		,success:function(data){
// 			console.log("change")
// 			console.log(data)
// 		}
// 	})
// }

// 서버와 연결을 끊었을 때
function onClose(evt) {
       $("#data").append("연결 끊김");
}

//메시지 전송
function sendMessage() {
    ws.send($("#message").val());
}

</script>

</c:if>
</body>
</html>
