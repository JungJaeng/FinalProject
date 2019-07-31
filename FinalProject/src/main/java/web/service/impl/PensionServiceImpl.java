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

import web.controller.AdminController;
import web.dao.face.PensionDao;
import web.dto.Pension;
import web.dto.PensionRegisterApply;
import web.dto.Upload_Image;
import web.service.face.PensionService;
import web.util.Paging;

@Service
public class PensionServiceImpl implements PensionService {

	@Autowired PensionDao pensionDao;
	
	// 로그 라이브러리 객체
	private static final Logger logger = LoggerFactory.getLogger(PensionServiceImpl.class);

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
	public Pension pensionView(int pension_no) {
		
		return pensionDao.selectPensionBypension_no(pension_no);
	}

	@Override
	public List<Pension> getList(Paging paging) {
		return pensionDao.selectAll(paging);
	}

	@Override
	public void write(PensionRegisterApply pensionRegisterApply) {
		pensionDao.write(pensionRegisterApply);
		
	}

	@Override
	public Upload_Image imgsave(Upload_Image pension_image, MultipartFile file, ServletContext context) {
		String storedPath = context.getRealPath("WEB-INF/upload");
	      String uId = UUID.randomUUID().toString().split("-")[4];
	      
	      //저장될 파일의 이름(원본이름+UUID)
	      String name=file.getOriginalFilename()+"_"+uId;
	      
	      
	      //저장될 파일 객체
	      File dest = new File(storedPath,name);
	      
	      //파일 저장
	      try {
	         file.transferTo(dest); //실제 저장
	      } catch (IllegalStateException e) {
	         e.printStackTrace();
	      } catch (IOException e) {
	         e.printStackTrace();
	      }
	      Upload_Image upimage = new Upload_Image();
	      if(pension_image.getBoard_no() == 0) {
	         upimage.setBoard_no(pensionDao.getApply_no());
	      }else {
	         upimage.setBoard_no(pension_image.getBoard_no());
	      }
	      upimage.setOrigin_name(file.getOriginalFilename());
	      upimage.setStored_name(name);
	      upimage.setFilesize((int)file.getSize());
	      
	      
	      pensionDao.insertImage(upimage);
	      logger.info(upimage.toString());
	      return upimage;		
	}

	@Override
	public Upload_Image FindImage(Upload_Image pension_image) {
		
		return pensionDao.selectImgByfileno(pension_image);
	}

	@Override
	public File findFile(Upload_Image pension_image, ServletContext context) {
		File file = new File(
	    context.getRealPath("WEB-INF/upload"), pension_image.getStored_name());
	      return file;
	}	
	
	


	
}
