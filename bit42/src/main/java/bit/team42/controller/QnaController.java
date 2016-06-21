package bit.team42.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import bit.team42.domain.Criteria;
import bit.team42.domain.MemberVO;
import bit.team42.domain.PageMaker;
import bit.team42.domain.QnaVO;
import bit.team42.domain.SearchCriteria;
import bit.team42.service.MemberService;
import bit.team42.service.QReplyService;
import bit.team42.service.QnaService;


@Controller
@RequestMapping("/qna/*")
public class QnaController {

	private static final Logger logger = LoggerFactory.getLogger(QnaController.class);

	@Inject
	private QnaService service;
	
	@Inject
	private QReplyService qservice;
	
	@Inject
	private MemberService mservice;
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void registerGET(HttpServletRequest req, Model model) throws Exception {
		logger.info("....registerGET......");
		
		HttpSession temp = req.getSession();
	      
	    MemberVO user = (MemberVO)temp.getAttribute("login");
	      
	    String userid = user.getUserid();
	    logger.info("register......... " + userid);
	   
	    model.addAttribute("MemberVO",mservice.readOne(userid));
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registerPOST(QnaVO vo, RedirectAttributes rttr) throws Exception {
		logger.info("....registerPOST......");
		
		service.insertQnA(vo);
		
		rttr.addFlashAttribute("msg","success");
		
		return "redirect:/qna/list";

	}
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void listAll(@ModelAttribute("cri")SearchCriteria cri, Model model) throws Exception{
		logger.info("list All.....");
		model.addAttribute("list", service.listSearchCriteria(cri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
		pageMaker.setTotalCount(service.listSearchCount(cri));
		
		model.addAttribute("pageMaker", pageMaker);
	}
	
	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public void read(@RequestParam("qno")int qno,@ModelAttribute("cri") SearchCriteria cri, Model model, HttpServletRequest req) throws Exception{
		logger.info("read QnA.....");
		
		HttpSession temp = req.getSession();
        
        MemberVO user = (MemberVO)temp.getAttribute("login");
         
        String userid = user.getUserid();
      
        model.addAttribute("MemberVO",mservice.readOne(userid));
		model.addAttribute(service.readQnA(qno));
	}
	
	@RequestMapping(value = "/remove", method = RequestMethod.POST)
	public String remove(@RequestParam("qno")int qno, SearchCriteria cri, RedirectAttributes rttr) throws Exception{
		logger.info("remove QnA.....");
		
		qservice.removeAllReply(qno);
		service.removeQnA(qno);;
		
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());

		
		rttr.addFlashAttribute("msg","success");
		
		return "redirect:/qna/list";
	}
	
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public void modifyGET(int qno,@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception{
		logger.info("modifyGET QnA.....");
		model.addAttribute(service.readQnA(qno));
	}
	
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modifyPOST(QnaVO vo, SearchCriteria cri, RedirectAttributes rttr) throws Exception{
		logger.info("modifyPOST Marker.....");
		
		service.modifyQnA(vo);

		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		rttr.addFlashAttribute("msg","SUCCESS");
		
		return "redirect:/qna/list";
	}
	
	

	
}
