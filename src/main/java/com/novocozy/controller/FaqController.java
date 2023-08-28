package com.novocozy.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.novocozy.service.FaqService;


@Controller
public class FaqController {

    @Autowired
    private FaqService faqservice;

    /* user faq게시판 목록*/
	@RequestMapping(value="/faq", method=RequestMethod.GET)
    public ModelAndView faqlist(@RequestParam(value="keyWord",defaultValue="") String keyWord,@RequestParam(value="pageNum",defaultValue="1") int currentPage) throws Exception{
        ModelAndView mav = new ModelAndView("faqList");
        Map<String,Object> resultMap=faqservice.faqlist(keyWord,currentPage);
        mav.addObject("count",resultMap.get("count"));//총레코드수
        mav.addObject("faqlist",resultMap.get("faqlist"));//리스트 출력
        mav.addObject("pagingHtml",resultMap.get("PagingHtml"));
        mav.setViewName("/category/board/faq");
        //System.out.println("리스트 출력됨"); test
        return mav;
    }
	

}
	
