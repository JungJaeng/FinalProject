package web.service.face;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import org.springframework.web.multipart.MultipartFile;

import web.dto.Board;
import web.dto.Member;
import web.dto.Pension;
import web.dto.PensionRegisterApply;
import web.dto.Upload_Image;
import web.util.Paging;

public interface PensionService {
	
	public Paging getCurPage(Map<String,Object> map);
	
	public List<Pension> getList(Paging paging);
	
	public void write(PensionRegisterApply pensionRegisterApply);

	public Upload_Image imgsave(Upload_Image board_image, MultipartFile file, ServletContext context);

	public Upload_Image FindImage(Upload_Image pension_image);

	public File findFile(Upload_Image pension_image, ServletContext context);
}
