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

</head>
<body>



<div class="input-group mb-3">
  <input type="text" id="message" class="form-control" placeholder="Message">
  <div class="input-group-append" style="padding: 0px;">
    <button id="sendBtn" class="btn btn-outline-secondary" type="button">Send</button>
  </div>
</div>
<div>
	<ul class="list-group list-group-flush" id="data"></ul>
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
}

// 서버로부터 메시지를 받았을 때
function onMessage(msg) {
       var data = msg.data;
       $("#data").append(data + "<br>");
}

// 서버와 연결을 끊었을 때
function onClose(evt) {
       $("#data").append("연결 끊김");
}

//메시지 전송
function sendMessage() {
    ws.send($("#message").val());
}

</script>



</body>
</html>