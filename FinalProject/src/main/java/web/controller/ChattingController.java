package web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import web.dto.Chatting;
import web.service.face.ChattingService;

@Controller
public class ChattingController {

	@Autowired ChattingService chattingService;
	
	@RequestMapping(value="/chatting", method= RequestMethod.POST)
	public @ResponseBody List<Chatting> chatting() {
		
		List<Chatting> memberlist = chattingService.getmemberAll();
		
		return memberlist;
	}
	@RequestMapping(value = "/chatting", method = RequestMethod.GET)
	public void chat(Model model, Chatting chatting) {
		
		List<Chatting> memberlist = chattingService.getmemberAll();
		model.addAttribute("memberlist",memberlist);
		
		List<Chatting> chatlist = chattingService.getchatAll();
		model.addAttribute("chatlist",chatlist);
		
//		logger.info("memberlist:"+memberlist);
//		logger.info("chatlist:"+chatlist);
		
	}
	
}
