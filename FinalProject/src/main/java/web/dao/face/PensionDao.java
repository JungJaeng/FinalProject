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
	 * 코멘트 SELECT
	 *  코멘트 번호를 rnum을 통해 같이 조회한다
	 *  
	 * @param board
	 * @return
	 */
	public List selectComment(Board board);
	
	/**
	 * 코멘트 INSERT
	 *  
	 * @param comment
	 */
	public void insertComment(Comment comment);

	/**
	 * 댓글 삭제하기
	 *  
	 * @param comment
	 */
	public void deleteComment(Comment comment);

	// 댓글 카운트 - 댓글 존재 여부 확인 
	public int countComment(Comment comment);

	public void insertImage(Upload_Image upimage);

	public int getApply_no();

	public Upload_Image selectImgByfileno(Upload_Image pension_image);
}
