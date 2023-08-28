package com.novocozy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.novocozy.domain.CartVO;
import com.novocozy.persistence.CartDAO;

@Service
public class CartServiceImpl implements CartService {
	
	@Autowired
	CartDAO dao;
	
	@Override
	public void cartInsert(CartVO cartVO) throws Exception {
		// TODO Auto-generated method stub
		this.dao.cartInsert(cartVO);
	}
	
	@Override
	public int cartCheck(CartVO cartVO) throws Exception {
		// TODO Auto-generated method stub
		return this.dao.cartCheck(cartVO);
	}
	
	@Override
	public int cartMemCheck(CartVO cartVO) throws Exception {
		// TODO Auto-generated method stub
		return this.dao.cartMemCheck(cartVO);
	}
	
	@Override
	public List<CartVO> cartList(String users_id) throws Exception {
		// TODO Auto-generated method stub
		return this.dao.cartList(users_id);
	}
	
	@Override
	public int cartDelete(int cart_num) throws Exception {
		// TODO Auto-generated method stub
		return this.dao.cartDelete(cart_num);
	}
	
	@Override
	public int cartDeleteAll(String users_id) throws Exception {
		// TODO Auto-generated method stub
		return this.dao.cartDeleteAll(users_id);
	}
	
	 @Override
	    public void countUpdate(int cart_num, int product_count) throws Exception {
	        this.dao.countUpdate(cart_num, product_count);
	    }
}

