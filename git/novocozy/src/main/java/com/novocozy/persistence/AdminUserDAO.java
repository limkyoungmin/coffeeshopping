package com.novocozy.persistence;

import java.util.List;

import com.novocozy.domain.UserVO;

public interface AdminUserDAO {
	public List<UserVO> adminUserList(UserVO userVo) throws Exception;
	public void adminUserDelete(String users_id) throws Exception;
}
