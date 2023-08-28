package com.novocozy.mappers;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.novocozy.domain.QnaVO;

@Mapper
public interface QnaMapper {
	   
	      public List<QnaVO> qnalist() throws Exception;
	      public void qnacreate(QnaVO vo) throws Exception;
	      public void adqnaupdate(QnaVO vo) throws Exception;
	      public QnaVO qnaread(int qna_num) throws Exception;
	      public void qnadelete(int qna_num) throws Exception;
	      public QnaVO qnaupdate(QnaVO vo) throws Exception;
	      //추가
	      public int passwdQna(int qna_num,String qna_passwd) throws Exception;
	   }
