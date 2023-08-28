package com.novocozy.mappers;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.novocozy.domain.CartVO;

@Mapper
public interface CartMapper {
	
	public void cartInsert(CartVO cartVO) throws Exception;
	public int cartCheck(CartVO cartVO) throws Exception;
	public int cartMemCheck(CartVO cartVO) throws Exception;
	public List<CartVO> cartList(String users_id) throws Exception;
	public int cartDelete(int cart_num) throws Exception;
	public int cartDeleteAll(String users_id) throws Exception;
	public int countUpdate(int cart_num) throws Exception;
	}