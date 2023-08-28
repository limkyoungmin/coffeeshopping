package com.novocozy.service;

import org.springframework.stereotype.Service;

import com.novocozy.domain.LoginVO;

@Service
public interface LoginService {

	public LoginVO userlogin(LoginVO loginvo) throws Exception;
}
