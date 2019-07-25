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

import web.dto.Pension;
import web.dto.PensionRegisterApply;
import web.service.face.PensionService;
import web.util.Paging;

@Controller
public class PensionController {
	
	@Autowired PensionService pensionService;
	
	// �α� ���̺귯�� ��ü
	private static final Logger logger = LoggerFactory.getLogger(PensionController.class);
	
	// ��� ���
	@RequestMapping(value = "/pension/list", method = RequestMethod.GET)
	public void MemberList(@RequestParam(defaultValue = "1") int curPage, String name, String search, Model model) {

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("curPage", curPage);
		map.put("name", name);
		map.put("search", search);

		logger.info(map.toString());

		Paging paging = pensionService.getCurPage(map);
		model.addAttribute("paging", paging);

		List<Pension> list = pensionService.getList(paging);
		model.addAttribute("pensionlist", list);
	}
	
//	@RequestMapping(value="/pension/room_view"
//			, method=RequestMethod.GET)
//	public String view( Pension viewPension
//			, Model model
//			, HttpSession session) {
//		
//		// �Խñ� ��ȣ�� 1���� ������ ������� ������
//		if(viewPension.getPension_no() < 1) {
//			return "redirect:/pension/list";
//		}
//		
//		// ��� �� ���� ����
//		viewPension = pensionService.pensionView(viewPension);
//		model.addAttribute("view", viewPension);
//		
//		// ��� ����
//		Comment comment = new Comment();
//		List<Comment> commentList = pensionService.getCommentList(viewPension);
//		model.addAttribute("commentList", commentList);
//		
//		return "pension/room_view";
//	}	
	
	// ��ǵ�Ͽ�û �۾���
	@RequestMapping(value="/pension/register_apply"
			, method=RequestMethod.GET)
	public void write() { }

	@RequestMapping(value="/pension/register_apply"
			, method=RequestMethod.POST)
	public String writeProcess(PensionRegisterApply pensionRegisterApply,
			HttpSession session) {
				
		pensionService.write(pensionRegisterApply);
		
		return "redirect:/pension/list";
	}	
}	
	
















