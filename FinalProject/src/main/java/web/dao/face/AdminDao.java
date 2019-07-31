package web.dao.face;

import java.util.List;
import java.util.Map;

import web.dto.Member;
import web.dto.Pension;
import web.dto.PensionRegisterApply;
import web.util.Paging;

public interface AdminDao {
	
	// 회원 관리
	public int selectCntAll(Map<String, Object> map);
	
	public List<Member> selectAll(Paging paging);

	public Member selectUserByuser_no(int user_no);
	
	public void deleteMemberList(String names);

	
	// 펜션요청확인
	public int selectCntAll_apply(Map<String, Object> map);
	
	public List<PensionRegisterApply> selectAll_apply(Paging paging);

	// 펜션요청확인 VIEW
	public PensionRegisterApply selectApplyByapply_no(PensionRegisterApply viewApply);
	
	// 펜션요청확인 후 글 게시
	public void write(Pension pension);
	
}