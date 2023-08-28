package com.novocozy.persistence;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.novocozy.domain.FaqVO;

@Repository
public class FaqDAOImpl implements FaqDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static String namespace="com.novocozy.mappers.FaqMapper";
	
	/*
	 * @Override public List<FaqVO> faqlist() throws Exception { 
	 * // TODO Auto-generated method stub return
	 * sqlSession.selectList(namespace+".faqlist"); }
	 */
	
	@Override
	 public List<FaqVO> faqlist(Map<String,Object>map) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".faqlist", map);
	}
	
	@Override
	public int getRowCount(Map<String, Object> map) throws Exception{
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".selectCount", map);
	}
	
	@Override
	public void faqcreate(FaqVO vo) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert(namespace+".faqcreate", vo);
	}
	
	@Override
	public void faqupdate(FaqVO vo) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update(namespace+".faqupdate", vo);
	}
	
	@Override
	public FaqVO faqread(int faq_num) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".faqread", faq_num);
	}
	
	@Override
	public void faqdelete(int faq_num) throws Exception {
		sqlSession.delete(namespace+".faqdelete", faq_num);
	}
	
}
