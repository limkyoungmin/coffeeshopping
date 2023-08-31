package com.novocozy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.novocozy.domain.OrderVO;
import com.novocozy.domain.UserVO;
import com.novocozy.persistence.AdminUserDAO;

@Service
public class AdminUserServiceImpl implements AdminUserService {
	
	@Autowired
	AdminUserDAO userDao;
	
	@Override
	public List<UserVO> adminUserList(UserVO userVo) throws Exception {
		return userDao.adminUserList(userVo);
	}
	
	@Override
	public void adminUserDelete(String users_id) throws Exception {
		userDao.adminUserDelete(users_id);
	}
	
	@Override
	public List<OrderVO> adminOrderList(OrderVO orderVo) throws Exception {
		return userDao.adminOrderList(orderVo);
	}
	
	@Override
	public void adminOrderUpdate(int order_num, String order_request, String order_courier, String order_trackingnum) throws Exception {
		if("주문완료".equals(order_request)) {
			userDao.adminOrderUpdate(order_num, order_request, order_courier, order_trackingnum);
		} else {
			userDao.adminOrderRequestUpdate(order_num);
		}
	}
}
