package com.novocozy.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.novocozy.domain.OrderVO;
import com.novocozy.domain.UserVO;

@Repository
public class AdminUserDAOImpl implements AdminUserDAO {
	
	@Autowired
	private SqlSession session;
	
	private static String namespace = "com.novocozy.mappers.AdminUserMapper";
	
	@Override
	public List<UserVO> adminUserList(UserVO userVo) throws Exception {
		return session.selectList(namespace + ".userList", userVo);
	}
	
	@Override
	public void adminUserDelete(String users_id) throws Exception {
		session.update(namespace + ".userDelete", users_id);
	}

	@Override
	public List<OrderVO> adminOrderList(OrderVO orderVo) throws Exception {
		return session.selectList(namespace + ".orderList", orderVo);
	}
	
	@Override
	public void adminOrderUpdate(int order_num, String order_request, String order_courier, String order_trackingnum) throws Exception {
		
		Map<String, Object> params = new HashMap<>();
        params.put("order_num", order_num);
        params.put("order_courier", order_courier);
        params.put("order_trackingnum", order_trackingnum);
		
		session.update(namespace + ".orderUpdate", params);
	}
	
	@Override
	public void adminOrderRequestUpdate(int order_num) throws Exception {
		session.update(namespace + ".orderRequestUpdate", order_num);
	}
}
