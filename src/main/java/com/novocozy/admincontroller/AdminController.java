package com.novocozy.admincontroller;

import java.io.File;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.novocozy.domain.AdminVO;
import com.novocozy.domain.EventVO;
import com.novocozy.domain.FaqVO;
import com.novocozy.domain.NoticeVO;
import com.novocozy.domain.QnaVO;
import com.novocozy.service.AdminService;
import com.novocozy.service.EventService;
import com.novocozy.service.FaqService;
import com.novocozy.service.NoticeService;
import com.novocozy.service.QnaService;
import com.novocozy.util.FileUploadUtil;

@Controller
@RequestMapping
public class AdminController {

	@Autowired
	private FaqService faqService;

	@Autowired
	private AdminService adminService;	
	
	@Autowired
	private NoticeService noticeService;
	
	 @Autowired
	 private QnaService qnaService;
	
	@Autowired
	private EventService eventService;
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	@RequestMapping(value = "admin/main", method = RequestMethod.GET)
	public String main(Locale locale, Model model) {

		return "admin/admin_main";
	}
	
	@RequestMapping(value = "admin/login", method = RequestMethod.GET)
	public String login() {

		return "admin/admin_login";
	}
	
	@RequestMapping(value = "admin/loginCheck", method = RequestMethod.POST)
	public String loginCheck(HttpServletRequest request, HttpServletResponse response, AdminVO adminVo, Model model) throws Exception {
		
		AdminVO vo = adminService.adminLogin(adminVo);
		HttpSession session = request.getSession();
		
		System.out.println("입력한 admin id : " + adminVo.getAdmin_id());
		System.out.println("입력한 admin pwd : " + adminVo.getAdmin_passwd());
		
		System.out.println("vo.id : " + vo.getAdmin_id());
		System.out.println("vo.pwd : " + vo.getAdmin_passwd());
		
		if (vo == null || !adminVo.getAdmin_passwd().equals(vo.getAdmin_passwd())) {
			
			return "redirect:/admin/login";
			
		} else {
			session.setAttribute("admin", vo);
			// model.addAttribute("admin", vo);
			
			return "redirect:/admin/main";
		}
	}
	
	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		
		session.invalidate();
		
		return "redirect:admin/login";
	}
	 
	 /* 관리자페이지 faq글 목록 불러오기*/
	@RequestMapping("admin/adminfaq")
	public ModelAndView adminfaq(@RequestParam(value="keyWord",defaultValue="") String keyWord,@RequestParam(value="pageNum",defaultValue="1") int currentPage) throws Exception{
        ModelAndView mav = new ModelAndView("faqlist");
        Map<String,Object> resultMap=faqService.faqlist(keyWord,currentPage);
        mav.addObject("count",resultMap.get("count"));//총레코드수
        mav.addObject("faqlist",resultMap.get("faqlist"));//리스트 출력
        mav.addObject("pagingHtml",resultMap.get("PagingHtml"));
        mav.setViewName("/admin/admin_faq");
		/* System.out.println("admin_faq Controller 가동중"); */// 테스트용, 값까지 확인하고 싶으면 +faqlist 하면 OK
		return mav;
    }
	
	/* 관리자페이지 faq글 쓰기*/
	@RequestMapping(value="admin/faqWrite", method=RequestMethod.POST)
	public String faqcreate(@ModelAttribute FaqVO vo) throws Exception{
		faqService.faqcreate(vo);
    	//System.out.println("글쓰기 완료!");
    	return "redirect:/admin/adminfaq";	//게시글 리스트로 이동
    }
	
	/* 관리자페이지 faq글 상세보기 */
	@RequestMapping(value="admin/admin_faqdetail", method=RequestMethod.GET)
	public String faqread(@RequestParam("faq_num") int faq_num,Model model) throws Exception{
		FaqVO vo=faqService.faqread(faq_num);
		model.addAttribute("faqread",vo);
		//System.out.println("글조회완료");
		return "/admin/admin_faqdetail";
	}
	
	/*게시글 faq글 수정하기*/
	@RequestMapping(value="admin/faqupdate", method=RequestMethod.POST)
	public String faqupdate(@ModelAttribute FaqVO vo) throws Exception{
		faqService.faqupdate(vo);
		//System.out.println("글 수정 완료");
		return "redirect:/admin/adminfaq";
	}
	
	/* 게시물 삭제하기*/
	@RequestMapping(value="admin/faqdelete", method=RequestMethod.POST)
	public String faqdelete(@RequestParam("faq_num") int faq_num) throws Exception{
		faqService.faqdelete(faq_num);
		//System.out.println("삭제완료");
		return "redirect:/admin/adminfaq";
	}
	
	// 관리자 공지사항 페이지
	@RequestMapping(value = "admin/adminnotice", method = RequestMethod.GET)
	public String adminnotice(Model model, NoticeVO noticeVo) throws Exception {
		
		List<NoticeVO> noticeList = noticeService.noticeList(noticeVo);
		
		 model.addAttribute("noticeList", noticeList);
		
		return "admin/admin_notice";
	}
	
	// 관리자 공지사항 글 작성
	@RequestMapping(value = "admin/noticeWrite", method = RequestMethod.POST)
	public String noticeWrite(@ModelAttribute NoticeVO noticeVo, MultipartFile file, HttpSession session) throws Exception {
		
		// 세션에서 관리자 정보 가져오기
	    AdminVO loggedInAdmin = (AdminVO) session.getAttribute("admin");
	    
	    // 가져온 관리자 정보 활용
	    noticeVo.setAdmin(loggedInAdmin);
		
		String imgUploadPath = uploadPath + "/" + "images";
		// String imgUploadPath = uploadPath + File.separator + "image";
		String ymdPath = FileUploadUtil.calcPath(imgUploadPath);
		String fileName = null;
		
		if(file != null && !file.isEmpty()) {
			fileName = FileUploadUtil.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
			
			noticeVo.setNotice_img("/" + "images" + ymdPath + "/" + fileName);
		} else {
			fileName = uploadPath + "/" + "images" + "/" + "none.png";
			
			noticeVo.setNotice_img(fileName);
		}
		
		noticeService.noticeWrite(noticeVo);
		
		return "redirect:/admin/adminnotice";
	}
	
	// 관리자 공지사항 글 상세
	@RequestMapping(value = "admin/noticedetail", method = RequestMethod.GET)
	public String noticedetail(Model model, @RequestParam("notice_num") int notice_num) throws Exception {
		
		NoticeVO noticeVo = noticeService.noticeDetail(notice_num);
		model.addAttribute("noticedetail", noticeVo);
		
		return "admin/admin_noticedetail";
	}
	
	// 관리자 공지사항 글 수정폼
	@RequestMapping(value = "admin/noticeupdate", method = RequestMethod.GET)
	public String noticeUpdateForm(Model model, @RequestParam("notice_num") int notice_num) throws Exception {
		
		NoticeVO noticeVo = noticeService.noticeDetail(notice_num);
		model.addAttribute("noticeupdate", noticeVo);
		
		return "admin/admin_noticeupdate";
	}
	
	// 관리자 공지사항 글 수정
	@RequestMapping(value = "admin/noticeupdate.do", method = RequestMethod.POST)
	public String noticeUpdate(@ModelAttribute NoticeVO noticeVo, MultipartFile file, HttpServletRequest req) throws Exception {
		
	    String existingImagePath = noticeVo.getNotice_img(); 

	    if (file.getOriginalFilename() != null && !file.getOriginalFilename().equals("")) {
	        new File(uploadPath + existingImagePath).delete();

	        String imgUploadPath = uploadPath + "/" + "images";
	        String ymdPath = FileUploadUtil.calcPath(imgUploadPath);
	        String fileName = FileUploadUtil.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);

	        noticeVo.setNotice_img("/images" + ymdPath + "/" + fileName);
	    }
	    noticeService.noticeUpdate(noticeVo);
		
		return "redirect:/admin/adminnotice";
	}
	
	// 관리자 공지사항 글 삭제
	@RequestMapping(value = "admin/noticedelete", method = RequestMethod.POST)
	public String noticeDelete(@RequestParam int notice_num) throws Exception {
	    
	    NoticeVO noticeVo = noticeService.noticeDetail(notice_num);
	    
	    String existingImagePath = noticeVo.getNotice_img();
	    
	    System.out.println("파일 실제 경로 DB랑 꼭 비교하기 : " + existingImagePath);
	    
	    if (existingImagePath != null && !existingImagePath.isEmpty() && !existingImagePath.endsWith("none.png")) {
	        String fullPath = uploadPath + existingImagePath; // 수정된 부분
	        File imageFile = new File(fullPath);
	        
	        if (imageFile.exists()) {
	            imageFile.delete();
	        }
	    }
	    
	    noticeService.noticeDelete(notice_num);
	    
	    return "redirect:/admin/adminnotice";
	}
	
	// 유저 공지사항 페이지
	@RequestMapping(value = "/notice", method = RequestMethod.GET)
	public String noticeList(Model model, NoticeVO noticeVo) throws Exception {
		
		List<NoticeVO> noticeList = noticeService.noticeList(noticeVo);
		
		 model.addAttribute("noticeList", noticeList);
		
		return "category/board/notice";
	}
	
	// 유저 공지사항 상세 페이지
	@RequestMapping(value = "/noticecontent", method = RequestMethod.GET)
	public String noticeDetail(Model model, @RequestParam("notice_num") int notice_num) throws Exception {
		
		NoticeVO noticeVo = noticeService.noticeDetail(notice_num);
		model.addAttribute("noticedetail", noticeVo);
		
		return "category/board/noticecontent";
	}
	
	// 관리자 이벤트 페이지
	@RequestMapping(value = "admin/adminevent", method = RequestMethod.GET)
	public String adminEventList(Model model, EventVO eventVo) throws Exception {
		
		List<EventVO> eventList = eventService.eventList(eventVo);
		model.addAttribute("eventList", eventList);
		
		return "admin/admin_event";
	}
	
	// 관리자 이벤트 글 쓰기
	@RequestMapping(value = "admin/eventWrite", method = RequestMethod.POST)
	public String eventWrite(@ModelAttribute EventVO eventVo, MultipartFile file, HttpSession session) throws Exception {
		
		// 세션에서 관리자 정보 가져오기
	    AdminVO loggedInAdmin = (AdminVO) session.getAttribute("admin");
	    
	    // 가져온 관리자 정보 활용
	    eventVo.setAdmin(loggedInAdmin);
		
		String imgUploadPath = uploadPath + "/" + "images";
		// String imgUploadPath = uploadPath + File.separator + "image";
		String ymdPath = FileUploadUtil.calcPath(imgUploadPath);
		String fileName = null;

		if(file != null && !file.isEmpty()) {
			fileName = FileUploadUtil.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
			
			eventVo.setEvent_img("/" + "images" + ymdPath + "/" + fileName);
		} else {
			fileName = uploadPath + "/" + "images" + "/" + "none.png";
			
			eventVo.setEvent_img(fileName);
		}
		
		eventService.eventWrite(eventVo);
		
		return "redirect:/admin/adminevent";
	}
	
	// 관리자 이벤트 글 상세
	@RequestMapping(value = "admin/eventdetail", method = RequestMethod.GET)
	public String eventdetail(Model model, @RequestParam("event_num") int event_num) throws Exception {
		
		EventVO eventVo = eventService.eventDetail(event_num);
		model.addAttribute("eventdetail", eventVo);
		
		return "admin/admin_eventdetail";
	}
	
	// 관리자 이벤트 글 수정 폼
	@RequestMapping(value = "admin/eventupdate", method = RequestMethod.GET)
	public String eventUpdateForm(Model model, @RequestParam("event_num") int event_num) throws Exception {
		
		EventVO eventVo = eventService.eventDetail(event_num);
		model.addAttribute("eventupdate", eventVo);
		
		return "admin/admin_eventupdate";
	}
	
	// 관리자 이벤트 글 수정
	@RequestMapping(value = "admin/eventupdate.do", method = RequestMethod.POST)
	public String eventUpdate(@ModelAttribute EventVO eventVo, MultipartFile file, HttpServletRequest req) throws Exception {
		
	    String existingImagePath = eventVo.getEvent_img(); 

	    if (file.getOriginalFilename() != null && !file.getOriginalFilename().equals("")) {
	        new File(uploadPath + existingImagePath).delete();

	        String imgUploadPath = uploadPath + "/" + "images";
	        String ymdPath = FileUploadUtil.calcPath(imgUploadPath);
	        String fileName = FileUploadUtil.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);

	        eventVo.setEvent_img("/images" + ymdPath + "/" + fileName);
	    }
	    eventService.eventUpdate(eventVo);
		
		return "redirect:/admin/adminevent";
	}
	
	// 관리자 이벤트 글 삭제
	@RequestMapping(value = "admin/eventdelete", method = RequestMethod.POST)
	public String eventDelete(@RequestParam int event_num) throws Exception {
	    
	    EventVO eventVo = eventService.eventDetail(event_num);
	    
	    String existingImagePath = eventVo.getEvent_img();
	    
	    System.out.println("파일 실제 경로 DB랑 꼭 비교하기 : " + existingImagePath);
	    
	    if (existingImagePath != null && !existingImagePath.isEmpty() && !existingImagePath.endsWith("none.png")) {
	        String fullPath = uploadPath + existingImagePath; // 수정된 부분
	        File imageFile = new File(fullPath);
	        
	        if (imageFile.exists()) {
	            imageFile.delete();
	        }
	    }
	    
	    eventService.eventDelete(event_num);
	    
	    return "redirect:/admin/adminevent";
	}
	
	// 유저 이벤트 페이지
	@RequestMapping(value = "/event", method = RequestMethod.GET)
	public String eventList(Model model, EventVO eventVo) throws Exception {
		
		List<EventVO> eventList = eventService.eventList(eventVo);
		model.addAttribute("eventList", eventList);
		
		return "category/board/event";
	}
	
	// 유저 이벤트 상세 페이지
	@RequestMapping(value = "/eventcontent", method = RequestMethod.GET)
	public String eventDetail(Model model, @RequestParam("event_num") int event_num) throws Exception {
		
		EventVO eventVo = eventService.eventDetail(event_num);
		model.addAttribute("eventdetail", eventVo);
		
		return "category/board/eventcontent";
	}
	
	
	/* qna 리스트*/
	@RequestMapping("admin/adminqna")
	public ModelAndView adminqna() throws Exception{
		List<QnaVO> list= qnaService.qnalist();
		ModelAndView mav=new ModelAndView();
		mav.setViewName("/admin/adminqna");
		mav.addObject("qnalist", list);
		//System.out.println("controller=>ad작동된다");
		return mav;
	}
	
	//3. 문의게시글 내용 조회
		@RequestMapping(value="admin/adminqnaread", method=RequestMethod.GET)
		public ModelAndView qnaread(@RequestParam int qna_num,HttpSession session) throws Exception{
			ModelAndView mav=new ModelAndView();
			mav.setViewName("/admin/adminqnaread");
			mav.addObject("QnaVO", qnaService.qnaread(qna_num));
			//System.out.println("ad 내용조회 여기왔음");
			return mav;
}
		
		//2. 문의게시글 답변 작성처리
		@RequestMapping(value="admin/adqnaupdate", method=RequestMethod.POST)
		public String adqnaupdate(@ModelAttribute QnaVO vo) throws Exception{
			qnaService.adqnaupdate(vo);
			/*
			 * System.out.println("ad관리자 답변추가 업데이트");
			 * System.out.println("답변"+vo.getQna_adcontent());
			 * System.out.println("vo.getQna_num()=>"+vo.getQna_num());
			 */
			/* return "redirect:adminqnaread?qna_num="+vo.getQna_num(); */
			return "redirect:/admin/adminqna";
		}			
		
		//5. 게시글 삭제
		@RequestMapping(value="admin/adqnadelete", method=RequestMethod.GET)
		public String adqnadelete(@RequestParam int qna_num) throws Exception{
			qnaService.adqnadelete(qna_num);
			//System.out.println("삭제완료");
			return "redirect:/admin/adminqna";
		}
}
	
