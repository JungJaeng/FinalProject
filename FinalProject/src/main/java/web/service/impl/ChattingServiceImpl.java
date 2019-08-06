package web.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.ChattingDao;
import web.dto.Chatting;
import web.service.face.ChattingService;

@Service
public class ChattingServiceImpl implements ChattingService{

	@Autowired ChattingDao chattingDao;
	
	public List<Chatting> getmemberAll(){
		
		return chattingDao.memberlist();
	}
	
	public List<Chatting> getchatAll(){
		
		return chattingDao.chatlist();
	}
	
}
