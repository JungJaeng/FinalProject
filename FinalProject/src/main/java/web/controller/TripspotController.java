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

import web.dto.Board;
import web.dto.TripSpot;
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
		List<TripSpot> list = tripspotService.getList(paging);
		model.addAttribute("tripspotlist",list);

	}@RequestMapping(value = "/tripspot/view", method = RequestMethod.GET)
	public void View(
			@RequestParam int board_no,
			Model model) {
		
		tripspotService.hitview(board_no);
		TripSpot viewtripspot = tripspotService.view(board_no);
		model.addAttribute("tripspot",viewtripspot);
		
//		List<Comment> list = boardService.commentView(board_no);
//		model.addAttribute("commentlist",list);
	}
	@RequestMapping(value = "/tripspot/write", method = RequestMethod.GET)
	public String WritePage(HttpSession session, Model model) {
		
		if((String)session.getAttribute("loginid") == null 
			&& (String)session.getAttribute("loginnick") == null) {
			return "redirect:/tripspot/list";
		}
		TripSpot tripspot = new TripSpot();
		tripspot.setWriter_id((String)session.getAttribute("loginid"));
		tripspot.setWriter_nick((String)session.getAttribute("loginnick"));
		model.addAttribute("board", tripspot);
		return "board/write";
	}
	@RequestMapping(value = "/tripspot/write", method = RequestMethod.POST)
	public String Write(TripSpot tripspot,String images) {
		
		tripspotService.write(tripspot,images);
		return "redirect:/board/list";
	}
	
	
}
