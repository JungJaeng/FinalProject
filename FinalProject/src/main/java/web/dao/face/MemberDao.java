package web.dao.face;

import web.dto.Member;

public interface MemberDao {

	public int selectCntLogin(Member memberDate);
	
	public Member selectMember(Member member);
	
	public int idcheck(String user_id);
	
	public void insert(Member member);

	public int selectCntIdFind(Member memberDate);

	public Member idFindSelectMember(Member member);

	public void changePwd(String newPwd, String user_id);

	public Member pwFindSelectMember(Member member);

	public void pwUpdate(Member pwFind);

	public int nickcheck(String user_nick);

	public void insertNaverLogin(String apiResult);

	public int useridcheck1(String userId);

	
}
