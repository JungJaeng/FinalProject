package web.dao.face;

import java.util.List;

import web.dto.Chatting;

public interface ChattingDao {

	public List<Chatting> chatlist();
	
	public void insertMember(Chatting chatting);
	
	public void deleteMember(Chatting chatting);
	
	public List<Chatting> memberlist();
	
	public void insertChat(Chatting chatting);

}
