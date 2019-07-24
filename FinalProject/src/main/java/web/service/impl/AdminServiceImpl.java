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
	
	// �α� ���̺귯�� ��ü
	private static final Logger logger = LoggerFactory.getLogger(AdminServiceImpl.class);
	
	// ������������ - ȸ������ ������
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
	
	// ����Ʈ���� ȸ������
	@Override
	public void memberListDelete(String names) {
		adminDao.deleteMemberList(names);
//		logger.info(names);
		
	}

	// �漱��ûȮ�� ������
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
	
	
	

	
	

