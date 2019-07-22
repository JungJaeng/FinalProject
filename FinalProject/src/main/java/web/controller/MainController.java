package web.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import web.dto.Sightseeing;
import web.service.face.MainService;

@Controller
public class MainController {

	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@Autowired MainService mainService;
	
	@RequestMapping(value="/main", method=RequestMethod.GET)
	public void main() { logger.info("메인 페이지"); }
	
	@RequestMapping(value="/main/search", method=RequestMethod.POST)
	public String search(
			Sightseeing sightseeing,
			@RequestParam(value="cat1", required=false,defaultValue = "") String cat1,
			@RequestParam(value="cat2", required=false,defaultValue = "") String cat2,
			@RequestParam(value="cat3", required=false,defaultValue = "") String cat3,
			@RequestParam(value="areacode",required=false ,defaultValue ="") String areacode,
			@RequestParam(value="sigungucode",required=false, defaultValue="") String sigungucode,
			@RequestParam(value="keyword") String keyword
			
			) {
		logger.info("검색결과");
		
		sightseeing.setCat1(cat1);
		sightseeing.setAreacode(areacode);
		sightseeing.setSigungucode(sigungucode);
		sightseeing.setKeyword(keyword);
		
		logger.info(sightseeing.toString());
		
		
		return "main";
	}
}
