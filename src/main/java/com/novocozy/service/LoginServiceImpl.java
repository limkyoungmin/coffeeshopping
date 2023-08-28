package com.novocozy.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.novocozy.domain.LoginVO;
import com.novocozy.persistence.LoginDAO;

@Service
public class LoginServiceImpl implements LoginService {

	@Autowired
	LoginDAO dao;
	
	@Override
	public LoginVO userlogin(LoginVO loginvo) throws Exception {
		// TODO Auto-generated method stub
		return dao.userlogin(loginvo);
	}
}
