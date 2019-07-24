package web.service.face;

import java.util.List;
import java.util.Map;

import web.dto.Member;
import web.dto.PensionRegisterApply;
import web.util.Paging;

public interface AdminService {
	
	// ȸ�� ����
	public Paging getCurPage(Map<String,Object> map);
	
	public List<Member> getList(Paging paging);
		
	public void memberListDelete(String names);
	
	// ��ǿ�û Ȯ��
	public Paging ApplygetCurPage(Map<String,Object> map);
	
	public List<PensionRegisterApply> ApplygetList(Paging paging);

}