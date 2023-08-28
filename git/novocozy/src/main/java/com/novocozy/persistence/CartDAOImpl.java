package com.novocozy.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.novocozy.domain.CartVO;

@Repository
public class CartDAOImpl implements CartDAO {

	@Inject
	private SqlSession session;
	
	private static String namespace="com.novocozy.mappers.CartMapper";
	
	@Override
	public void cartInsert(CartVO cartVO) throws Exception {
		// TODO Auto-generated method stub
		session.insert(namespace+".cartInsert",cartVO);
	}
	
	/*
	 * @Override public int cartCheck(String cart_ckid, int product_num) throws
	 * Exception { // TODO Auto-generated method stub return
	 * session.selectOne(namespace+".cartCheck"); }
	 */
	
	@Override 
	public int cartCheck(CartVO cartVO) throws Exception {
		// TODO Auto-generated method stub
	   return session.selectOne(namespace + ".cartCheck", cartVO);
	}
	
	@Override
	public int cartMemCheck(CartVO cartVO) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+".cartMemCheck", cartVO);
	}
	
	@Override
	public List<CartVO> cartList(String users_id) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".cartList", users_id);
	}
	
	@Override
	public int cartDelete(int cart_num) throws Exception {
		// TODO Auto-generated method stub
		return session.delete(namespace+".cartDelete", cart_num);
	}
	
	@Override
	public int cartDeleteAll(String users_id) throws Exception {
		// TODO Auto-generated method stub
		return session.delete(namespace+".cartDeleteAll", users_id);
	}
	
	@Override
	public void countUpdate(int cart_num, int product_count) throws Exception {
	    Map<String, Object> paramMap = new HashMap<>();
	    paramMap.put("cart_num", cart_num);
	    paramMap.put("product_count", product_count);

	    session.update(namespace + ".countUpdate", paramMap);
	}
	
}
