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

	List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();

	@Autowired ChattingDao chattingDao;
	
	Chatting chatting = new Chatting();
	
	//클라이언트와 연결 이후 실행되는 메소드
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		sessionList.add(session);
		
		
		Map <String, Object> map = session.getAttributes();
		String userId = (String)map.get("login_id");

		
//		logger.info("map"+(String)map.get("login_Id"));
//		List<String> list = new ArrayList<String>();

		int usercnt = 0;
		for(int i=0; i<=sessionList.size(); i++) {
		usercnt = i;
		}
		logger.info("usercnt:"+usercnt);
		
		
//		list.add(userId);
		
		
//		JSONObject obj = new JSONObject();
//		
//		JSONArray jsonArray = new JSONArray();
		
//		logger.info("map:",map);
		
//		List<Chatting> chatlist = chattingDao.memberlist();
		
//		for(int i=0; i<=list.size(); i++) {
//			JSONObject sObject = new JSONObject();
//			sObject.put("users", list.get(i).lastIndexOf(userId));
//			jsonArray.add(sObject);
//		}
		
//		logger.info("session:",sessionList);
		
		
//		jsonArray.add
		
//		obj.put("usercnt",usercnt);
//		obj.put("msg",userId+"님이접속하셨습니다");
//		obj.put("users",jsonArray);

//		logger.info(obj.toString());
//		logger.info(jsonArray.toString());
		
		for(WebSocketSession s : sessionList) {
//			s.sendMessage(new TextMessage(userId+"님이 접속하셨습니다"));
//			s.sendMessage(new TextMessage(obj.toString()));
			s.sendMessage(new TextMessage("{\"usercnt\":"+usercnt+",\"msg\":\""+userId+"님이 접속하셨습니다"+"\"}"));
//			s.sendMessage(new TextMessage("{\"usercnt\":3,\"users\":[\"user01\",\"user02\",\"user03\"],\"msg\":\"user01님이 접속하셨습니다\"}"));
			
			logger.info("se:"+s.getId());
			
		}
		
		chatting.setChat_memberid(userId);
		
		chatting.setChat_session(session.getId());
		
		chattingDao.insertMember(chatting);
		
		logger.info("{} 연결됨", userId);
	}
	
	//클라이언트가 서버로 메시지를 전송했을 때 실행되는 메소드
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
		Map <String, Object> map = session.getAttributes();
		String userId = (String)map.get("login_id");
		
		int usercnt = 0;
		for(int i=0; i<=sessionList.size(); i++) {
		usercnt = i;
		}
		logger.info("usercnt:"+usercnt);
		
		List<Chatting> list = chattingDao.memberlist();
		
		for (Chatting c : list) {
			logger.info(c.getChat_memberid());
		}

//		logger.info(msg);
		
		logger.info("{}로 부터 {} 받음", userId, message.getPayload());
		
//		session.sendMessage(new TextMessage(userId+"님이 접속하셨습니다"));
		
		for(WebSocketSession s : sessionList) {
			
//			List<Chatting> slist = new ArrayList<Chatting>();
//			
//			for(int i = 0 ; i<=list.size(); i++) {
//				slist.add(chatting);
//			}
//			s.sendMessage(new TextMessage("{\"usercnt\":"+usercnt+",\"users\":[\"user01\",\"user02\",\"user03\"],\"msg\":\""+userId+"님이 접속하셨습니다"+"\"}"));
			s.sendMessage(new TextMessage("{\"msg\":\""+userId+" : " + message.getPayload()+"\",\"usercnt\":"+usercnt+"}" ));
			
			chatting.setChat_content(message.getPayload());
			chatting.setChat_memberid(userId);
			
			chattingDao.insertChat(chatting);
		}
	}
	
	//클라이언트와 연결을 끊었을 때 실행되는 메소드
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		chatting.setChat_session(session.getId());
		
		logger.info("session"+session.getId());
		
		sessionList.remove(session);
		
		Map <String, Object> map = session.getAttributes();
		String userId = (String)map.get("login_id");
		
		int usercnt = 0;
		for(int i=0; i<=sessionList.size(); i++) {
		usercnt = i;
		}
		
		for(WebSocketSession s : sessionList) {
			s.sendMessage(new TextMessage("{\"usercnt\":"+usercnt+",\"msg\":\""+userId+"님이 퇴장하셨습니다"+"\"}"));
		
		}	
		
		chatting.setChat_memberid(userId);
		
		chattingDao.deleteMember(chatting);
		
//		session.sendMessage(new TextMessage(userId+"님이 퇴장하셨습니다"));
		
		logger.info("{} 연결 끊김", userId);
		
	
	}
}














