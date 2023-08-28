package com.novocozy.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.novocozy.domain.UserVO;
import com.novocozy.persistence.UserDAO;
import com.novocozy.util.MailUtils;
import com.novocozy.util.TempKey;

@Service
public class UserServiceImple implements UserService {

	@Autowired
	UserDAO dao;
	
	@Autowired
	JavaMailSender mailSender;
	
	@Override
	public void userjoin(UserVO vo) throws Exception{
		//랜덤문자열 생성 util에 TempKey 가져오기
		String users_email_code=new TempKey().getKey(30, false);//코드 길이 설정
		vo.setUsers_email_code(users_email_code);
		
		//회원가입 관련 코드
		dao.userjoin(vo);
		dao.updatemailcode(vo);
		
		//회원가입 완료하면 메일전송 바로해버려
		MailUtils sendMail = new MailUtils(mailSender);
		sendMail.setSubject("NOVOCOZY 회원가입 인증 메일입니다 :)");
		sendMail.setText(
				"<h3>NOVOCOZY<h3>"+
				"<br><h1>메일 인증 안내입니다</h1>"+
				"<p><br><br>안녕하세요.<br> NOVOCOZY를 이용해 주셔서 진심으로 감사드립니다."+
				"<br>아래 '메일 인증' 버튼을 클릭하여 회원가입을 완료해 주세요."+ 
				"<br>감사합니다."+
				"<br><a href='http://localhost:8080/member/emailyncomplete?users_email="+vo.getUsers_email()+
				"&users_email_code="+users_email_code+"' target='_blank'>메일 인증</a>"+"<br><br><br>");
		sendMail.setFrom("novocozy@novocozy.com","novocozy");
		sendMail.setTo(vo.getUsers_email());
		sendMail.send();
	}

	@Override
	public int updatemailcode(UserVO vo) throws Exception {
		// TODO Auto-generated method stub
		return dao.updatemailcode(vo);
	}
	
	@Override
	public int updatemailyn(UserVO vo) throws Exception {
		// TODO Auto-generated method stub
		return dao.updatemailyn(vo);
	}
	
	@Override
	public int emailynFail(String users_id) throws Exception {
		// TODO Auto-generated method stub
		return dao.emailynFail(users_id);
	}
	
	@Override
	public int idCheck(UserVO vo) throws Exception {
		// TODO Auto-generated method stub
		return dao.idCheck(vo);
	}
	
	@Override
	public UserVO userView(String users_id) throws Exception {
		// TODO Auto-generated method stub
		return dao.userView(users_id);
	}
	
	@Override
	public int updateInfo(UserVO vo) throws Exception {
		// TODO Auto-generated method stub
		return dao.updateInfo(vo);
	}
	
	@Override
	public String pwCheck(String users_id) throws Exception {
		// TODO Auto-generated method stub
		return dao.pwCheck(users_id);
	}
	
	@Override
	public UserVO findIdP(UserVO vo) throws Exception {
		// TODO Auto-generated method stub
		return dao.findIdP(vo);
	}
	
	@Override
	public UserVO findIdE(UserVO vo) throws Exception {
		// TODO Auto-generated method stub
		return dao.findIdE(vo);
	}
	
	@Override
	public int resetPwChk(UserVO vo) throws Exception {
		// TODO Auto-generated method stub
		String resetUrl = "http://localhost:8080/member/updatepw?users_id="+ vo.getUsers_id() + "&users_email=" + vo.getUsers_email();
		 MailUtils sendMail = new MailUtils(mailSender);
			sendMail.setSubject("NOVOCOZY 비밀번호 재설정 인증 메일입니다 :)"); //메일제목
			sendMail.setText(
							"<h3>NOVOCOZY<h3>"+
							"<br><h1>비밀번호 재설정 이메일 인증 안내입니다</h1>"+
							"<p><br><br>안녕하세요.<br> 항상 NOVOCOZY를 이용해 주셔서 진심으로 감사드립니다."+
							"<br>아래 '메일 인증' 버튼을 클릭하여 인증을 완료해 주세요."+ 
							"<br/>비밀번호를 재설정 하신뒤 로그인 해주시기 바랍니다."+
							"<br>감사합니다."+
							"<br/><a href='" + resetUrl + "'>비밀번호 재설정하기</a>");
			sendMail.setFrom("novocozy@novocozy.com","novocozy");
			sendMail.setTo(vo.getUsers_email());
			int result = 0;
				result = dao.resetPwChk(vo);
			if(result == 1 ) {
				sendMail.send();
			}
			
			 return result;
	}
	
	@Override
	public int updatePw(String users_email,String users_id,String users_passwd) throws Exception {
		// TODO Auto-generated method stub
		return dao.updatePw(users_email, users_id,users_passwd);
	}
	
	@Override
	public int deleteUser(UserVO vo) throws Exception {
		// TODO Auto-generated method stub
		int result=dao.deleteUser(vo);
		return result;
	}
	
	@Override
	public UserVO getUserInfo(String users_id) throws Exception {
		// TODO Auto-generated method stub
		return dao.getUserInfo(users_id);
	}
}
