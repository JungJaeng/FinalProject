package web.service.face;

import java.util.List;
import java.util.Map;

import web.dto.TripSpot;
import web.util.Paging;

public interface TripspotService {

	public Paging getCurPage(Map<String, Object> map);

	public List<TripSpot> getList(Paging paging);

	public void hitview(int board_no);

	public TripSpot view(int board_no);

	public void write(TripSpot tripspot, String images);

}
