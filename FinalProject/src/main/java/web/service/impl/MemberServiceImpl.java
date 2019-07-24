package web.service.impl;

import java.io.UnsupportedEncodingException;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.NoSuchProviderException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.MemberDao;
import web.dto.Member;
import web.service.face.MemberService;
import web.util.MailAuth;

@Service
public class MemberServiceImpl implements MemberService {
   
   @Autowired MemberDao memberDao;
   
   private static final Logger logger = LoggerFactory.getLogger(MemberServiceImpl.class);
   
   @Override
   public boolean login(Member memberDate) {
      // 로그인 정보를 Count한 결과가 0보다 크면 로그인 성공
      if( memberDao.selectCntLogin(memberDate) > 0 ) {
         return true;
      }
      return false;
   }

   
   @Override
   public Member selectMember(Member member) {
      return memberDao.selectMember(member); 
   }
   
   
   @Override
   public boolean idcheck(String user_id) {
      
      if( memberDao.idcheck(user_id) > 0 ) {
         return false;
      } 
      
      return true; 
   }
   
   @Override
   public void insert(Member member) {
      memberDao.insert(member);
   }


   @Override
   public boolean idFind(Member memberDate) {
      if( memberDao.selectCntIdFind(memberDate) > 0 ) {
         return true;
      }
      return false;
   }


   @Override
   public Member idFindSelectMember(Member member) {
      return memberDao.idFindSelectMember(member);
   }


 
   @Override
   public Member pwFindSelectMember(Member member) {
      return memberDao.pwFindSelectMember(member);
   }


   @Override
   public void pwSendEmail(Member pwFind) {
      
//	   logger.info(pwFind.getUser_pw());
      
      char[] charSet = { '0','1','2','3','4','5','6','7','8','9',
            
            'A','B','C','D','E','F','G','H','I','J','K',
            'L','M','N','O','P','Q','R','S','T','U','V',
            'W','X','Y','Z',
            
            '!','@','#','$','%','&','+','=' };


      StringBuffer newKey = new StringBuffer();

      for( int i=0; i<8; i++ ) {
	      int idx = (int) (charSet.length * Math.random());
	      newKey.append(charSet[idx]);
      }
   
      pwFind.setUser_pw(newKey.toString());
      
      
      // FROM
      final String FROM = "jams90666"; // <<------------------------------수정하세요
      final String FROMNAME = "여행 어쩌고 저쩌고"; // <<------------------------------수정하세요
            
      // TO
      final String TO = pwFind.getUser_email(); 
            
//      logger.info("유저이메일"+pwFind.getUser_email());
      
      final String SUBJECT = "[여행 어쩌고 저쩌고] 임시비밀번호 발송 안내 입니다.";
            
//      logger.info(SUBJECT.toString());
            
      final String BODY = String.join(
            "<h1>여행 어쩌고 저쩌고</h1>",
            "<p>회원님의 임시비밀번호 안내입니다.</p><br><p>[임시 비밀번호] : " + newKey + " 입니다.</p><br>"
                  
            );
            
//      logger.info(BODY.toString());
            
      Authenticator auth = new MailAuth("jams90666@gmail.com", "Asd102456!");
            
//      logger.info(auth.toString());
            
      Properties props = System.getProperties();
      props.put("mail.smtp.starttls.enable", "true");
      props.put("mail.smtp.host", "smtp.gmail.com");
      props.put("mail.smtp.auth", "true");
      props.put("mail.smtp.port", "587");
            
//      logger.info(props.toString());
            
      Session session = Session.getDefaultInstance(props, auth);
      MimeMessage msg = new MimeMessage(session);
            
//      logger.info(msg.toString());
            
      try {
            msg.setFrom(new InternetAddress(FROM, FROMNAME));
            msg.setRecipient(Message.RecipientType.TO, new InternetAddress(TO));
            msg.setSubject(SUBJECT);
            msg.setContent(BODY, "text/html;charset=utf-8");

//            logger.info("Sending...");

            //메시지 보내기
            Transport.send(msg);
               
//            logger.info("Email sent!");

         } catch (NoSuchProviderException e) {
            e.printStackTrace();
               
         } catch (MessagingException e) {
            e.printStackTrace();
               
            logger.info("The email was not sent.");
            logger.info("Error message: " + e.getMessage());
               
         } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
         }      
      
//      logger.info( pwFind.getUser_pw() );
      
      
      
      memberDao.pwUpdate(pwFind);
      
   }




}