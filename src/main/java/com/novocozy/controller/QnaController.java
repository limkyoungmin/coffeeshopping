package com.novocozy.controller;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.novocozy.domain.QnaVO;
import com.novocozy.persistence.QnaDAO;
import com.novocozy.service.QnaService;
import com.novocozy.util.FileUploadUtil;
import com.novocozy.util.PagingUtil;

@Controller
@RequestMapping
public class QnaController {
	
	private Logger log=Logger.getLogger(this.getClass());
	
	@Inject
	QnaService qnaService;
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	//1. 문의게시글 목록
	@RequestMapping("/qna")
	public ModelAndView qnalist() throws Exception{
		List<QnaVO> list= qnaService.qnalist();
		ModelAndView mav=new ModelAndView();
		mav.setViewName("category/board/qna");
		mav.addObject("qnalist", list);
		//System.out.println("controller=>작동된다");
		return mav;
	}
	
	//4.문의게시글 수정 페이지
		@RequestMapping(value="category/board/qnaupdate", method=RequestMethod.POST)	
			public String qnaupdate(@ModelAttribute QnaVO vo,HttpSession session) throws Exception{
			//System.out.println("vo.getUsers_id()=>"+vo.getUsers_id());
			vo.setUsers_id(vo.getUsers_id());//vo.getUsers_id()
			qnaService.qnaupdate(vo);
			//System.out.println("수정완료");
			return "redirect:qnaread?qna_num="+vo.getQna_num();
		}	
	
	//3. 문의게시글 내용 조회
	@RequestMapping(value="category/board/qnaread", method=RequestMethod.GET)
	public ModelAndView qnaread(@RequestParam int qna_num,HttpSession session) throws Exception{
		//System.out.println("여기왔음");
		ModelAndView mav=new ModelAndView();
		mav.setViewName("category/board/qnaread");
		mav.addObject("QnaVO", qnaService.qnaread(qna_num));
		return mav;
	}
	
	//5. 게시글 삭제
	@RequestMapping(value="category/board/qnadelete", method=RequestMethod.GET)
	public String qnadelete(@RequestParam int qna_num) throws Exception{
		qnaService.qnadelete(qna_num);
		//System.out.println("삭제완료");
		return "redirect:/qna";
	}
	
	//임시 추가
	@RequestMapping(value = "passwdQna", method = RequestMethod.POST)
    public String passwdQna(@RequestParam int qna_num,@RequestParam String qna_passwd, Model model) throws Exception {
		System.out.println(qna_num);
		System.out.println(qna_passwd);
		  int count = qnaService.passwdQna(qna_num, qna_passwd);

        if (count > 0) {
            // 데이터가 존재하는 경우 qna read로 이동
            return "redirect:category/board/qnaread?qna_num="+ qna_num;
        } else {
            // 데이터가 없는 경우 메시지를 모델에 담아서 페이지를 리턴
            model.addAttribute("message", "암호가 일치하지않습니다.");
            return "redirect:/qna"; // "no_data_page"는 데이터 없을 때 보여줄 페이지의 뷰 이름
        }
    }
	
	//6.이미지업로드
	   @RequestMapping(value = "qnawrite", method = RequestMethod.POST)
	   public String productWrite(@ModelAttribute QnaVO qnaVo, Model model, MultipartFile file) throws Exception {
	      String imgUploadPath = uploadPath + "/" + "images";
	      // String imgUploadPath = uploadPath + File.separator + "image";
	      String ymdPath = FileUploadUtil.calcPath(imgUploadPath);
	      String fileName = null;
	      
	      System.out.println("qnatitle : " + qnaVo.getQna_title());
	      System.out.println("qnacontent : " + qnaVo.getQna_content());
	      System.out.println("file name : " + fileName);

	      if(file != null && !file.isEmpty()) {
	         fileName = FileUploadUtil.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
	         
	         qnaVo.setQna_img("/" + "images" + ymdPath + "/" + fileName);
	      } else {
	         fileName = uploadPath + "/" + "images" + "/" + "none.png";
	         
	         qnaVo.setQna_img(fileName);
	      }
	      
	      qnaService.qnacreate(qnaVo);
	      
	      return "redirect:/qna";
	   }
	   
	   @Autowired
		private QnaDAO qnaDAO;
		
		@RequestMapping("/qna/qnalist")
		public @ResponseBody ModelAndView process
		(@RequestParam(value="pageNum",defaultValue="1") int currentPage,//현재 전달받은 페이지번호
		 @RequestParam(value="keyField",defaultValue="") String keyField,//검색분야
		 @RequestParam(value="keyWord",defaultValue="") String keyWord) {
		
			if(log.isDebugEnabled()) {//로그객체가 디버깅모드상태라면
				System.out.println("/qna/qnalist.do 요청중...");//? X
				log.debug("currentPage=>"+currentPage);//>? O
				log.debug("keyField=>"+keyField);
				log.debug("keyWord=>"+keyWord);
			}
			//검색분야,검색어->parameterType="map"(Map객체)
			Map<String,Object>map=new HashMap<String,Object>();
			//<->map.get("키명("keyField"))  #{keyField} ->MyBatis에서 넣는법
			map.put("keyField", keyField);// 검색분야, 받을때 키값을 쉽게 알기 위해 키와 벨류값을 같게준다#{keyWord}
			map.put("keyWord", keyWord);//검색어
			//총레코드수
			int count=qnaDAO.getRowCount(map);		
			System.out.println("QnaController의 count=>"+count);
			//페이징처리(1.현재페이지  2.총레코드수  3.페이지당 게시물수(기본10개)  4.블럭당 페이지수  5.요청명령어 지정
			PagingUtil page=new PagingUtil(currentPage,count,10,10,"list.do");
			//start =>페이지당 맨 첫번째 나오는 게시물번호
			//end ->마지막 게시물 번호
			map.put("start", page.getStartCount());
			//<->map.get("start")=>#{start}
			map.put("end", page.getEndCount());
			
			List<QnaVO> list=null;
			if(count>0) {
				list=qnaDAO.qnalist(map);//keyField,keyWord,start,end
			}else {
				list=Collections.EMPTY_LIST;//0 적용
			}
			//페이지 이동=>데이터 공유해서 전달			이동할 페이지명
			ModelAndView mav=new ModelAndView("qna");
			mav.addObject("count",count);//총레코드수
			mav.addObject("qna", list);//검색된 레코드 리스트
			//<a href="~">
			mav.addObject("pagingHtml",page.getPagingHtml());
			System.out.println("pagingHtml"+keyField);
			System.out.println("pagingHtml"+uploadPath);
			
			return mav;//qnaList.jsp로 이동(영역이름=페이지이름)
		}
}
