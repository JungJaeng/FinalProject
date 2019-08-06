package web.service.face;

import java.util.List;

import web.dto.Chatting;

public interface ChattingService {

	public List<Chatting> getmemberAll();
	
	public List<Chatting> getchatAll();
	
}
