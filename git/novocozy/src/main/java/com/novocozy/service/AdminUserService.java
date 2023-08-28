package com.novocozy.service;

import java.util.List;

import com.novocozy.domain.UserVO;

public interface AdminUserService {
	public List<UserVO> adminUserList(UserVO userVo) throws Exception;
	public void adminUserDelete(String users_id) throws Exception;
}
