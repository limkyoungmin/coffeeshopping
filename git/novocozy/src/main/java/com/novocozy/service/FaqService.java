package com.novocozy.service;

import java.util.Map;

import org.springframework.stereotype.Service;

import com.novocozy.domain.FaqVO;

@Service
public interface FaqService {

	//public List<FaqVO> faqlist() throws Exception;
	public Map<String, Object> faqlist(String keyWord, int currentPage) throws Exception;
	//2.총레코드수(검색어에 맞는 레코드수까지 포함)
	public int getRowCount(Map<String,Object>map) throws Exception;
	public void faqcreate(FaqVO vo) throws Exception;
	public void faqupdate(FaqVO vo) throws Exception;
	public FaqVO faqread(int faq_num) throws Exception;
	public void faqdelete(int faq_num) throws Exception;
}
