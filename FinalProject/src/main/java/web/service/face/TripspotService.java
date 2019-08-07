package web.service.face;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import org.springframework.web.multipart.MultipartFile;

import web.dto.Recommend;
import web.dto.TripSpot;
import web.dto.Upload_Image;
import web.util.Paging;

public interface TripspotService {

	public Paging getCurPage(Map<String, Object> map);

	public List<TripSpot> getList(Paging paging);

	public void hitview(int board_no);

	public TripSpot view(int board_no);

	public void write(TripSpot tripspot, String images);

	public Upload_Image imgsave(Upload_Image tripspot_image, MultipartFile fileupload, ServletContext context);

	public Upload_Image FindImage(Upload_Image tripspot_image);

	public File findFile(Upload_Image tripspot_image, ServletContext context);

	public void update(TripSpot tripspot, String images);

	public void delete(int board_no);

	public String recommend(Recommend recommend);

	public int cntRecommend(Recommend recommend);
	
	

}
