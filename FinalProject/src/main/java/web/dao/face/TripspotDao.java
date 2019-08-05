package web.dao.face;

import java.util.List;
import java.util.Map;

import web.dto.TripSpot;
import web.dto.Upload_Image;
import web.util.Paging;

public interface TripspotDao {

	public int selectCntAll(Map<String, Object> map);

	public List<TripSpot> selectAll(Paging paging);

	public void updateHit(int board_no);

	public TripSpot selectTripspotByboard_no(int board_no);

	public void insert(TripSpot tripspot);

	public void insertImage(Upload_Image upimage);

	public Upload_Image selectImgbyfileno(Upload_Image tripspot_image);

	public void updateImages(Map<String, Object> map);

	public void update(TripSpot tripspot);

	public void deletetripspotByBoard_no(int board_no);

}
