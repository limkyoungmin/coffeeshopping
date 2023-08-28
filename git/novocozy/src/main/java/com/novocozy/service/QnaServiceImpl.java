package com.novocozy.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.novocozy.domain.QnaVO;
import com.novocozy.persistence.QnaDAO;

@Service
public class QnaServiceImpl implements QnaService {

	@Autowired
	private QnaDAO dao;
	
	@Override
	public void qnacreate(QnaVO qna) throws Exception {
		// TODO Auto-generated method stub
		dao.qnacreate(qna);
	}
	
	@Override
	public void adqnaupdate(QnaVO qna) throws Exception {
		// TODO Auto-generated method stub
		dao.adqnaupdate(qna);
	}

	@Override
	public QnaVO qnaread(int qna_num) throws Exception {
		// TODO Auto-generated method stub
		return dao.qnaread(qna_num);
	}

	@Override
	public void qnaupdate(QnaVO qna) throws Exception {
		// TODO Auto-generated method stub
		dao.qnaupdate(qna);

	}

	@Override
	public void qnadelete(int qna_num) throws Exception {
		// TODO Auto-generated method stub
		dao.qnadelete(qna_num);
		
	}
	
	@Override
	public void adqnadelete(int qna_num) throws Exception {
		// TODO Auto-generated method stub
		dao.qnadelete(qna_num);
		
	}

	@Override
	public List<QnaVO> qnalist() throws Exception {
		// TODO Auto-generated method stub
		return dao.qnalist();
	}
	
	public int getRowCount(Map<String, Object> map) {
		   // TODO Auto-generated method stub
		   // selectOne -> 레코드 한 개만, 특정 필드(String, int, ...)를 불러올 때도 쓴다.
		   return dao.getRowCount(map); // dao.getRowCount() 메소드 호출
		}

	public int getNewQna_num() {
		   // TODO Auto-generated method stub
		   return dao.getNewQna_num(); // dao.getNewQna_num() 메소드 호출
		}
	
	@Override
	public int passwdQna(int qna_num, String qna_passwd) throws Exception {
		// TODO Auto-generated method stub
		return dao.passwdQna(qna_num,qna_passwd);
	}
}
