package web.util;


import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class MailAuth extends Authenticator {

	// 구글 SMTP ID
	private String smtp_user_id = "기본계정";

	// 구글 SMTP PW
	private String smtp_user_pw = "기본패스워드";

	// 인증 객체
	private PasswordAuthentication pa;
	
	public MailAuth(String smtp_user_id, String smtp_user_pw) {
		this.smtp_user_id = smtp_user_id;
		this.smtp_user_pw = smtp_user_pw;
		
		pa = new PasswordAuthentication(smtp_user_id, smtp_user_pw);
	}
	
	@Override
	protected PasswordAuthentication getPasswordAuthentication() {
		return pa;
	}
}
