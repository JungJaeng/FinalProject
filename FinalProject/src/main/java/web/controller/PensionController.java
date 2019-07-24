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

import web.dto.Pension;
import web.service.face.PensionService;
import web.util.Paging;

@Controller
public class PensionController {

	private static final Logger logger = LoggerFactory.getLogger(PensionController.class);
	
	@Autowired PensionService pensionService;
	
	@RequestMapping(value = "/pension/list", method = RequestMethod.GET)
	public void BoardList(
			@RequestParam(defaultValue="1")int curPage,
			Model model) {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("curPage",curPage);
		
		logger.info(map.toString());
		
		Paging paging = pensionService.getCurPage(map);
		model.addAttribute("paging",paging);
		
		List<Pension> list = pensionService.getList(paging);
		model.addAttribute("pensionlist",list);
	}
	
	
	
//	@RequestMapping(value="/pension/list", method=RequestMethod.GET)
//	public ModelAndView list(
//			ModelAndView mav
//			) {
//		mav.setViewName("/pension/list");
//		mav.addObject("list", pensionService.listPension());
//		
//		return mav;
//	}
}
