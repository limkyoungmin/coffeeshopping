package com.novocozy.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.novocozy.domain.CartVO;

@Service
public interface CartService {

	public void cartInsert(CartVO cartVO) throws Exception;
	public int cartCheck(CartVO cartVO) throws Exception;
	public int cartMemCheck(CartVO cartVO) throws Exception;
	public List<CartVO> cartList(String users_id) throws Exception;
	public int cartDelete(int cart_num) throws Exception;
	public int cartDeleteAll(String users_id) throws Exception;
	public void countUpdate(int cart_num, int product_count) throws Exception;
}
