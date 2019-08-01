package web.service.face;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import org.springframework.web.multipart.MultipartFile;

import web.dto.Board;
import web.dto.Comment;
import web.dto.Member;
import web.dto.Pension;
import web.dto.PensionComment;
import web.dto.PensionRegisterApply;
import web.dto.Upload_Image;
import web.util.Paging;

public interface PensionService {
	
	/**
	 *	현재 페이지, 검색어, 문장을 입력받아 페이징 처리
	 * @param map
	 * @return Paging
	 */
	public Paging getCurPage(Map<String,Object> map);
	
	/**
	 *	페이징 된 값을 입력하여 리스트를 받아옴
	 * @param paging 
	 * @return List<Board>
	 */	
	public List<Pension> getList(Paging paging);
	
	/**
	 * pension_no를 입력받아서 해당 pension_no에 해당하는 행을 받아옴 
	 * @param pension_no
	 * @return Pension
	 */
	public Pension pensionView(int pension_no);
	
	/**
	 *	글쓰기 처리
	 * @param pensionRegisterApply
	 */
	public void write(PensionRegisterApply pensionRegisterApply);
	
	public void delete(Pension pension);

	public Upload_Image imgsave(Upload_Image board_image, MultipartFile file, ServletContext context);

	public Upload_Image FindImage(Upload_Image pension_image);

	public File findFile(Upload_Image pension_image, ServletContext context);
	
	public void insertComment(PensionComment pensionComment);
	
	public List getCommentList(Pension pension);
	
	public boolean deleteComment(PensionComment pensionComment);
	
	
	
	public Pension reserveView(int pension_no);
	
	
}
