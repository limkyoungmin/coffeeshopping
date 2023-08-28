package com.novocozy.persistence;

import com.novocozy.domain.LoginVO;

public interface LoginDAO {
	//로그인에 대한 정보를 loginVO에 담기위해 작성 -> 이상하게 작성하면 캐스팅오류뜸 뜰이유가 전혀 없는 이유인데 뜨니깐 화남
	public LoginVO userlogin(LoginVO loginvo) throws Exception;
}
