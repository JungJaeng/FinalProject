package web.dao.face;

import java.util.List;
import java.util.Map;

import web.dto.Member;
import web.dto.Pension;
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

	// ��ǿ�ûȮ�� VIEW
	public PensionRegisterApply selectApplyByapply_no(PensionRegisterApply viewApply);
	
	// ��ǿ�ûȮ�� �� �� �Խ�
	public void write(Pension pension);
	
}