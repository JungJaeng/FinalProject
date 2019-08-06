package web.dto;

public class Payment {
	private String imp_uid;
	private String merchant_uid;
	private String pay_method;
	private String name;
	private int paid_amount;
	private String buyer_id;
	private String buyer_email;
		
	@Override
	public String toString() {
		return "Payment [imp_uid=" + imp_uid + ", merchant_uid=" + merchant_uid + ", pay_method=" + pay_method
				+ ", name=" + name + ", paid_amount=" + paid_amount + ", buyer_id=" + buyer_id + ", buyer_email="
				+ buyer_email + "]";
	}
	
	public String getImp_uid() {
		return imp_uid;
	}
	public void setImp_uid(String imp_uid) {
		this.imp_uid = imp_uid;
	}
	public String getMerchant_uid() {
		return merchant_uid;
	}
	public void setMerchant_uid(String merchant_uid) {
		this.merchant_uid = merchant_uid;
	}
	public String getPay_method() {
		return pay_method;
	}
	public void setPay_method(String pay_method) {
		this.pay_method = pay_method;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPaid_amount() {
		return paid_amount;
	}
	public void setPaid_amount(int paid_amount) {
		this.paid_amount = paid_amount;
	}
	public String getBuyer_id() {
		return buyer_id;
	}
	public void setBuyer_id(String buyer_id) {
		this.buyer_id = buyer_id;
	}
	public String getBuyer_email() {
		return buyer_email;
	}
	public void setBuyer_email(String buyer_email) {
		this.buyer_email = buyer_email;
	}

	
}
