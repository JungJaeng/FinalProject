package web.service.face;

import web.dto.Member;

public interface MemberService {
	
	// 로그인 
	public boolean login(Member member);
	
	// 회원조회
	public Member selectMember(Member member);
	
	// 중복ID체크
	public boolean idcheck(String user_id);

	// 회원가입
	public void insert(Member member);

	// 회원 아이디찾기
	public boolean idFind(Member member);

	// 아이디찾기 회원조회
	public Member idFindSelectMember(Member member);
	


}
