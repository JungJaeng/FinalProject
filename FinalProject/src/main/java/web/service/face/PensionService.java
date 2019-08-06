package web.service.face;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import org.springframework.web.multipart.MultipartFile;

import web.dto.Pension;
import web.dto.PensionComment;
import web.dto.PensionRegisterApply;
import web.dto.Upload_Image;
import web.util.Paging;

public interface PensionService {
	
	/**
	 *	���� ���댁�, 寃�����, 臾몄�μ�� ���λ��� ���댁� 泥�由�
	 * @param map
	 * @return Paging
	 */
	public Paging getCurPage(Map<String,Object> map);
	
	/**
	 *	���댁� �� 媛��� ���ν���� 由ъ�ㅽ�몃�� 諛�����
	 * @param paging 
	 * @return List<Board>
	 */	
	public List<Pension> getList(Paging paging);
	
	/**
	 * pension_no瑜� ���λ����� �대�� pension_no�� �대�뱁���� ���� 諛����� 
	 * @param pension_no
	 * @return Pension
	 */
	public Pension pensionView(int pension_no);
	
	/**
	 *	湲��곌린 泥�由�
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
	
	
	
	public Pension reserveView(Pension viewReserve);
	
	
	
	
}
