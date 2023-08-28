package com.novocozy.admincontroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.novocozy.domain.UserVO;
import com.novocozy.service.AdminUserService;

@Controller
public class AdminUserController {
	
	@Autowired
	AdminUserService userService;
	
	// 관리자 멤버 페이지
	@RequestMapping(value = "admin/admin_user", method = RequestMethod.GET)
	public String adminMember(Model model, UserVO userVo) throws Exception {

		List<UserVO> adminUserList = userService.adminUserList(userVo);
		model.addAttribute("adminUserList", adminUserList);
		
		return "admin/admin_user";
	}
	
	// 관리자 멤버 처리(삭제or삭제취소)
	@RequestMapping(value = "admin/userDelete", method = RequestMethod.POST)
	public String userDelete(@RequestParam String users_id) throws Exception {
		
		userService.adminUserDelete(users_id);
		
		return "redirect:/admin/admin_user";
	}
}
