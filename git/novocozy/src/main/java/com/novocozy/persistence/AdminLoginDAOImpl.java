package com.novocozy.persistence;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.novocozy.domain.AdminVO;

@Repository
public class AdminLoginDAOImpl implements AdminLoginDAO {
	
	@Autowired
	private SqlSession session;
	
	private static String namespace = "com.novocozy.mappers.AdminMapper";
	
	@Override
	public AdminVO adminLogin(AdminVO adminVo) {
		return session.selectOne(namespace + ".adminLogin", adminVo);
	}

}
