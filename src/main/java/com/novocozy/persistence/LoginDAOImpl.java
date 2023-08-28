package com.novocozy.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.novocozy.domain.LoginVO;

@Repository
public class LoginDAOImpl implements LoginDAO {

	@Inject
	private SqlSession session;
	
	private static String namespace="com.novocozy.mappers.LoginMapper";
	
	@Override
	public LoginVO userlogin(LoginVO loginvo) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+".userlogin", loginvo);
	}
}
