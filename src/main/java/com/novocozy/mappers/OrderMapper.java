package com.novocozy.mappers;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.novocozy.domain.OrderDetailVO;
import com.novocozy.domain.OrderVO;

@Mapper
public interface OrderMapper {
	
	public void insertOrder(OrderVO orderVO) throws Exception;
	public void insertOrderDetail(OrderDetailVO orderdetailVO) throws Exception;
	public void resetCart(String users_id) throws Exception;
	public List<OrderDetailVO> listOrder(String users_id) throws Exception;
	
	}