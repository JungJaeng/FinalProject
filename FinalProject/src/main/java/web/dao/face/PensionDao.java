package web.dao.face;

import java.util.List;
import java.util.Map;

import web.dto.Pension;
import web.util.Paging;

public interface PensionDao {
	
	public int selectCntAll(Map<String, Object> map);
	
	public List<Pension> selectAll(Paging paging);

	public Pension selectPensionBypension_no(int pension_no);
}
