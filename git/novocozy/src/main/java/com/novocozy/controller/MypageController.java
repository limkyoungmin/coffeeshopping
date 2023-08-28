package com.novocozy.controller;

import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.novocozy.domain.UserVO;
import com.novocozy.service.UserService;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/mypage/*")
@SessionAttributes("user")
public class MypageController {
	
	@Autowired
	private UserService us;

	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public String main(Locale locale, Model model) {
		return "/mypage/mypage";
	}
	
	/* 개인정보수정 불러오기*/
	@RequestMapping(value = "/editinfo", method=RequestMethod.GET)
	public ModelAndView userView(HttpSession session) throws Exception {
		ModelAndView mav=new ModelAndView();
		String users_id=(String) session.getAttribute("user"); // 세션에 담긴 아이디 확인
		System.out.println("session=>"+users_id); // 아이디 확인용
		UserVO vo=us.userView(users_id); // 아이디값 토대로 vo에담긴 값 확인
		mav.addObject("userView",vo);
		mav.setViewName("/mypage/editinfo");
		return mav;
	}
	
	/* (개인정보수정)비밀번호 확인 */
	@ResponseBody
	@RequestMapping(value = "/pwCheck", method = RequestMethod.POST)
	public Map<String, Object> pwCheck(@RequestParam("users_id") String users_id, @RequestParam("users_passwd") String users_passwd) throws Exception {
		 Map<String, Object> response = new HashMap<>();
		 UserVO userVO = us.userView(users_id);
		 if (userVO != null) {					
			 //System.out.println("users_passwd: " + users_passwd); test 입력된 비밀번호 확인
			 //System.out.println("userVO.getUsers_passwd(): " + userVO.getUsers_passwd()); test DB상에 저장된 비밀번호 확인
			boolean isMatched = BCrypt.checkpw(users_passwd, userVO.getUsers_passwd());
			        if (isMatched) {
			            response.put("data", 0); // 비밀번호 일치
			        } else {
			            response.put("data", 1); // 비밀번호 불일치
			        }
			    }
		 return response;
	}

	@ResponseBody
	@RequestMapping(value="/updateInfo", method=RequestMethod.POST)
	public int updateInfo(@ModelAttribute UserVO userVO) throws Exception {
		String hashedPw = BCrypt.hashpw(userVO.getUsers_passwd(), BCrypt.gensalt(10));
		userVO.setUsers_passwd(hashedPw);
		  int result = us.updateInfo(userVO);
		  System.out.println("회원정보수정완료");
		  //System.out.println(result); 회원정보 수정 result 값 확인
		  return result;
	}
	
	/* 회원 탈퇴 처리 */
	@ResponseBody
	@RequestMapping(value="/users/drop", method=RequestMethod.POST)
	public String deleteUser(@ModelAttribute UserVO userVO) throws Exception{
		int result = us.deleteUser(userVO);
		System.out.println("회원 탈퇴 완료");
		return String.valueOf(result);
	}
}
