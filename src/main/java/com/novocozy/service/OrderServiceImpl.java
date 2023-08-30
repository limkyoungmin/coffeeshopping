package com.novocozy.service;

import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.novocozy.domain.OrderDetailVO;
import com.novocozy.domain.OrderVO;
import com.novocozy.persistence.OrderDAO;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	OrderDAO dao;

	@Transactional
	@Override
	public void insertOrder(OrderVO orderVO, List<OrderDetailVO> orderDetailVOList) throws Exception {
		int orderNum = generateRandomOrderNumber(); // Generate 6-digit random order number
		orderVO.setOrder_num(orderNum); // Set the generated order number

		dao.insertOrder(orderVO);
		insertOrderDetails(orderDetailVOList, orderNum);
		dao.resetCart(orderVO.getUsers_id());
	}

	public void insertOrderDetails(List<OrderDetailVO> orderDetailVOList, int orderNum) throws Exception {
		for (OrderDetailVO orderDetailVO : orderDetailVOList) {
			orderDetailVO.setOrder_num(orderNum);
			dao.insertOrderDetail(orderDetailVO);
		}
	}
	/*6 자리 난수 설정*/
	private int generateRandomOrderNumber() {
		Random random = new Random();
		return random.nextInt(900000) + 100000; // Generates a 6-digit random number
	}
	
	@Override
	public List<OrderDetailVO> listOrder(String users_id) throws Exception {
		return dao.listOrder(users_id);
	}
}
