package com.novocozy.admincontroller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.novocozy.domain.OrderVO;
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
	public String userDeliveryList(HttpSession session, Model model,OrderVO orderVo) throws Exception {	
		
		List<OrderVO> adminOrderList = userService.adminOrderList(orderVo);
		
		model.addAttribute("orderList", adminOrderList);
		return "admin/users_delivery";
	}
	
	// 관리자 유저 배송 업데이트
	@PostMapping("admin/userDeliveryUpdate")
	public String userDeliveryUpdate(@ModelAttribute OrderVO orderVo) throws Exception {
		int order_num = orderVo.getOrder_num();
		String order_request = orderVo.getOrder_request();
		String order_courier = orderVo.getOrder_courier();
		String order_trackingnum = orderVo.getOrder_trackingnum();
		
		System.out.println("order_num : " + order_num);	
		System.out.println("order_request : " + order_request);
		System.out.println("order_courier : " + order_courier);
		System.out.println("order_trackingnum : " + order_trackingnum);
		
		if("배송완료".equals(order_request)) {
			return "redirect:/admin/users_delivery";
		}
		userService.adminOrderUpdate(order_num, order_request, order_courier, order_trackingnum);
		
		return "redirect:/admin/users_delivery";
	}
}
