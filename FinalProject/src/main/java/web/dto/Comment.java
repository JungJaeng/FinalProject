package web.dto;

import java.util.Date;

public class Comment {
	private int commentno;
	private int board_no;
	private int ref_commentno;
	private int dept;
	private String writer_nick;
	private String content;
	private Date write_date;
	@Override
	public String toString() {
		return "Comment [commentno=" + commentno + ", board_no=" + board_no + ", ref_commentno=" + ref_commentno
				+ ", dept=" + dept + ", writer_nick=" + writer_nick + ", content=" + content + ", write_date="
				+ write_date + "]";
	}
	public int getCommentno() {
		return commentno;
	}
	public void setCommentno(int commentno) {
		this.commentno = commentno;
	}
	public int getBoard_no() {
		return board_no;
	}
	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}
	public int getRef_commentno() {
		return ref_commentno;
	}
	public void setRef_commentno(int ref_commentno) {
		this.ref_commentno = ref_commentno;
	}
	public int getDept() {
		return dept;
	}
	public void setDept(int dept) {
		this.dept = dept;
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
	public Date getWrite_date() {
		return write_date;
	}
	public void setWrite_date(Date write_date) {
		this.write_date = write_date;
	}
	
	
}
