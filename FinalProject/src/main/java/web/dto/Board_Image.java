package web.dto;

public class Board_Image {
	private int fileno;
	private int board_no;
	private String origin_name;
	private String stored_name;
	private int filesize;
	public int getFileno() {
		return fileno;
	}
	public void setFileno(int fileno) {
		this.fileno = fileno;
	}
	public int getBoard_no() {
		return board_no;
	}
	public void setBoard_no(int board_no) {
		this.board_no = board_no;
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
	public int getFilesize() {
		return filesize;
	}
	public void setFilesize(int filesize) {
		this.filesize = filesize;
	}
	@Override
	public String toString() {
		return "Board_Image [fileno=" + fileno + ", board_no=" + board_no + ", origin_name=" + origin_name
				+ ", stored_name=" + stored_name + ", filesize=" + filesize + "]";
	}
}
