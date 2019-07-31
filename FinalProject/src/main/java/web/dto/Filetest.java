package web.dto;

public class Filetest {

	private int fileno;
	private String userid;
	private String origin_name;
	private String stored_name;
	@Override
	public String toString() {
		return "Filetest [fileno=" + fileno + ", userid=" + userid + ", origin_name=" + origin_name + ", stored_name="
				+ stored_name + "]";
	}
	public int getFileno() {
		return fileno;
	}
	public void setFileno(int fileno) {
		this.fileno = fileno;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getOrigin_name() {
	 	return origin_name;
	}
	public void setOrigin_name(String origin_name) {
		this.origin_name = origin_name;
	}
	public String getStored_name() {
		return stored_name;
	}
	public void setStored_name(String stored_name) {
		this.stored_name = stored_name;
	}
	
	
	
	
}
