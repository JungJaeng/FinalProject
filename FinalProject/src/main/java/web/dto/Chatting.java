package web.dto;

public class Chatting {

	private int chat_memberno;
	private String chat_memberid;
	private int chat_no;
	private String chat_content;
	private String chat_session;
	
	@Override
	public String toString() {
		return "Chatting [chat_memberno=" + chat_memberno + ", chat_memberid=" + chat_memberid + ", chat_no=" + chat_no
				+ ", chat_content=" + chat_content + ", chat_session=" + chat_session + "]";
	}
	public String getChat_session() {
		return chat_session;
	}
	public void setChat_session(String chat_session) {
		this.chat_session = chat_session;
	}
	public int getChat_memberno() {
		return chat_memberno;
	}
	public void setChat_memberno(int chat_memberno) {
		this.chat_memberno = chat_memberno;
	}
	public String getChat_memberid() {
		return chat_memberid;
	}
	public void setChat_memberid(String chat_memberid) {
		this.chat_memberid = chat_memberid;
	}
	public int getChat_no() {
		return chat_no;
	}
	public void setChat_no(int chat_no) {
		this.chat_no = chat_no;
	}
	public String getChat_content() {
		return chat_content;
	}
	public void setChat_content(String chat_content) {
		this.chat_content = chat_content;
	}
	
	
}
