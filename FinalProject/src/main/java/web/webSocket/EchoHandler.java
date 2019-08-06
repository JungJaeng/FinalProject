package web.webSocket;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import web.dao.face.ChattingDao;
import web.dto.Chatting;

public class EchoHandler extends TextWebSocketHandler {
	
	private static final Logger logger = LoggerFactory.getLogger(EchoHandler.class);

	List<WebSocketSession> sessionList = new ArrayList();

	@Autowired ChattingDao chattingDao;
	
	Chatting chatting = new Chatting();
	
	//클라이언트와 연결 이후 실행되는 메소드
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		sessionList.add(session);
		
		Map <String, Object> map = session.getAttributes();
		String userId = (String)map.get("login_id");

		for(WebSocketSession s : sessionList) {
//			s.sendMessage(new TextMessage(userId+"님이 접속하셨습니다"));
			s.sendMessage(new TextMessage("{usercnt:3,users:[\"user01\",\"user02\",\"user03\"],msg:\""+userId+"님이 접속하셨습니다"+"\"}"));
		}
		
		chatting.setChat_memberid(userId);
		
		chattingDao.insertMember(chatting);
		
		logger.info("{} 연결됨", userId);
	}
	
	//클라이언트가 서버로 메시지를 전송했을 때 실행되는 메소드
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
		Map <String, Object> map = session.getAttributes();
		String userId = (String)map.get("login_id");

		logger.info("{}로 부터 {} 받음", userId, message.getPayload());
		
//		session.sendMessage(new TextMessage(userId+"님이 접속하셨습니다"));
		
		for(WebSocketSession s : sessionList) {
			s.sendMessage(new TextMessage(userId+" : " + message.getPayload()));
			
			chatting.setChat_content(message.getPayload());
			chatting.setChat_memberid(userId);
			
			chattingDao.insertChat(chatting);
		}
	}
	
	//클라이언트와 연결을 끊었을 때 실행되는 메소드
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		sessionList.remove(session);
		
		Map <String, Object> map = session.getAttributes();
		String userId = (String)map.get("login_id");
		
		chatting.setChat_memberid(userId);
		
		chattingDao.deleteMember(chatting);
		
//		session.sendMessage(new TextMessage(userId+"님이 퇴장하셨습니다"));
		
		logger.info("{} 연결 끊김", userId);
	}
	
}














