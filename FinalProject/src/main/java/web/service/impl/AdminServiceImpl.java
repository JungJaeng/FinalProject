package web.service.impl;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.AdminDao;
import web.dto.Member;
import web.dto.PensionRegisterApply;
import web.service.face.AdminService;
import web.util.Paging;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired AdminDao adminDao;
	
	// 로그 라이브러리 객체
	private static final Logger logger = LoggerFactory.getLogger(AdminServiceImpl.class);
	
	// 관리자페이지 - 회원관리 페이지
	@Override
	public Paging getCurPage(Map<String, Object> map) {

		int totalCount = adminDao.selectCntAll(map);
		int curPage = Integer.parseInt(map.get("curPage").toString());
		
		Paging paging = new Paging(totalCount,curPage);
		
		paging.setName((String)map.get("name"));
		paging.setSearch((String)map.get("search"));
		
		return paging;
	}

	@Override
	public List<Member> getList(Paging paging) {
		return adminDao.selectAll(paging);
	}
	
	// 리스트에서 회원삭제
	@Override
	public void memberListDelete(String names) {
		adminDao.deleteMemberList(names);
//		logger.info(names);
		
	}

	// 펜선요청확인 페이지
	@Override
	public Paging ApplygetCurPage(Map<String, Object> map) {
		
		int totalCount = adminDao.selectCntAll_apply(map);
		int curPage = Integer.parseInt(map.get("curPage").toString());
		
		Paging paging = new Paging(totalCount,curPage);
		
		paging.setName((String)map.get("name"));
		paging.setSearch((String)map.get("search"));
		
		return paging;
	}

	@Override
	public List<PensionRegisterApply> ApplygetList(Paging paging) {
		return adminDao.selectAll_apply(paging);
		
	}
	
	
	
	
	
	


		
}
	
	
	

	
	

