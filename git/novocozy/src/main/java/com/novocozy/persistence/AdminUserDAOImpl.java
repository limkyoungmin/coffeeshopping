package com.novocozy.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.novocozy.domain.UserVO;

@Repository
public class AdminUserDAOImpl implements AdminUserDAO {
	
	@Autowired
	private SqlSession session;
	
	private static String namespace = "com.novocozy.mappers.AdminUserMapper";
	
	@Override
	public List<UserVO> adminUserList(UserVO userVo) throws Exception {
		return session.selectList(namespace + ".userList", userVo);
	}
	
	@Override
	public void adminUserDelete(String users_id) throws Exception {
		session.update(namespace + ".userDelete", users_id);
	}
}
