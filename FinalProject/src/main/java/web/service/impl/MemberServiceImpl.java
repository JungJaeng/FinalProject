package web.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.MemberDao;
import web.dto.Member;
import web.service.face.MemberService;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired MemberDao memberDao;
	
	@Override
	public boolean login(Member memberDate) {
		// 로그인 정보를 Count한 결과가 0보다 크면 로그인 성공
		if( memberDao.selectCntLogin(memberDate) > 0 ) {
			return true;
		}
		return false;
	}

	
	@Override
	public Member selectMember(Member member) {
		return memberDao.selectMember(member); 
	}
	
	
	@Override
	public boolean idcheck(String user_id) {
		
		if( memberDao.idcheck(user_id) > 0 ) {
			return false;
		} 
		
		return true; 
	}
	
	@Override
	public void insert(Member member) {
		memberDao.insert(member);
	}


}