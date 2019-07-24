package web.dto;

public class Pension {
	private int pension_no;
	private String pension_name;
	private String pension_location;
	private String pension_content;
	private String pension_photo;
	
	private String pensionThumb_photo;
	
	

	@Override
	public String toString() {
		return "Pension [pension_no=" + pension_no + ", pension_name=" + pension_name + ", pension_location="
				+ pension_location + ", pension_content=" + pension_content + ", pension_photo=" + pension_photo
				+ ", pensionThumb_photo=" + pensionThumb_photo + "]";
	}

	public int getPension_no() {
		return pension_no;
	}

	public void setPension_no(int pension_no) {
		this.pension_no = pension_no;
	}

	public String getPension_name() {
		return pension_name;
	}

	public void setPension_name(String pension_name) {
		this.pension_name = pension_name;
	}

	public String getPension_location() {
		return pension_location;
	}

	public void setPension_location(String pension_location) {
		this.pension_location = pension_location;
	}

	public String getPension_content() {
		return pension_content;
	}

	public void setPension_content(String pension_content) {
		this.pension_content = pension_content;
	}

	public String getPension_photo() {
		return pension_photo;
	}

	public void setPension_photo(String pension_photo) {
		this.pension_photo = pension_photo;
	}

	public String getPensionThumb_photo() {
		return pensionThumb_photo;
	}

	public void setPensionThumb_photo(String pensionThumb_photo) {
		this.pensionThumb_photo = pensionThumb_photo;
	}
	
	
	
	
	

	
}
