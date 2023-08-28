package com.novocozy.persistence;

import java.util.List;
import java.util.Map;

import com.novocozy.domain.QnaVO;

public interface QnaDAO {

	  public void qnacreate(QnaVO vo) throws Exception;
	  public void adqnaupdate(QnaVO vo) throws Exception;
	  public QnaVO qnaread(int qna_num) throws Exception;
	  public void qnaupdate(QnaVO vo) throws Exception;
	  public void qnadelete(int qna_num) throws Exception;
	  public void adqnadelete(int qna_num) throws Exception;
	  public List<QnaVO> qnalist() throws Exception;
	  //2.총레코드수(검색어에 맞는 레코드수까지 계산)
	  public int getRowCount(Map<String,Object>map);		
	  //3.최대값 번호 구하기
	  public int getNewQna_num();//public int getQnaSeq();
	  //최대값 번호 구하기
      public List<QnaVO> qnalist(Map<String, Object> map);
      
      public int passwdQna(int qna_num,String qna_passwd) throws Exception;
	  
	
}
