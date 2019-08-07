package web.dto;

public class Recommend {
	private int board_no;
	private String recommender;
	public int getBoard_no() {
		return board_no;
	}
	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}
	public String getRecommender() {
		return recommender;
	}
	public void setRecommender(String recommender) {
		this.recommender = recommender;
	}
	@Override
	public String toString() {
		return "Recommend [board_no=" + board_no + ", recommender=" + recommender + "]";
	}
}
