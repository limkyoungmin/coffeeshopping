package com.novocozy.persistence;

import java.util.List;
import java.util.Map;

import com.novocozy.domain.FaqVO;

public interface FaqDAO {
	
	  //public List<FaqVO> faqlist() throws Exception;
	  //수정
	  public List<FaqVO> faqlist(Map<String,Object>map) throws Exception;
	  //2.총레코드수(검색어에 맞는 레코드수까지 포함)
	  public int getRowCount(Map<String,Object>map) throws Exception;
	  public void faqcreate(FaqVO vo) throws Exception;
	  public void faqupdate(FaqVO vo) throws Exception;
	  public FaqVO faqread(int faq_num) throws Exception;
	  public void faqdelete(int faq_num) throws Exception;
}
