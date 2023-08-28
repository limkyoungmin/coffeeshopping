package com.novocozy.mappers;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.novocozy.domain.FaqVO;

@Mapper
public interface FaqMapper {
	
		public List<FaqVO> faqlist() throws Exception;
		public void faqcreate(FaqVO vo) throws Exception;
		public void faqupdate(FaqVO vo) throws Exception;
		public FaqVO faqread(int faq_num) throws Exception;
		public void faqdelete(int faq_num) throws Exception;
		
	}