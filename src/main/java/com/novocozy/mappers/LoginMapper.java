package com.novocozy.mappers;

import org.apache.ibatis.annotations.Mapper;

import com.novocozy.domain.LoginVO;
import com.novocozy.domain.UserVO;

@Mapper
public interface LoginMapper {
	
	public UserVO userlogin(LoginVO loginvo) throws Exception;
	}