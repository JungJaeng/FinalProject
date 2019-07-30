package web.controller;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import web.service.face.TripspotService;
import web.util.Paging;

@Controller
public class TripspotController {
	private static final Logger logger = LoggerFactory.getLogger(TripspotController.class);
	@Autowired TripspotService tripspotService;
	
	@RequestMapping(value = "/tripspot/list", method = RequestMethod.GET)
	public void TripspotList(@RequestParam(defaultValue="1")int curPage,
			@RequestParam(name="region",defaultValue="")String name,
			@RequestParam(name="region_detail",defaultValue="")String search,
			Model model) {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("curPage",curPage);
		map.put("name",name);
		map.put("search",search);
		
		logger.info(map.toString());
		Paging paging = tripspotService.getCurPage(map);
		model.addAttribute("paging",paging);
		
	}
	
}
