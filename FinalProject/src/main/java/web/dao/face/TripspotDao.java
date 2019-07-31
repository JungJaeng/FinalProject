package web.dao.face;

import java.util.List;
import java.util.Map;

import web.dto.TripSpot;
import web.util.Paging;

public interface TripspotDao {

	public int selectCntAll(Map<String, Object> map);

	public List<TripSpot> selectAll(Paging paging);

	public void updateHit(int board_no);

	public TripSpot selectTripspotByboard_no(int board_no);

	public void insert(TripSpot tripspot);

}
