package web.dto;

import java.util.Date;

public class PensionComment {
	private int rnum;
	private int commentNo;
	private int pensionNo;
	private String writer_nick;
	private String content;
	private Date writtenDate;
	
	
	@Override
	public String toString() {
		return "PensionComment [rnum=" + rnum + ", commentNo=" + commentNo + ", pensionNo=" + pensionNo
				+ ", writer_nick=" + writer_nick + ", content=" + content + ", writtenDate=" + writtenDate + "]";
	}
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public int getCommentNo() {
		return commentNo;
	}
	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}
	public int getPensionNo() {
		return pensionNo;
	}
	public void setPensionNo(int pensionNo) {
		this.pensionNo = pensionNo;
	}
	public String getWriter_nick() {
		return writer_nick;
	}
	public void setWriter_nick(String writer_nick) {
		this.writer_nick = writer_nick;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getWrittenDate() {
		return writtenDate;
	}
	public void setWrittenDate(Date writtenDate) {
		this.writtenDate = writtenDate;
	}
	
	

	
}












