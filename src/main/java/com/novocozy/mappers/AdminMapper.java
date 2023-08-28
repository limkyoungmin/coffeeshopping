package com.novocozy.mappers;

import org.apache.ibatis.annotations.Mapper;

import com.novocozy.domain.AdminVO;

@Mapper
public interface AdminMapper {
	public AdminVO adminLogin(AdminVO adminVo);
}
