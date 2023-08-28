package com.novocozy.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.novocozy.domain.OrderDetailVO;
import com.novocozy.domain.OrderVO;

@Repository
public class OrderDAOImple implements OrderDAO {

	@Inject
	private SqlSession session;
	
	private static String namespace="com.novocozy.mappers.OrderMapper";
	
	@Override
	public int insertOrder(OrderVO orderVO) throws Exception {
		// TODO Auto-generated method stub
		return session.insert(namespace+".insertOrder",orderVO);
	}
	
	@Override
	public void insertOrderDetail(OrderDetailVO orderdetailVO) throws Exception {
		// TODO Auto-generated method stub
		session.insert(namespace+".insertOrderDetail",orderdetailVO);
	}
	
	@Override
	public void resetCart(String users_id) throws Exception {
		// TODO Auto-generated method stub
		session.delete(namespace+".resetCart",users_id);
	}
	
}
