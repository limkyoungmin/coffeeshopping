package com.novocozy.persistence;

import java.util.List;

import com.novocozy.domain.CartVO;

public interface CartDAO {
	
	public void cartInsert(CartVO cartVO) throws Exception;
	public int cartCheck(CartVO cartVO) throws Exception;
	public int cartMemCheck(CartVO cartVO) throws Exception;
	public List<CartVO> cartList(String users_id) throws Exception;
	public int cartDelete(int cart_num) throws Exception;
	public int cartDeleteAll(String users_id) throws Exception;
	public void countUpdate(int cart_num, int product_count) throws Exception;
}
