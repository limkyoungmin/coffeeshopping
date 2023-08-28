package com.novocozy.controller;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.novocozy.domain.UserVO;
import com.novocozy.service.UserService;

@Controller
@RequestMapping("/member/*")
public class UserController {

	@Autowired
	private UserService us;
	
	/* 회원가입 페이지 이동 */
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public void joinGET() throws Exception {
	}
	
	/* 아이디 중복검사 */
	@ResponseBody
	@RequestMapping(value="/idCheck/{users_id}", method=RequestMethod.POST)   
	public boolean idCheck(@PathVariable String users_id) throws Exception {
		UserVO userVO = new UserVO();
		userVO.setUsers_id(users_id);
		 int result = us.idCheck(userVO);
		 return result != 0;
	}

	/*회원가입 페이지 값 넣으면서 동시에 가입성공페이지에 넣을 값 불러놓기*/
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String join(@ModelAttribute UserVO vo, Model model) throws Exception {
		String hashedPw = BCrypt.hashpw(vo.getUsers_passwd(), BCrypt.gensalt(10));
		vo.setUsers_passwd(hashedPw);
		us.userjoin(vo);
		model.addAttribute("users_id",vo.getUsers_id());
		System.out.println("회원가입 작동");
		return "/member/joincomplete";
	}

	 /* 성공페이지 이동하기 위해서 작성*/
	@RequestMapping(value="/member/joincomplete", method=RequestMethod.GET) 
	public void joincomplete() throws Exception{
		
	}
	
	/* 개인메일에서 이메일 인증 완료 링크 누를경우 페이지 이동 */
	@RequestMapping(value="/member/emailyncomplete", method=RequestMethod.GET)
	public String mailcomplete(UserVO vo) throws Exception{
		us.updatemailyn(vo);
		return "/member/emailyncomplete";
	}
	
	/* 아이디 찾기 페이지 이동 */
	@RequestMapping(value="/findid",method=RequestMethod.GET)
	public String findIdView() throws Exception{
		return "/member/findid";
	}
	
	/* 핸드폰번호로 아이디 찾기*/
	@RequestMapping(value="findidP", method=RequestMethod.GET)
	public ModelAndView findIdP(UserVO vo) throws Exception{
		ModelAndView mav =new ModelAndView();
		UserVO userVO = us.findIdP(vo);
		if(userVO == null) { 
			mav.setViewName("/member/findid");
			mav.addObject("message", "입력하신 이름과 핸드폰 번호를 확인해주세요.");
		} else { 
			mav.addObject("users_id", userVO.getUsers_id());
			mav.addObject("users_date",userVO.getUsers_date());
			mav.setViewName("/member/findidresult");
			//System.out.println(userVO.getUsers_id()); 값넘어가는지 확인:)
		}
		return mav;
	}
	
	/* 이메일로 아이디 찾기*/
	@RequestMapping(value="findidE", method=RequestMethod.GET)
	public ModelAndView findIdE(UserVO vo) throws Exception{
		ModelAndView mav =new ModelAndView();
		UserVO userVO = us.findIdE(vo);
		if(userVO == null) { 
			mav.setViewName("/member/findid");
			mav.addObject("message", "입력하신 이름과 이메일을 확인해주세요.");
		} else { 
			mav.addObject("users_id", userVO.getUsers_id());
			mav.addObject("users_date",userVO.getUsers_date());
			mav.setViewName("/member/findidresult");
			//System.out.println(userVO.getUsers_id()); 값넘어가는지 확인:)
		}
		return mav;
	}
	
	/* 비밀번호 재설정 페이지 이동*/
	@RequestMapping(value="/resetpw", method=RequestMethod.GET)
	public String resetpwView() throws Exception{
		return "/member/resetpw";
	}
	
	/* 비밀번호 재설정 정보확인*/
	@RequestMapping(value="resetPw", method=RequestMethod.GET)
	public String resetPw(UserVO vo,Model model) throws Exception{
		int resetPwResult = us.resetPwChk(vo);
		if(resetPwResult == 0) {
			model.addAttribute("message","입력하신 아이디와 이메일을 확인해주세요");
			return "/member/resetpw";
		  } else {
		    
		    return "/member/login";
		    }
		}
	
	/* 비밀번호 재설정 페이지로 값 넘기기 이후 value 값 페이지값 수정 필요*/
	@RequestMapping(value="/updatepw", method=RequestMethod.GET) 
	public ModelAndView updatepw(@RequestParam("users_id") String users_id, @RequestParam("users_email") String users_email) throws Exception{ 
	    // users_id와 users_email을 이용하여 비밀번호 초기화 화면 설정
		ModelAndView mav=new ModelAndView();
	    mav.addObject("users_id", users_id); // 추가한상태로 updatepw로 간다
	    mav.addObject("users_email", users_email); // 추가한 상태로 updatepw로 간다
	    mav.setViewName("/member/updatepw");
	    //System.out.println(users_id); // 넘어온 id값 확인
		//System.out.println(users_email); //넘어온 email값 확인
	    return mav;
	}
	
	/* 최종적으로 비밀번호 변경 처리 마찬가지로 value 값 페이지값 수정 필요*/
	@RequestMapping(value="updatepasswd", method=RequestMethod.POST) 
	public ModelAndView updatepasswd(UserVO userVO) throws Exception{
		ModelAndView mav=new ModelAndView();
		String hashedPw = BCrypt.hashpw(userVO.getUsers_passwd(), BCrypt.gensalt(10));
		userVO.setUsers_passwd(hashedPw);
		us.updatePw(userVO.getUsers_email(),userVO.getUsers_id(),userVO.getUsers_passwd());
		System.out.println("수정완료");
		mav.setViewName("/member/login");
		return mav;
	}
	
}
