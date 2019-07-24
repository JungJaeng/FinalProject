package web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import web.dto.Member;
import web.service.face.AdminService;
import web.util.Paging;

@Controller
public class AdminController {
	
	// �α� ���̺귯�� ��ü
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	// ���� ��ü
	@Autowired AdminService adminService;
	
	
	// ȸ�����
	@RequestMapping(value="/admin/member_list", method = RequestMethod.GET)
	public void BoardList(
			@RequestParam(defaultValue="1")int curPage,String name,String search,Model model) {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("curPage",curPage);
		map.put("name",name);
		map.put("search",search);
		
		logger.info(map.toString());
		
		Paging paging = adminService.getCurPage(map);
		model.addAttribute("paging",paging);
		
		List<Member> list = adminService.getList(paging);
		model.addAttribute("memberlist",list);
	}
	
	
	
	@RequestMapping(value="/admin/member_delete", method = RequestMethod.POST)
	public void delete() {}
	
	
	// ȸ������ �󼼺���
	@RequestMapping(value="/admin/member_view", method=RequestMethod.GET)
	public void memberView() {}
	

	
	
	
	
	

}