package com.novocozy.persistence;

import com.novocozy.domain.UserVO;

public interface UserDAO {
	
	public void userjoin(UserVO vo) throws Exception;
	public int updatemailcode(UserVO vo) throws Exception;
	public int updatemailyn(UserVO vo) throws Exception;
	public int emailynFail(String users_id) throws Exception;
	public int idCheck(UserVO vo) throws Exception;
	public UserVO userView(String users_id) throws Exception;
	public int updateInfo(UserVO vo) throws Exception;
	public String pwCheck(String users_id) throws Exception;
	public UserVO findIdP(UserVO vo) throws Exception;
	public UserVO findIdE(UserVO vo) throws Exception;
	public int resetPwChk(UserVO vo) throws Exception;
	public int updatePw(String users_email,String users_id,String users_passwd) throws Exception;
	public int deleteUser(UserVO vo) throws Exception;
	
	//추가
	public UserVO getUserInfo(String users_id) throws Exception;
}
