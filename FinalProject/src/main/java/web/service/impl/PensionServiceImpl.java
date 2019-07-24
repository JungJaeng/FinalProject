package web.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.PensionDao;
import web.dto.Member;
import web.dto.Pension;
import web.service.face.PensionService;
import web.util.Paging;

@Service
public class PensionServiceImpl implements PensionService {

	@Autowired PensionDao pensionDao;

	@Override
	public Paging getCurPage(Map<String, Object> map) {

		int totalCount = pensionDao.selectCntAll(map);
		int curPage = Integer.parseInt(map.get("curPage").toString());
		
		Paging paging = new Paging(totalCount,curPage);
		
		paging.setName((String)map.get("name"));
		paging.setSearch((String)map.get("search"));
		
		return paging;
	}

	@Override
	public List<Pension> getList(Paging paging) {
		return pensionDao.selectAll(paging);
	}	
	


	
}
