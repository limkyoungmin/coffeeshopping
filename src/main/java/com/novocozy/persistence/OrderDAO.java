package com.novocozy.persistence;

import java.util.List;

import com.novocozy.domain.OrderDetailVO;
import com.novocozy.domain.OrderVO;

public interface OrderDAO {
	
	 public int insertOrder(OrderVO orderVO) throws Exception;
	 public void insertOrderDetail(OrderDetailVO orderDetailVO) throws Exception;
	 public void resetCart(String users_id) throws Exception;
	 public List<OrderDetailVO> listOrder(String users_id) throws Exception;
}
