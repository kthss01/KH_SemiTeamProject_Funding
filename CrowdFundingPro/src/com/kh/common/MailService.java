package com.kh.common;

import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import com.kh.common.model.vo.Attachment;
import com.kh.recruit.model.service.RecruitService;
import com.kh.recruit.model.vo.RecruitMember;
import com.kh.recruit.model.vo.Recruitment;

public class MailService {
	private static String user = "sunyoya2@gmail.com"; // 관리자 이메일
	private static String password = "tpal1234!!"; // 관리자 이메일 비밀번호
	
	private static Properties p = null; // 이메일 설정 값
	
	private static class SMTPAuthenticator extends Authenticator {
		@Override
		protected PasswordAuthentication getPasswordAuthentication() {
			return new PasswordAuthentication(user, password);
		}
	}
	
	private static Properties getSetting() {
		if (p == null) {
			// 이메일 설정
			Properties p = new Properties();
			p.put("mail.smtp.host", "smtp.gmail.com");
			p.put("mail.smtp.port", 465);
			p.put("mail.smtp.auth", "true"); 
			p.put("mail.smtp.ssl.enable", "true"); 
			p.put("mail.smtp.ssl.trust", "smtp.gmail.com");
			p.put("mail.smtp.starttls.required", "true");
			p.put("mail.smtp.ssl.protocols", "TLSv1.2");
		}
		
		return p;
	}

	public static void send(String title, String content, String toEmail) {
		p = getSetting();
		
		try {
			
			Authenticator auth = new SMTPAuthenticator();
			Session session = Session.getInstance(p, auth);
			
			session.setDebug(true); 

			MimeMessage msg = new MimeMessage(session);

			// 메일 제목
			msg.setSubject(title);
			
			// 발송자 설정
			Address fromAddr = new InternetAddress(user, "KH"); 
			msg.setFrom(fromAddr);
			
			// 수신자 설정
			Address toAddr = new InternetAddress(toEmail); 
			msg.addRecipient(Message.RecipientType.TO, toAddr);
			
			// 메일 내용
			String message = content;
			msg.setContent(message, "text/html;charset=KSC5601");
	
			Transport.send(msg);
			
		} catch (Exception e) { 
			e.printStackTrace();
		}
	}
	
	public static void sendResume(int rid, RecruitMember rm, Attachment at) {
		p = getSetting();
		
		// Recruitment 정보 가져오기
		Recruitment r = new RecruitService().selectRecruitment(rid);
		
		try {
			
			Properties prop = new Properties();
			
			
			Authenticator auth = new SMTPAuthenticator();
			Session session = Session.getInstance(p, auth);
			
			session.setDebug(true); 

			MimeMessage msg = new MimeMessage(session);

			String title = String.format("[%s][%s] %s님 이력 지원서", r.getTitle(), r.getCode(), rm.getName());
			
			// 메일 제목
			msg.setSubject(title);
			
			// 발송자 설정
			Address fromAddr = new InternetAddress(user, "KH"); 
			msg.setFrom(fromAddr);
			
			// 수신자 설정
			Address toAddr = new InternetAddress(rm.getEmail()); 
			msg.addRecipient(Message.RecipientType.TO, toAddr);

			StringBuilder content = new StringBuilder();
			content.append(String.format("지원포지션명: %s\n", r.getTitle()));
			content.append(String.format("성명: %s\n", rm.getName()));
			content.append(String.format("연락처: %s\n", rm.getPhone()));
			content.append(String.format("이메일: %s\n", rm.getEmail()));
			content.append(String.format("학력사항: %s\n", rm.getEducation()));
			content.append(String.format("경력사항: %s\n", rm.getCareer()));
			
			// 메일 내용
			String message = content.toString();
			
			// 본문 
			MimeBodyPart mbp1 = new MimeBodyPart();
			mbp1.setText(message);
			
			// 파일 첨부
			MimeBodyPart mbp2 = new MimeBodyPart();
			FileDataSource fds = new FileDataSource(at.getFilePath() + at.getChangeName());
			
			mbp2.setDataHandler(new DataHandler(fds));
			
			mbp2.setFileName(at.getOriginName());
			
			Multipart mp = new MimeMultipart();
			mp.addBodyPart(mbp1);
			mp.addBodyPart(mbp2);
			
			msg.setContent(mp, "text/html;charset=KSC5601");
	
			Transport.send(msg);
			
		} catch (Exception e) { 
			e.printStackTrace();
		}
	}
}
