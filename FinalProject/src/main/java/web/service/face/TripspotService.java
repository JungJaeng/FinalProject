package web.service.face;

import java.util.Map;

import web.util.Paging;

public interface TripspotService {

	Paging getCurPage(Map<String, Object> map);

}
