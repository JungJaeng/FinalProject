package web.dto;

public class Pension {
	private int pension_no;
	private String pension_name;
	private String pension_postcode;
	private String pension_address;
	private String pension_detailAddress;
	private String pension_content;
	
	

	@Override
	public String toString() {
		return "Pension [pension_no=" + pension_no + ", pension_name=" + pension_name + ", pension_postcode="
				+ pension_postcode + ", pension_address=" + pension_address + ", pension_detailAddress="
				+ pension_detailAddress + ", pension_content=" + pension_content + "]";
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


	

	

	
}
