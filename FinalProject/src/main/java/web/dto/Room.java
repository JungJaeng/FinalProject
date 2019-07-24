package web.dto;

import org.springframework.web.multipart.MultipartFile;

public class Room {
	private int room_no;
	private int pension_no;
	private String room_name;
	private String room_content;
	private String room_men;
	private String room_price;
	private String room_photo;
	
	
	
	@Override
	public String toString() {
		return "Room [room_no=" + room_no + ", pension_no=" + pension_no + ", room_name=" + room_name
				+ ", room_content=" + room_content + ", room_men=" + room_men + ", room_price=" + room_price
				+ ", room_photo=" + room_photo + "]";
	}
	
	public int getRoom_no() {
		return room_no;
	}
	public void setRoom_no(int room_no) {
		this.room_no = room_no;
	}
	public int getPension_no() {
		return pension_no;
	}
	public void setPension_no(int pension_no) {
		this.pension_no = pension_no;
	}
	public String getRoom_name() {
		return room_name;
	}
	public void setRoom_name(String room_name) {
		this.room_name = room_name;
	}
	public String getRoom_content() {
		return room_content;
	}
	public void setRoom_content(String room_content) {
		this.room_content = room_content;
	}
	public String getRoom_men() {
		return room_men;
	}
	public void setRoom_men(String room_men) {
		this.room_men = room_men;
	}
	public String getRoom_price() {
		return room_price;
	}
	public void setRoom_price(String room_price) {
		this.room_price = room_price;
	}
	public String getRoom_photo() {
		return room_photo;
	}
	public void setRoom_photo(String room_photo) {
		this.room_photo = room_photo;
	}
	
	
	
	
}	
