package com.novocozy.mappers;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.novocozy.domain.UserVO;

@Mapper
public interface AdminUserMapper {
	public List<UserVO> adminUserList(UserVO userVo) throws Exception;
	public void adminUserDelete(String users_id) throws Exception;
}
