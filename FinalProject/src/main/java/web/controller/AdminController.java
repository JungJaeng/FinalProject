package web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import web.dto.Member;
import web.dto.PensionRegisterApply;
import web.service.face.AdminService;
import web.util.Paging;

@Controller
public class AdminController {

	// �α� ���̺귯�� ��ü
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);

	// ���� ��ü
	@Autowired
	AdminService adminService;

	// ȸ�����
	@RequestMapping(value = "/admin/member_list", method = RequestMethod.GET)
	public void MemberList(@RequestParam(defaultValue = "1") int curPage, String name, String search, Model model) {

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("curPage", curPage);
		map.put("name", name);
		map.put("search", search);

		logger.info(map.toString());

		Paging paging = adminService.getCurPage(map);
		model.addAttribute("paging", paging);

		List<Member> list = adminService.getList(paging);
		model.addAttribute("memberlist", list);
	}
	
	// ȸ������Ʈ üũ����
	@RequestMapping(value = "/admin/member_delete", method = RequestMethod.POST)
	public String memberDeleteList(
			String names) {
		
		if( !"".equals(names) && names != null) {
			adminService.memberListDelete(names);
		}
		
		return "redirect:/admin/member_list";
	}
	
	// ��ǿ�û���
	@RequestMapping(value = "/admin/apply_list", method = RequestMethod.GET)
	public void PensionCheckList(@RequestParam(defaultValue = "1") int curPage, String name, String search, Model model) {

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("curPage", curPage);
		map.put("name", name);
		map.put("search", search);

		logger.info(map.toString());

		Paging paging = adminService.ApplygetCurPage(map);
		model.addAttribute("paging", paging);

		List<PensionRegisterApply> list = adminService.ApplygetList(paging);
		model.addAttribute("applylist", list);
	}
	
	// ��ǿ�û��� �Խñ� Ȯ��
	@RequestMapping(value="/admin/apply_view", method=RequestMethod.GET)
	public String view( PensionRegisterApply viewApply
			, Model model
			, HttpSession session
			, Member member) {
		
		// �Խñ� ��ȣ�� 1���� ������ ������� ������
		if(viewApply.getApply_no() < 1) {
			return "redirect:/admin/apply_list";
		}
		
		session.setAttribute("login_id", member.getUser_id() );
		
		// �Խñ� �� ���� ����
		viewApply = adminService.applyView(viewApply);
		model.addAttribute("view", viewApply);	
	
		return "admin/apply_view";	
	}
}
