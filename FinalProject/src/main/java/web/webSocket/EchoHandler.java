package web.webSocket;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class EchoHandler extends TextWebSocketHandler {
	
	private static final Logger logger = LoggerFactory.getLogger(EchoHandler.class);

	List<WebSocketSession> sessionList = new ArrayList<>();

	
	//클라이언트와 연결 이후 실행되는 메소드
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		sessionList.add(session);
		
		Map <String, Object> map = session.getAttributes();
		String userId = (String)map.get("login_id");
		
		session.sendMessage(new TextMessage(userId+"님이 접속하셨습니다"));
		
		logger.info("{} 연결됨", userId);
	}
	
	//클라이언트가 서버로 메시지를 전송했을 때 실행되는 메소드
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
		Map <String, Object> map = session.getAttributes();
		String userId = (String)map.get("login_id");

		logger.info("{}로 부터 {} 받음", userId, message.getPayload());
		
		for(WebSocketSession s : sessionList) {
			s.sendMessage(new TextMessage(userId+" : " + message.getPayload()));
		}
	}
	
	//클라이언트와 연결을 끊었을 때 실행되는 메소드
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		sessionList.remove(session);
		
		Map <String, Object> map = session.getAttributes();
		String userId = (String)map.get("login_id");
		
		session.sendMessage(new TextMessage(userId+"님이 퇴장하셨습니다"));
		
		logger.info("{} 연결 끊김", userId);
	}
	
}














