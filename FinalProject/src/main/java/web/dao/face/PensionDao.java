package web.dao.face;

import java.util.List;
import java.util.Map;

import web.dto.Board;
import web.dto.Comment;
import web.dto.Pension;
import web.dto.PensionRegisterApply;
import web.dto.Upload_Image;
import web.util.Paging;

public interface PensionDao {
	
	public int selectCntAll(Map<String, Object> map);
	
	public List<Pension> selectAll(Paging paging);

	public Pension selectPensionBypension_no(int pension_no);
	
	public void write(PensionRegisterApply pensionRegisterApply);
	
	
	
	
	
	/**
	 * �ڸ�Ʈ SELECT
	 *  �ڸ�Ʈ ��ȣ�� rnum�� ���� ���� ��ȸ�Ѵ�
	 *  
	 * @param board
	 * @return
	 */
	public List selectComment(Board board);
	
	/**
	 * �ڸ�Ʈ INSERT
	 *  
	 * @param comment
	 */
	public void insertComment(Comment comment);

	/**
	 * ��� �����ϱ�
	 *  
	 * @param comment
	 */
	public void deleteComment(Comment comment);

	// ��� ī��Ʈ - ��� ���� ���� Ȯ�� 
	public int countComment(Comment comment);

	public void insertImage(Upload_Image upimage);

	public int getApply_no();

	public Upload_Image selectImgByfileno(Upload_Image pension_image);
}
