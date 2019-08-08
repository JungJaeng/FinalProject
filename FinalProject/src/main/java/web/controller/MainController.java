package web.controller;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import web.service.face.ChattingService;


@Controller
public class MainController {

	@Autowired ChattingService chattingService;
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@RequestMapping(value="/main", method=RequestMethod.GET)
	public void main() { logger.info("메인 페이지"); 
	}
	
	@RequestMapping(value="/main", method=RequestMethod.POST)
	public String search(
			Model model,
			int id,  // contentId
			int typeid // contentTypeId
			) {
		
		logger.info("contentId : "+id);
		logger.info("contentTypeId : "+typeid);
		
		model.addAttribute("contentId", id);
		model.addAttribute("contentTypeId", typeid);
		logger.info("검색결과"); 

		return "/search";
	}
	@RequestMapping(value = "/map", method = RequestMethod.POST)
	public String map(Model model,
			double mapx,
			double mapy) {
		
		logger.info("mapx:"+ mapx);
		logger.info("mapy:"+ mapy);
	
		model.addAttribute("mapx", mapx);
		model.addAttribute("mapy", mapy);
		
		
		return "/map";
	}
	
}
