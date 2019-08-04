package web.service.face;

import web.dto.Member;

public interface MemberService {
	
	// 濡�洹몄�� 
	public boolean login(Member member);
	
	// ����議고��
	public Member selectMember(Member member);
	
	// 以�蹂�ID泥댄��
	public boolean idcheck(String user_id);

	// ����媛���
	public void insert(Member member);

	// ���� ���대��李얘린
	public boolean idFind(Member member);

	// ���대��李얘린 ����議고��
	public Member idFindSelectMember(Member member);
	
	// 鍮�諛�踰��몄갼湲� ����議고��
	public Member pwFindSelectMember(Member member);

	// ����鍮�諛�踰��� 硫��쇰� 蹂대�닿린
	public void pwSendEmail(Member member);

	
	public boolean nickcheck(String user_nick);

	
	public void insertNaverLogin(String apiResult);





}
