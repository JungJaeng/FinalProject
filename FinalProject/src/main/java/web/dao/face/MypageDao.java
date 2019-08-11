package web.dao.face;

import java.util.List;
import java.util.Map;

import web.dto.Board;
import web.dto.Filetest;
import web.dto.Member;
import web.dto.TripSpot;
import web.util.Paging;

public interface MypageDao {

	public Member selectLoginById(Member member);
	public void infoWithdrawDao(String id);

	public void updateDao(Member member);

	public void insertFile(Filetest filetest);

	public Filetest selectImgDao(String loginid);
	
	public int selectImgCnt(String loginid);

	public void Imgdelete(String userid);
	public int selectCntAll2(String writer_id);
	public List<Board> selectAll2(Map<String,Object> map);
//	public boolean checkpw(String user_id, String user_pw);
	public List<TripSpot> selectAll3(Map<String, Object> map);
	public int selectCntAll3(String writer_id);

}
