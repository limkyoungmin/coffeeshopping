package com.novocozy.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.novocozy.persistence.AdminLoginDAO;
import com.novocozy.domain.AdminVO;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	AdminLoginDAO adminDao;
	
	@Override
	public AdminVO adminLogin(AdminVO adminVo) {
		return adminDao.adminLogin(adminVo);
	}

}
