package com.novocozy.controller;

import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.novocozy.domain.LoginVO;
import com.novocozy.service.LoginService;

@Controller
@RequestMapping("/member/*")
public class LoginController {
	
	
	@Autowired
	private LoginService ls;
	
	/* 로그인 페이지 이동 */
	 @RequestMapping(value = "/login", method = RequestMethod.GET) 
	 public String loginView(Model model,HttpSession session) throws Exception { 
		 return "/member/login";
	 }

	 @RequestMapping(value="login", method=RequestMethod.POST) 
	 public String loginPost(LoginVO loginvo, HttpSession session, Model model) throws Exception { 
		    LoginVO vo = ls.userlogin(loginvo);
		    if (vo == null) { //아이디 값이 없는경우
		        model.addAttribute("message", "아이디와 비밀번호를 확인해주세요"); 
		        return "/member/login";
		    } else if (!BCrypt.checkpw(loginvo.getUsers_passwd(), vo.getUsers_passwd())) {
		        model.addAttribute("message", "아이디와 비밀번호를 확인해주세요"); 
		        return "/member/login";
		    } else if (vo.getUsers_email_yn() == '0') { // 이메일 인증이 필요한 경우
		        model.addAttribute("message", "이메일 인증이 필요합니다.");
		        return "/member/login";
		    } else if(vo.getUsers_yn() == 'Y') {
		    	model.addAttribute("message", "탈퇴 처리된 계정입니다.");
		    	return "/member/login";
		    } else { // 로그인 성공 처리
		        session.setAttribute("user", vo.getUsers_id());
		        model.addAttribute("users_id", vo.getUsers_id()); 
		        return "redirect:/main";
		    }
		}	
	 
	/* 로그아웃 처리 -> 세션 만료시켜버리기(세션 속성값 제거)*/
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/main";
    }
}
