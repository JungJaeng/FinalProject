package web.controller;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class MainController {

	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@RequestMapping(value="/main", method=RequestMethod.GET)
	public void main() { logger.info("메인 페이지"); 
	}
	
	@RequestMapping(value="/search", method=RequestMethod.GET)
	public String search() {
		logger.info("검색결과"); 
		
		return "redirect:/search";
		
	}
}
