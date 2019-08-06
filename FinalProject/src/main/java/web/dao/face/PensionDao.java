package web.dao.face;

import java.util.List;
import java.util.Map;

import web.dto.Pension;
import web.dto.PensionComment;
import web.dto.PensionRegisterApply;
import web.dto.Upload_Image;
import web.util.Paging;

public interface PensionDao {
	
	public int selectCntAll(Map<String, Object> map);
	
	public List<Pension> selectAll(Paging paging);

	public Pension selectPensionBypension_no(int pension_no);
	
	public void updateHit(int pension_no);
	
	public void delete(Pension pension);
	
	public void write(PensionRegisterApply pensionRegisterApply);
		
	public int getApply_no();

	public void insertImage(Upload_Image upimage);

	public Upload_Image selectImgByfileno(Upload_Image pension_image);

	public List selectComment(Pension pension);
	
	public void insertComment(PensionComment pensionComment);

	public void deleteComment(PensionComment pensionComment);
	
	public int countComment(PensionComment pensionComment);
	
	/**
	 * 	����
	 * @param pension_no
	 * @return 
	 */
	public Pension selectPensionByreserveNo(Pension viewReserve);
	

}
