package com.novocozy.admincontroller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.novocozy.domain.OrderDetailVO;
import com.novocozy.domain.UserVO;
import com.novocozy.service.AdminUserService;
import com.novocozy.service.OrderService;
import com.novocozy.service.UserService;

@Controller
public class AdminUserController {
	
	@Autowired
	AdminUserService userService;
	
	@Autowired
	private UserService us;
	
	@Autowired
	OrderService orderService;
	
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
	
	// 관리자 유저 배송관련 페이지
	@GetMapping("admin/users_delivery")
	public String userDeliveryList(HttpSession session, Model model,OrderDetailVO orderDetailVO) throws Exception {	
		String users_id=(String) session.getAttribute("user");
		System.out.println("session id : " + users_id); // 아이디 확인용
		List<OrderDetailVO> orderList = orderService.listOrder(users_id);
		
		model.addAttribute("orderList", orderList);
		return "admin/users_delivery";
	}
}
