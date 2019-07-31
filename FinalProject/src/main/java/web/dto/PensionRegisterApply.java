package web.dto;

import java.util.Date;

public class PensionRegisterApply {
	private int apply_no;
	private String writer_id;
	private String writer_nick;
	private String pension_name;
	private String pension_postcode;
	private String pension_address;
	private String pension_detailAddress;
	private String pension_content;
	private String room_name;
	private String room_content;
	private String room_men;
	private String room_size;
	private String room_price;
	private Date apply_date;
	
	
	
	@Override
	public String toString() {
		return "PensionRegisterApply [apply_no=" + apply_no + ", writer_id=" + writer_id + ", writer_nick="
				+ writer_nick + ", pension_name=" + pension_name + ", pension_postcode=" + pension_postcode
				+ ", pension_address=" + pension_address + ", pension_detailAddress=" + pension_detailAddress
				+ ", pension_content=" + pension_content + ", room_name=" + room_name + ", room_content=" + room_content
				+ ", room_men=" + room_men + ", room_size=" + room_size + ", room_price=" + room_price + ", apply_date="
				+ apply_date + "]";
	}
	public int getApply_no() {
		return apply_no;
	}
	public void setApply_no(int apply_no) {
		this.apply_no = apply_no;
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
	public String getPension_name() {
		return pension_name;
	}
	public void setPension_name(String pension_name) {
		this.pension_name = pension_name;
	}
	public String getPension_postcode() {
		return pension_postcode;
	}
	public void setPension_postcode(String pension_postcode) {
		this.pension_postcode = pension_postcode;
	}
	public String getPension_address() {
		return pension_address;
	}
	public void setPension_address(String pension_address) {
		this.pension_address = pension_address;
	}
	public String getPension_detailAddress() {
		return pension_detailAddress;
	}
	public void setPension_detailAddress(String pension_detailAddress) {
		this.pension_detailAddress = pension_detailAddress;
	}
	public String getPension_content() {
		return pension_content;
	}
	public void setPension_content(String pension_content) {
		this.pension_content = pension_content;
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
	public String getRoom_size() {
		return room_size;
	}
	public void setRoom_size(String room_size) {
		this.room_size = room_size;
	}
	public String getRoom_price() {
		return room_price;
	}
	public void setRoom_price(String room_price) {
		this.room_price = room_price;
	}
	public Date getApply_date() {
		return apply_date;
	}
	public void setApply_date(Date apply_date) {
		this.apply_date = apply_date;
	}
	


}
