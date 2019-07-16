package web.dto;

import java.util.Date;

public class Board {
	private int board_no;
	private String title;
	private String content;
	private String writer_id;
	private String writer_nick;
	private int hit;
	private Date write_date;
	
	public int getBoard_no() {
		return board_no;
	}
	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter_id() {
		return writer_id;
	}
	public void setWriter_id(String writer_id) {
		this.writer_id = writer_id;
	}
	public String getWriter_nick() {
		return writer_nick;
	}
	public void setWriter_nick(String writer_nick) {
		this.writer_nick = writer_nick;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public Date getWrite_date() {
		return write_date;
	}
	public void setWrite_date(Date write_date) {
		this.write_date = write_date;
	}
	@Override
	public String toString() {
		return "Board [board_no=" + board_no + ", title=" + title + ", content=" + content + ", writer_id=" + writer_id
				+ ", writer_nick=" + writer_nick + ", hit=" + hit + ", write_date=" + write_date + "]";
	}
	
	
}
