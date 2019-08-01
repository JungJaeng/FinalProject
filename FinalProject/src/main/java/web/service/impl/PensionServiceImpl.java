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
import web.dto.PensionComment;
import web.dto.PensionRegisterApply;
import web.dto.Upload_Image;
import web.service.face.PensionService;
import web.util.Paging;

@Service
public class PensionServiceImpl implements PensionService {

	@Autowired PensionDao pensionDao;
	
	// �α� ���̺귯�� ��ü
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
	      
	      //����� ������ �̸�(�����̸�+UUID)
	      String name=file.getOriginalFilename()+"_"+uId;
	      
	      
	      //����� ���� ��ü
	      File dest = new File(storedPath,name);
	      
	      //���� ����
	      try {
	         file.transferTo(dest); //���� ����
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

	@Override
	public void insertComment(PensionComment pensionComment) {
		pensionDao.insertComment(pensionComment);
		
	}

	@Override
	public List getCommentList(Pension pension) {
		return pensionDao.selectComment(pension);
		
	}

	@Override
	public boolean deleteComment(PensionComment pensionComment) {
		pensionDao.deleteComment(pensionComment); 
		
		if( pensionDao.countComment(pensionComment) > 0 ) {
			return false;
		} else {
			return true;
		}
	}

	@Override
	public void delete(Pension pension) {
		pensionDao.delete(pension);
		
	}

	@Override
	public Pension reserveView(int pension_no) {
		
		return pensionDao.reserve(pension_no);
	}


	
	


	
}
