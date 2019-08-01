package web.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import web.dao.face.TripspotDao;
import web.dto.Board;
import web.dto.TripSpot;
import web.dto.Upload_Image;
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
	@Override
	public Upload_Image imgsave(Upload_Image tripspot_image, MultipartFile fileupload, ServletContext context) {
		String storedPath = context.getRealPath("WEB-INF/upload");
		String uId = UUID.randomUUID().toString().split("-")[4];
		
		//저장될 파일의 이름(원본이름+UUID)
		String name=fileupload.getOriginalFilename()+"_"+uId;
		
		//저장될 파일 객체
		File dest = new File(storedPath,name);
		
		//파일 저장
		try {
			fileupload.transferTo(dest); //실제 저장
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		Upload_Image upimage = new Upload_Image();
		upimage.setOrigin_name(fileupload.getOriginalFilename());
		upimage.setStored_name(name);
		upimage.setFilesize((int)fileupload.getSize());
		
		tripspotDao.insertImage(upimage);
		
		return upimage;
	}
	@Override
	public Upload_Image FindImage(Upload_Image tripspot_image) {
		return tripspotDao.selectImgbyfileno(tripspot_image);
	}
	@Override
	public File findFile(Upload_Image tripspot_image, ServletContext context) {
		File file = new File(
				context.getRealPath("WEB-INF/upload"),tripspot_image.getStored_name());
		return file;
	}

}
