package web.dto;

import java.util.Date;

public class Reservation {
	private int res_no;
	private int room_no;
	private int user_no;
	private String res_room;
	private String res_user;
	private int usemen;
	private int res_price;
	private Date res_date;
	
	
	
	@Override
	public String toString() {
		return "Reservation [res_no=" + res_no + ", room_no=" + room_no + ", user_no=" + user_no + ", res_room="
				+ res_room + ", res_user=" + res_user + ", usemen=" + usemen + ", res_price=" + res_price
				+ ", res_date=" + res_date + "]";
	}
	public int getRes_no() {
		return res_no;
	}
	public void setRes_no(int res_no) {
		this.res_no = res_no;
	}
	public int getRoom_no() {
		return room_no;
	}
	public void setRoom_no(int room_no) {
		this.room_no = room_no;
	}
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public String getRes_room() {
		return res_room;
	}
	public void setRes_room(String res_room) {
		this.res_room = res_room;
	}
	public String getRes_user() {
		return res_user;
	}
	public void setRes_user(String res_user) {
		this.res_user = res_user;
	}
	public int getUsemen() {
		return usemen;
	}
	public void setUsemen(int usemen) {
		this.usemen = usemen;
	}
	public int getRes_price() {
		return res_price;
	}
	public void setRes_price(int res_price) {
		this.res_price = res_price;
	}
	public Date getRes_date() {
		return res_date;
	}
	public void setRes_date(Date res_date) {
		this.res_date = res_date;
	}
	
	
	
	

}
