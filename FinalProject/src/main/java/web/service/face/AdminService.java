package web.service.face;

import java.util.List;
import java.util.Map;

import web.dto.Member;
import web.util.Paging;

public interface AdminService {
	
	
	public Paging getCurPage(Map<String,Object> map);
	

	public List<Member> getList(Paging paging);
	
	

	

}