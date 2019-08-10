package web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import web.dto.Board;
import web.dto.Filetest;
import web.dto.Member;
import web.service.face.MypageService;
import web.util.Paging;

@Controller
public class MypageController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	
	@Autowired MypageService mypageService;
	@Autowired ServletContext context;
	
	
	
	@RequestMapping(value="/mypage/mypage", method=RequestMethod.GET)
	public String mypage(
			HttpSession session, //세션 객체
			Model model, //모델 객체
			Member member, //메소드에서 사용할 Login 객체 선언
			Filetest filetest
			) {
		
		if((String) session.getAttribute("login_id") == null) { return "redirect:/main";}
		//세션에서 id정보 가져오기
		String loginid = (String) session.getAttribute("login_id");
		member.setUser_id(loginid);
		
		//id를 이용하여 전체 회원정보 가져오기
		member = mypageService.info(member);
		
		//모델값으로 login객체 전달
		model.addAttribute("info", member);

		int n = 0;
		if( mypageService.ImgCnt(loginid) > 0 ) {
			
			n=1;
			
			filetest = mypageService.selectImg(loginid);
			logger.info(filetest.toString());
			model.addAttribute("fileup", filetest);
		} 
			
		model.addAttribute("n",n);
		return "mypage/mypage";
	}
	
	
	@RequestMapping(value="/mypage/withdraw", method=RequestMethod.GET)
	public void withdraw(Model model,
						Member member,
						HttpSession session) { 
		
		member.setUser_id((String) session.getAttribute("login_id"));
		
		member =mypageService.info(member);
		
		model.addAttribute("info",member);
	}

	@RequestMapping(value="/mypage/withdraw", method=RequestMethod.POST)
	public String withdrawProc(HttpServletRequest req,
			Model model,
			Member member,
			HttpSession session
			
			) { 
		//세션에서 id정보 가져오기

		
		String id=(String)session.getAttribute("login_id");
		
		
		
		mypageService.infoWithdraw(id);
		
		logger.info(id);
		
		session.invalidate();
		return "redirect:/main";
		
	}
	
	@RequestMapping(value="/mypage/infochange", method=RequestMethod.GET)
	public void infochange(HttpSession session,
							Model model,
							Filetest filetest
			) {
		
		

		String loginid = (String) session.getAttribute("login_id");
		
		Member member = new Member();
		member.setUser_id(loginid);
		
		member = mypageService.info(member);
		
		model.addAttribute("login", member);
		
//		logger.info("hhhhhhhhhhhhhhhhh"+member.toString());
		logger.info("내 정보변경페이지");
		
		logger.info("로그인된 아이디: "+loginid);
		
		int n = 0;
		if( mypageService.ImgCnt(loginid) > 0 ) {
			
			n=1;
			
			filetest = mypageService.selectImg(loginid);
			logger.info(filetest.toString());
			model.addAttribute("fileup", filetest);
		} 
			
		model.addAttribute("n",n);
		
//		boolean result = mypageService.checkpw(member.getUser_id(),member.getUser_pw());
//		if(result) {
//			return "mypage/mypage";
//		} else {
//			
//			model.addAttribute("message","비밀번호 불일치");
//			return "mypage/infochange";
		}
		
		
//	}	
	
		// id로 로그인 정보 가져오기
		
	@RequestMapping(value="/mypage/infochange", method=RequestMethod.POST)
	public String infochangeProc(Member member,
			@RequestParam(value="file") MultipartFile file, 
			HttpSession session)
			 { 
		
		String userid = (String) session.getAttribute("login_id");
		
		

		
		logger.info(userid);
		
		
		mypageService.filesave(file, context, userid);
		
		
		
//		logger.info("hhhhhhhhhhhhhhhhh"+member.toString());
		mypageService.update(member);
		
		
		return "redirect:/main";

	}	
	
	@RequestMapping(value = "/mypage/community", method = RequestMethod.GET)
	public void MyBoardList(
			@RequestParam(defaultValue="1")int curPage,HttpSession session,Model model,String loginid) {
		Map<String,Object> map =  new HashMap<String,Object>();
		map.put("curPage",curPage);
		String writer_id = (String)session.getAttribute("login_id");
		map.put("writer_id",writer_id);
		logger.info(map.toString());
		
		Paging paging = mypageService.getCurPage(map);
		model.addAttribute("paging",paging);
		
		map = new HashMap<String,Object>();
		
		map.put("paging",paging);
		map.put("writer_id",writer_id);
		
		List<Board> list = mypageService.getList(map);
		model.addAttribute("myboardlist",list);
		
	}
	
	
}
