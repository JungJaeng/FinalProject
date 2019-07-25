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

   
   // 濡�洹� �쇱�대��щ━ 媛�泥�
   private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

   // ��鍮��� 媛�泥�
   @Autowired MemberService memberService;

   
   @RequestMapping(value="/member/login", method=RequestMethod.GET)
   public void login() { logger.info("濡�洹몄�� ���댁�"); }
   
   
   @RequestMapping(value="/member/login", method=RequestMethod.POST)
   public String loginProc(
         Member member,
         HttpSession session
         ) {
//      logger.info("濡�洹몄�� 泥�由�");
      
//      logger.info(member.toString());
      
      String redirectUrl = null;
      if( memberService.login(member) ) {
         // 濡�洹몄�� �깃났
         
         member = memberService.selectMember(member);
         
//         logger.info(member.toString());
         
         // �몄�� ��蹂� ����
         session.setAttribute("login", true);
         session.setAttribute("login_id", member.getUser_id());
         session.setAttribute("login_nick", member.getUser_nick());
         session.setAttribute("login_pw", member.getUser_pw());
         session.setAttribute("login_emil", member.getUser_email());
         session.setAttribute("user_join_no", member.getUser_join_no());
         
         
         // 由щ�ㅼ�대���� URL 吏���
         redirectUrl = "/main"; 
         
      } else {
         // 濡�洹몄�� �ㅽ��
         // 由щ�ㅼ�대���� URL 吏���
         redirectUrl = "/member/login";
         
      }
      
      return "redirect:" + redirectUrl; 
   }
   
   @RequestMapping(value="/member/idcheck", method=RequestMethod.GET)
   public void idcheck() { logger.info("以�蹂듭���대�� 泥댄�� ���댁�"); }

   
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
   public void join() { logger.info("����媛��� ���댁�"); }
   
   
   @RequestMapping(value="/member/join", method=RequestMethod.POST)
   public String joinProc(Member member) {
//      logger.info("����媛���泥�由�");
      
      memberService.insert(member);
      
      return "redirect:/main"; 
      
   }
   
   
   @RequestMapping(value="/member/idFind", method=RequestMethod.GET)
   public void idFind() { logger.info("���대��李얘린 ���댁�"); }
   
   
   @RequestMapping(value="/member/idFind", method=RequestMethod.POST)
   public void idFindProc(
         Member member, 
         Model model
         ) {
//      logger.info("���대�� 李얘린 泥�由�");
      
      if( memberService.idFind(member) == true ) {
         
         Member idFind = memberService.idFindSelectMember(member);
         
//         logger.info("idFind="+idFind.toString());
                  
         model.addAttribute("idFind", "�������� ���대���� "+idFind.getUser_id()+" ������");
         
//         logger.info("idFindId="+idFind);
         
               
      }else {
         
         model.addAttribute("idFind2", 0);
      }
         
   }
   
   
   @RequestMapping(value="/member/pwFind", method=RequestMethod.GET)
   public void pwFind() { 
	   // logger.info("鍮�諛�踰��몄갼湲� ���댁�"); 
   }
   
   
   
   @RequestMapping(value="/member/pwFind", method=RequestMethod.POST)
   public String pwFindProc(
         Member member, 
         Model model
         ) {
//      logger.info("鍮�諛�踰��� 李얘린 泥�由�");
      
//      logger.info("���대��="+member.getUser_id());
      
      Member pwFind = memberService.pwFindSelectMember(member);
      
//      logger.info("pwFind="+pwFind.toString()); 
      
      memberService.pwSendEmail( pwFind );
   
//      logger.info(member.getUser_pw()); 
   
//      logger.info("pwFind=="+pwFind.toString());
 
      return "redirect:/member/login";
   }
   
   
   
   @RequestMapping(value="/member/logout", method=RequestMethod.GET)
   public String logout( HttpSession session ) {
//      logger.info("濡�洹몄����");
      
      session.invalidate();
      
      return "redirect:/main"; 
   }
   
}

