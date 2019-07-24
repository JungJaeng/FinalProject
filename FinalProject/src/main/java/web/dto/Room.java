package web.dto;

import org.springframework.web.multipart.MultipartFile;

public class Room {
	private int room_no;
	private String room_name;
	private String room_size;
	private String room_men;
	private int room_price;
	private MultipartFile room_photo;
		
	@Override
	public String toString() {
		return "Room [room_no=" + room_no + ", room_name=" + room_name + ", room_size=" + room_size + ", room_men="
				+ room_men + ", room_price=" + room_price + ", room_photo=" + room_photo + "]";
	}
	
	public int getRoom_no() {
		return room_no;
	}
	public void setRoom_no(int room_no) {
		this.room_no = room_no;
	}
	public String getRoom_name() {
		return room_name;
	}
	public void setRoom_name(String room_name) {
		this.room_name = room_name;
	}
	public String getRoom_size() {
		return room_size;
	}
	public void setRoom_size(String room_size) {
		this.room_size = room_size;
	}
	public String getRoom_men() {
		return room_men;
	}
	public void setRoom_men(String room_men) {
		this.room_men = room_men;
	}
	public int getRoom_price() {
		return room_price;
	}
	public void setRoom_price(int room_price) {
		this.room_price = room_price;
	}
	public MultipartFile getRoom_photo() {
		return room_photo;
	}
	public void setRoom_photo(MultipartFile room_photo) {
		this.room_photo = room_photo;
	}
	
	
}	
