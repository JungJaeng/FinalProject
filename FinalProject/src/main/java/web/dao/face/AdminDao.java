package web.dao.face;

import java.util.List;
import java.util.Map;

import web.dto.Member;
import web.util.Paging;

public interface AdminDao {
	

	

	public int selectCntAll(Map<String, Object> map);
	

	public List<Member> selectAll(Paging paging);


	public Member selectUserByuser_no(int user_no);

	
	
	
}