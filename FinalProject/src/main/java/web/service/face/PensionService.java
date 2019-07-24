package web.service.face;

import java.util.List;
import java.util.Map;

import web.dto.Board;
import web.dto.Pension;
import web.util.Paging;

public interface PensionService {
	
	
	public Paging getCurPage(Map<String,Object> map);
	
	public List<Pension> getList(Paging paging);

}
