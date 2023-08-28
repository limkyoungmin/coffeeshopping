package com.novocozy.util;

import java.io.UnsupportedEncodingException;

import javax.activation.DataSource;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;

/* 메일 전송 라이브러리 javamailsender 인터페이스*/
public class MailUtils {

	private JavaMailSender mailSender;
	private MimeMessage message;
	private MimeMessageHelper messageHelper;

	public MailUtils(JavaMailSender mailSender) throws MessagingException {
		this.mailSender = mailSender;
		message = this.mailSender.createMimeMessage();
		messageHelper = new MimeMessageHelper(message, true, "UTF-8");
	}

	public void setSubject(String subject) throws MessagingException { //제목
		messageHelper.setSubject(subject);
	}

	public void setText(String htmlContent) throws MessagingException { //내용
		messageHelper.setText(htmlContent, true);
	}

	public void setFrom(String email, String name) throws UnsupportedEncodingException, MessagingException { //발송자
		messageHelper.setFrom(email, name);
	}

	public void setTo(String email) throws MessagingException { //수신자
		messageHelper.setTo(email);
	}

	public void addInline(String contentId, DataSource dataSource) throws MessagingException { 
		messageHelper.addInline(contentId, dataSource);
	}

	public void send() { 
		mailSender.send(message);
	}

}
