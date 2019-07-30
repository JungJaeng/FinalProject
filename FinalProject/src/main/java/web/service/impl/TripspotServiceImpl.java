package web.service.impl;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import web.dao.face.TripspotDao;
import web.service.face.TripspotService;
import web.util.Paging;

public class TripspotServiceImpl implements TripspotService{
	private static final Logger logger = LoggerFactory.getLogger(TripspotServiceImpl.class);
	@Autowired TripspotDao tripspotDao;
	@Override
	public Paging getCurPage(Map<String, Object> map) {
		int totalCount = tripspotDao.selectCntAll(map);
		return null;
	}

}
