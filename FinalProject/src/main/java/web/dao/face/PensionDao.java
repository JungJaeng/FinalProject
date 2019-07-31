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
	
	public void updateHit(int pension_no);
	
	public void write(PensionRegisterApply pensionRegisterApply);
	
	public List<Comment> selectCommentBypension_no(Pension pension);
	
	public void insertComment(Comment comment);
	
	public void deleteComment(Comment comment);
	
	public int getApply_no();

	public void insertImage(Upload_Image upimage);

	public Upload_Image selectImgByfileno(Upload_Image pension_image);

	public void deleteCommentBypension_no(int pension_no);

	



}
