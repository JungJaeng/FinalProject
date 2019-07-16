package web.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import web.dto.Login;
import web.service.face.LoginService;

@Controller
public class LoginController {

	//로그 라이브러리 객체
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	//서비스 객체
	@Autowired LoginService loginService;
	
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
			Login login //메소드에서 사용할 Login 객체 선언
			) {
		
		//세션에서 id정보 가져오기
		login.setId((String) session.getAttribute("loginid"));
		
		//id를 이용하여 전체 회원정보 가져오기
		login = loginService.info(login);
		
		//모델값으로 login객체 전달
		model.addAttribute("info", login);
		
	}

	@RequestMapping(value="/login/logout", method=RequestMethod.GET)
	public String logout(
			HttpSession session //세션 객체
			) {
		
		//세션 초기화
		session.invalidate();
		
		//메인 페이지로 리다이렉트
		return "redirect:/login/main";
	}

}

















