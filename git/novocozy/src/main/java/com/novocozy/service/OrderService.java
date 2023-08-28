package com.novocozy.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.novocozy.domain.OrderDetailVO;
import com.novocozy.domain.OrderVO;

@Service
public interface OrderService {
	
	//public void insertOrder(OrderVO orderVO,OrderDetailVO orderdetailVO) throws Exception;
	public void insertOrder(OrderVO orderVO, List<OrderDetailVO> orderDetailVOList) throws Exception;
	
}
