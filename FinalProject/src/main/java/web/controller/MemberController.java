package web.controller;

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
import org.springframework.web.bind.annotation.ResponseBody;

import web.dto.Member;
import web.service.face.MemberService;

@Controller
public class MemberController {

   
   // 로그 라이브러리 객체
   private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

   // 서비스 객체
   @Autowired MemberService memberService;

   
   @RequestMapping(value="/member/login", method=RequestMethod.GET)
   public void login() { logger.info("로그인 페이지"); }
   
   
   @RequestMapping(value="/member/login", method=RequestMethod.POST)
   public String loginProc(
         Member member,
         HttpSession session
         ) {
//      logger.info("로그인 처리");
      
//      logger.info(member.toString());
      
      String redirectUrl = null;
      if( memberService.login(member) ) {
         // 로그인 성공
         
         member = memberService.selectMember(member);
         
//         logger.info(member.toString());
         
         // 세션 정보 저장
         session.setAttribute("login", true);
         session.setAttribute("login_id", member.getUser_id());
         session.setAttribute("login_nick", member.getUser_nick());
         session.setAttribute("login_pw", member.getUser_pw());
         session.setAttribute("login_emil", member.getUser_email());
         
         
         // 리다이렉트 URL 지정
         redirectUrl = "/main"; 
         
      } else {
         // 로그인 실패
         // 리다이렉트 URL 지정
         redirectUrl = "/member/login";
         
      }
      
      return "redirect:" + redirectUrl; 
   }
   
   @RequestMapping(value="/member/idcheck", method=RequestMethod.GET)
   public void idcheck() { logger.info("중복아이디 체크 페이지"); }

   
   @ResponseBody
   @RequestMapping(value="/member/idcheck", method=RequestMethod.POST)
   public String idcheckProc(
         HttpServletRequest req, 
         @RequestParam("user_id") String user_id
         ) {
      
//      logger.info("post idCheck");
      
      String userId = req.getParameter("user_id");
      
//      logger.info("userID="+userId.toString());
      
      boolean idcheck = memberService.idcheck(userId);
      
      String n = null;
      if(idcheck) {
         n="true";
      } else if(!idcheck) {
         n="false";
      }
      
      return n;
      
   } 
   
   
   @RequestMapping(value="/member/join", method=RequestMethod.GET)
   public void join() { logger.info("회원가입 페이지"); }
   
   
   @RequestMapping(value="/member/join", method=RequestMethod.POST)
   public String joinProc(Member member) {
//      logger.info("회원가입처리");
      
      memberService.insert(member);
      
      return "redirect:/main"; 
      
   }
   
   
   @RequestMapping(value="/member/idFind", method=RequestMethod.GET)
   public void idFind() { logger.info("아이디찾기 페이지"); }
   
   
   @RequestMapping(value="/member/idFind", method=RequestMethod.POST)
   public void idFindProc(
         Member member, 
         Model model
         ) {
//      logger.info("아이디 찾기 처리");
      
      if( memberService.idFind(member) == true ) {
         
         Member idFind = memberService.idFindSelectMember(member);
         
//         logger.info("idFind="+idFind.toString());
                  
         model.addAttribute("idFind", "회원님의 아이디는 "+idFind.getUser_id()+" 입니다");
         
//         logger.info("idFindId="+idFind);
         
               
      }else {
         
         model.addAttribute("idFind2", 0);
      }
         
   }
   
   
   @RequestMapping(value="/member/pwFind", method=RequestMethod.GET)
   public void pwFind() { 
	   // logger.info("비밀번호찾기 페이지"); 
   }
   
   
   
   @RequestMapping(value="/member/pwFind", method=RequestMethod.POST)
   public String pwFindProc(
         Member member, 
         Model model
         ) {
//      logger.info("비밀번호 찾기 처리");
      
//      logger.info("아이디="+member.getUser_id());
      
      Member pwFind = memberService.pwFindSelectMember(member);
      
//      logger.info("pwFind="+pwFind.toString()); 
      
      memberService.pwSendEmail( pwFind );
   
//      logger.info(member.getUser_pw()); 
   
//      logger.info("pwFind=="+pwFind.toString());
 
      return "redirect:/member/login";
   }
   
   
   
   @RequestMapping(value="/member/logout", method=RequestMethod.GET)
   public String logout( HttpSession session ) {
//      logger.info("로그아웃");
      
      session.invalidate();
      
      return "redirect:/main"; 
   }
   
}

