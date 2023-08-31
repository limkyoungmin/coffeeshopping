package com.novocozy.service;

import java.util.List;

import com.novocozy.domain.OrderVO;
import com.novocozy.domain.UserVO;

public interface AdminUserService {
	public List<UserVO> adminUserList(UserVO userVo) throws Exception;
	public void adminUserDelete(String users_id) throws Exception;
	public List<OrderVO> adminOrderList(OrderVO orderVo) throws Exception;
	public void adminOrderUpdate(int order_num, String order_request, String order_courier, String order_trackingnum) throws Exception;
}
