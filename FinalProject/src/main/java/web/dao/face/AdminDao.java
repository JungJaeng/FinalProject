package web.dao.face;

import java.util.List;
import java.util.Map;

import web.dto.Member;
import web.dto.PensionRegisterApply;
import web.util.Paging;

public interface AdminDao {
	
	// ȸ�� ����
	public int selectCntAll(Map<String, Object> map);
	
	public List<Member> selectAll(Paging paging);

	public Member selectUserByuser_no(int user_no);
	
	public void deleteMemberList(String names);

	
	// ��ǿ�ûȮ��
	public int selectCntAll_apply(Map<String, Object> map);
	
	public List<PensionRegisterApply> selectAll_apply(Paging paging);

	public Member selectApplyByapply_no(int apply_no);
	
	
}