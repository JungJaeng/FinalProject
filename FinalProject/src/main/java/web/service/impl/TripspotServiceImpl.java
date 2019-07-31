package web.service.impl;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.TripspotDao;
import web.dto.Board;
import web.dto.TripSpot;
import web.service.face.TripspotService;
import web.util.Paging;

@Service
public class TripspotServiceImpl implements TripspotService{
	private static final Logger logger = LoggerFactory.getLogger(TripspotServiceImpl.class);
	@Autowired TripspotDao tripspotDao;
	@Override
	public Paging getCurPage(Map<String, Object> map) {
		int totalCount = tripspotDao.selectCntAll(map);
		int curPage = Integer.parseInt(map.get("curPage").toString());
		int listCount = 6;
		Paging paging = new Paging(totalCount,curPage,listCount);
		
		paging.setName((String)map.get("name"));
		paging.setSearch((String)map.get("search"));
		
		return paging;
	}
	@Override
	public List<TripSpot> getList(Paging paging) {
		return tripspotDao.selectAll(paging);
	}
	@Override
	public void hitview(int board_no) {
		tripspotDao.updateHit(board_no);
	}
	@Override
	public TripSpot view(int board_no) {
		return tripspotDao.selectTripspotByboard_no(board_no);
	}
	@Override
	public void write(TripSpot tripspot, String images) {
		tripspotDao.insert(tripspot);
	}

}
