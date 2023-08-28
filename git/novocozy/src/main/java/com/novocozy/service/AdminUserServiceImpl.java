package com.novocozy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.novocozy.domain.UserVO;
import com.novocozy.persistence.AdminUserDAO;

@Service
public class AdminUserServiceImpl implements AdminUserService {
	
	@Autowired
	AdminUserDAO userDao;
	
	@Override
	public List<UserVO> adminUserList(UserVO userVo) throws Exception {
		return userDao.adminUserList(userVo);
	}
	
	@Override
	public void adminUserDelete(String users_id) throws Exception {
		userDao.adminUserDelete(users_id);
	}
}
