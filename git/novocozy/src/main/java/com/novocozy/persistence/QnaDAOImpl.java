package com.novocozy.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.novocozy.domain.QnaVO;

@Repository
public class QnaDAOImpl implements QnaDAO {

	@Inject
	private SqlSession session;
	
	private static String namespace = "com.novocozy.mappers.QnaMapper";
	
	
	@Override
	public void qnacreate(QnaVO vo) throws Exception {
		// TODO Auto-generated method stub
		session.insert(namespace + ".qnacreate", vo);
	}
	
	@Override
	public void adqnaupdate(QnaVO vo) throws Exception {
		// TODO Auto-generated method stub
		session.update(namespace + ".adqnaupdate", vo);
	}

	@Override
	public QnaVO qnaread(int qna_num) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace + ".qnaread", qna_num);
	}

	@Override
	public void qnaupdate(QnaVO vo) throws Exception {
		// TODO Auto-generated method stub
		session.update(namespace + ".qnaupdate", vo);

	}

	@Override
	public void qnadelete(int qna_num) throws Exception {
		// TODO Auto-generated method stub
		session.delete(namespace + ".qnadelete", qna_num);

	}
	
	@Override
	public void adqnadelete(int qna_num) throws Exception {
		// TODO Auto-generated method stub
		session.delete(namespace + ".adqnadelete", qna_num);

	}

	@Override
	public List<QnaVO> qnalist() throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace + ".qnalist");
	}
	
	public int getRowCount(Map<String, Object> map) {
		   // TODO Auto-generated method stub
		   return session.selectOne(namespace + ".selectCount", map); // session.selectOne() 메소드 호출
		}

		public int getNewQna_num() {
		   // TODO Auto-generated method stub
		   return session.selectOne(namespace + ".getNewQna_num"); // session.selectOne() 메소드 호출
		}
		
		@Override
		public List<QnaVO> qnalist(Map<String, Object> map) {
		// TODO Auto-generated method stub
		 return session.selectList(namespace + ".qnalist", map);
		}
		
		@Override
		public int passwdQna(int qna_num,String qna_passwd) throws Exception {
			// TODO Auto-generated method stub
			Map<String, Object> paramMap = new HashMap<>();
	        paramMap.put("qna_num", qna_num);
	        paramMap.put("qna_passwd", qna_passwd);
			return session.selectOne(namespace+".passwdQna", paramMap);
		}
}
