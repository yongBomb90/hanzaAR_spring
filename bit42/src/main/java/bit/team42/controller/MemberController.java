package bit.team42.controller;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import bit.team42.domain.MemberVO;
import bit.team42.domain.SearchCriteria;
import bit.team42.service.MemberService;


@Controller
@RequestMapping("/user/*")
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Inject
	private MemberService service;
	
	
	@RequestMapping(value="/register", method=RequestMethod.GET)
	public void registerGet()throws Exception{
		logger.info("register Get.....................");
		
	}
	
	@RequestMapping(value="/register", method=RequestMethod.POST)
	public  ResponseEntity<String> registerPost(MemberVO vo, Model model,RedirectAttributes rttr){
		logger.info("register POST.....................");
		try {
			service.register(vo);
		} catch (Exception e) {
			e.printStackTrace();
			rttr.addFlashAttribute("register", "fail");
			return new ResponseEntity<String>("success", HttpStatus.FAILED_DEPENDENCY);
		}
		
		rttr.addFlashAttribute("register", "success");
		
		return new ResponseEntity<String>("success", HttpStatus.OK);
		
	}
	
	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public void read(Model model,@ModelAttribute("cri")SearchCriteria cri,HttpServletRequest req) throws Exception{
		logger.info("read Marker.....");
		HttpSession temp = req.getSession();
		
		MemberVO user = (MemberVO)temp.getAttribute("login");
		logger.info(""+user);
		String userid = user.getUserid();
		MemberVO userInfo = service.readOne(userid);
		String email = userInfo.getEmail();
		int idx = userInfo.getEmail().indexOf("@");
		String head = email.substring(0, idx);
		String tail = email.substring(idx) ;
		
		model.addAttribute("MemberVO",userInfo);
		model.addAttribute("head", head);
		model.addAttribute("tail", tail);
	}
	


	
	@RequestMapping(value="/update", method=RequestMethod.POST)
	public ResponseEntity<String>  updatePost(MemberVO vo, Model model,RedirectAttributes rttr,SearchCriteria cri){

		logger.info(""+vo);
		
		try {
			service.update(vo);
		} catch (Exception e) {
			
			e.printStackTrace();
		
			return new ResponseEntity<String>("success", HttpStatus.OK);
		}
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		rttr.addFlashAttribute("result", "success");
		
		return new ResponseEntity<String>("success", HttpStatus.OK);
		
	}

	

}
