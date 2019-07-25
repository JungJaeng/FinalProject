package web.service.face;

import java.util.List;
import java.util.Map;

import web.dto.Board;
import web.dto.Member;
import web.dto.Pension;
import web.dto.PensionRegisterApply;
import web.util.Paging;

public interface PensionService {
	
	public Paging getCurPage(Map<String,Object> map);
	
	public List<Pension> getList(Paging paging);
	
	public void write(PensionRegisterApply pensionRegisterApply);
}
