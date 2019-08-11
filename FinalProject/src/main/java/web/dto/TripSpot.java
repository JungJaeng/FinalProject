package web.dto;

import java.util.Date;

public class TripSpot {
	private int board_no;
	private String region;
	private String region_detail;
	private String title;
	private String content;
	private String writer_id;
	private String writer_nick;
	private int hit;
	private Date writendate;
	private int thumbnail;
	public int getBoard_no() {
		return board_no;
	}
	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}
	public String getRegion() {
		return region;
	}
	public void setRegion(String region) {
		this.region = region;
	}
	public String getRegion_detail() {
		return region_detail;
	}
	public void setRegion_detail(String region_detail) {
		this.region_detail = region_detail;
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
	public Date getWritendate() {
		return writendate;
	}
	public void setWritendate(Date writendate) {
		this.writendate = writendate;
	}
	public int getThumbnail() {
		return thumbnail;
	}
	public void setThumbnail(int thumbnail) {
		this.thumbnail = thumbnail;
	}
	@Override
	public String toString() {
		return "TripSpot [board_no=" + board_no + ", region=" + region + ", region_detail=" + region_detail + ", title="
				+ title + ", content=" + content + ", writer_id=" + writer_id + ", writer_nick=" + writer_nick
				+ ", hit=" + hit + ", writendate=" + writendate + ", thumbnail=" + thumbnail + "]";
	}
}
