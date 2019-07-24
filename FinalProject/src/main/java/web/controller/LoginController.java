package web.controller;


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

import web.dto.Filetest;
import web.dto.Login;
import web.service.face.LoginService;

@Controller
public class LoginController {

	//로그 라이브러리 객체
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	//서비스 객체
	@Autowired LoginService loginService;
	@Autowired ServletContext context;
	
	@RequestMapping(value="/login/main", method=RequestMethod.GET)
	public void main() { }
	
	@RequestMapping(value="/login/join", method=RequestMethod.GET)
	public void join() { }

	@RequestMapping(value="/login/join", method=RequestMethod.POST)
	public String joinProc(Login login) {
		
		loginService.join(login); //회원가입 처리
		
		return "redirect:/login/main"; //main페이지로 리다이렉트
	}

	@RequestMapping(value="/login/login", method=RequestMethod.GET)
	public void login() {
		logger.info("로그인 폼");
		
	}

	@RequestMapping(value="/login/login", method=RequestMethod.POST)
	public String loginProc(
			Login login, //로그인 정보 커맨드 객체
			HttpSession session//세션 객체
			) {
		logger.info("로그인 처리");
		logger.info(login.toString());
	
		String redirectUrl = null;
		if( loginService.login(login) ) {
			//로그인 성공
			login = loginService.info(login);
			//세션 정보 저장
			session.setAttribute("login", true);
			session.setAttribute("loginid", login.getId());
			session.setAttribute("loginnick", login.getNickname());
			logger.info("아이디출력:"+login.getId());
			//리다이렉트 URL 지정
			redirectUrl = "/login/main";
			
		} else {
			//로그인 실패
			
			//리다이렉트 URL 지정
			redirectUrl = "/login/login";

		}
		
		return "redirect:" + redirectUrl;
	}

	@RequestMapping(value="/login/mypage", method=RequestMethod.GET)
	public void mypage(
			HttpSession session, //세션 객체
			Model model, //모델 객체
			Login login, //메소드에서 사용할 Login 객체 선언
			Filetest filetest
			) {
		
		
		//세션에서 id정보 가져오기
		login.setId((String) session.getAttribute("loginid"));
		
		String loginid = (String) session.getAttribute("loginid");

		//id를 이용하여 전체 회원정보 가져오기
		login = loginService.info(login);
		
		//모델값으로 login객체 전달
		model.addAttribute("info", login);

		int n = 0;
		if( loginService.ImgCnt(loginid) > 0 ) {
			
			n=1;
			
			filetest = loginService.selectImg(loginid);
			logger.info(filetest.toString());
			model.addAttribute("fileup", filetest);
		} 
			
		model.addAttribute("n",n);
		
		
	}   
	

//	
//	@RequestMapping(value = "/login/file", method = RequestMethod.GET)
//	   public void fileupForm() {
//		   logger.info("파일 업로드 폼");
//		   
//	   }
//
//	@RequestMapping(value = "/login/file", method = RequestMethod.POST)
//	   public void fileupload(
//			@RequestParam(value="file") MultipartFile file
//			   ) {
//		   logger.info("파일 업로드 처리");
//		   logger.info("파일 : "+ file.getOriginalFilename());
//		 
////		   logger.info(context.getRealPath("upload"));
//		   
//		   loginService.filesave(file,context);
//		   
//	   }
//	

	
	
	
	
	
	

	@RequestMapping(value="/login/logout", method=RequestMethod.GET)
	public String logout(
			HttpSession session //세션 객체
			) {
		
		//세션 초기화
		session.invalidate();
		
		//메인 페이지로 리다이렉트
		return "redirect:/login/main";
	}
	
	
	@RequestMapping(value="/login/withdraw", method=RequestMethod.GET)
	public void withdraw(Model model,
						Login login,
						HttpSession session) { 
		
		login.setId((String) session.getAttribute("loginid"));
		
		login =loginService.info(login);
		
		model.addAttribute("info",login);
	}

	@RequestMapping(value="/login/withdraw", method=RequestMethod.POST)
	public String withdrawProc(HttpServletRequest req,
			Model model,
			Login login,
			HttpSession session
			
			) { 
		//세션에서 id정보 가져오기

		
		String id=(String)session.getAttribute("loginid");
		
		
		
		loginService.infoWithdraw(id);
		
		logger.info(id);
		
		session.invalidate();
		return "redirect:/login/main";
		
	}
	
	@RequestMapping(value="/login/infochange", method=RequestMethod.GET)
	public void infochange(HttpSession session,
							Model model,
							Filetest filetest
			) {
		Login login = new Login();
		
		login.setId((String) session.getAttribute("loginid"));

		String loginid = (String) session.getAttribute("loginid");
		
		login = loginService.info(login);
		
		model.addAttribute("login", login);
		
		logger.info("내 정보변경페이지");
		
		int n = 0;
		if( loginService.ImgCnt(loginid) > 0 ) {
			
			n=1;
			
			filetest = loginService.selectImg(loginid);
			logger.info(filetest.toString());
			model.addAttribute("fileup", filetest);
		} 
			
		model.addAttribute("n",n);
		
	}	
		
		// id로 로그인 정보 가져오기
		
	@RequestMapping(value="/login/infochange", method=RequestMethod.POST)
	public String infochangeProc(Login login,
			@RequestParam(value="file") MultipartFile file, 
			HttpSession session)
			 { 
		
		String userid = (String) session.getAttribute("loginid");
		logger.info(userid);
		
		
		loginService.filesave(file, context, userid);
		
		
			
		loginService.update(login);
		
		return "redirect:/login/main";

	}	
		
		
	}

