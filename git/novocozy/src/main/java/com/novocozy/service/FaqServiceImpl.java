package com.novocozy.service;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.novocozy.domain.FaqVO;
import com.novocozy.persistence.FaqDAO;
import com.novocozy.util.PagingUtil;

@Service
public class FaqServiceImpl implements FaqService {

	@Inject
	private FaqDAO dao;
	
	/*
	 * @Override public List<FaqVO> faqlist() throws Exception { // TODO
	 * Auto-generated method stub return dao.faqlist(); }
	 */
	@Override
	public Map<String, Object> faqlist(String keyWord,int currentPage) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> resultMap = new HashMap<>();
		Map<String, Object> map = new HashMap<>();
		    map.put("keyWord", keyWord);

		    int count = dao.getRowCount(map);
		    PagingUtil page = new PagingUtil(currentPage, count, 10, 5, "faqList.do");
		    map.put("start", page.getStartCount());
		    map.put("end", page.getEndCount());

		    List<FaqVO> faqlist = null;
		    if (count > 0) {
		        faqlist = dao.faqlist(map);
		    } else {
		        faqlist = Collections.EMPTY_LIST;
		    }
		    
		    resultMap.put("faqlist", faqlist);
		    resultMap.put("count", count);
		    resultMap.put("pagingHtml",page.getPagingHtml());
		    return resultMap;
	}
	
	@Override
	public int getRowCount(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return dao.getRowCount(map);
	}
	
	@Override
	public void faqcreate(FaqVO vo) throws Exception{
		dao.faqcreate(vo);
	}
	
	@Override
	public void faqupdate(FaqVO vo) throws Exception{
		dao.faqupdate(vo);
	}
	
	@Override
	public FaqVO faqread(int faq_num) throws Exception{
		return dao.faqread(faq_num);
	}	
	
	@Override
	public void faqdelete(int faq_num) throws Exception{
		dao.faqdelete(faq_num);
	}
 
}
