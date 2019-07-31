package web.dao.face;

import web.dto.Filetest;
import web.dto.Member;

public interface MypageDao {

	public Member selectLoginById(Member member);
	public void infoWithdrawDao(String id);

	public void updateDao(Member member);

	public void insertFile(Filetest filetest);

	public Filetest selectImgDao(String loginid);
	
	public int selectImgCnt(String userid);

	public void Imgdelete(String userid);
	public void selectAllDao2(String loginid);

}
