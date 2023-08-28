package com.novocozy.persistence;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.novocozy.domain.UserVO;

@Repository
public class UserDAOImpl implements UserDAO {

	@Inject
	private SqlSession session;
	
	private static String namespace="com.novocozy.mappers.UserMapper";
	
	@Override
	public void userjoin(UserVO vo) throws Exception{
		session.insert(namespace+".userjoin", vo);
	}
	
	@Override
	public int updatemailcode(UserVO vo) throws Exception {
		// TODO Auto-generated method stub
		return session.update(namespace+".updatemailcode", vo);
	}
	
	@Override
	public int updatemailyn(UserVO vo) throws Exception {
		// TODO Auto-generated method stub
		return session.update(namespace+".updatemailyn", vo);
	}
	
	@Override
	public int emailynFail(String users_id) throws Exception {
		// TODO Auto-generated method stub
		return session.update(namespace+".emailynFail", users_id);
	}
	
	@Override
	public int idCheck(UserVO vo) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+".idCheck", vo);
	}
	@Override
	public UserVO userView(String users_id) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+".userView", users_id);
	}
	@Override
	public int updateInfo(UserVO vo) throws Exception {
		// TODO Auto-generated method stub
		return session.update(namespace+".updateInfo", vo);
	}
	@Override
	public String pwCheck(String users_id) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(users_id);
	}
	@Override
	public UserVO findIdP(UserVO vo) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+".findIdP", vo);
	}
	
	@Override
	public UserVO findIdE(UserVO vo) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+".findIdE", vo);
	}
	@Override
	public int resetPwChk(UserVO vo) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+".resetPwChk", vo);
	}
	
	@Override
	public int updatePw(String users_email,String users_id,String users_passwd) throws Exception {
		// TODO Auto-generated method stub
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("users_email", users_email);
		map.put("users_id", users_id);
		map.put("users_passwd", users_passwd);
		return session.update(namespace+".updatePw", map);
	}
	
	//추가
	@Override
	public int deleteUser(UserVO vo) throws Exception {
		// TODO Auto-generated method stub
		return session.update(namespace+".deleteUser", vo);
	}
	
	@Override
	public UserVO getUserInfo(String users_id) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+".getUserInfo", users_id);
	}
}
