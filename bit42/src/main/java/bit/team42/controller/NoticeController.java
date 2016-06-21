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
import bit.team42.domain.NoticeVO;
import bit.team42.domain.PageMaker;
import bit.team42.service.MemberService;
import bit.team42.service.NoticeService;

@Controller
@RequestMapping("/notice/*")
public class NoticeController {

	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);

	@Inject
	private NoticeService service;

	@Inject
	private MemberService mservice;

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void registerGET(HttpServletRequest req, Model model) throws Exception {
		logger.info("....registerGET......");

		HttpSession temp = req.getSession();

		MemberVO user = (MemberVO) temp.getAttribute("login");

		String userid = user.getUserid();
		logger.info("register......... " + userid);

		model.addAttribute("MemberVO", mservice.readOne(userid));
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registerPOST(NoticeVO vo, RedirectAttributes rttr) throws Exception {
		logger.info("....registerPOST......");

		service.insertNotice(vo);

		rttr.addFlashAttribute("msg", "success");

		return "redirect:/notice/list";

	}

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void listAll(Criteria cri, Model model) throws Exception {
		logger.info("list All.....");
		model.addAttribute("list", service.listCriteria(cri));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.listCountCriteria(cri));

		model.addAttribute("pageMaker", pageMaker);
	}

	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public void read(@RequestParam("nno") int nno, @ModelAttribute("cri") Criteria cri, Model model,
			HttpServletRequest req) throws Exception {
		logger.info("read Notice.....");

		model.addAttribute(service.readNotice(nno));
	}

	@RequestMapping(value = "/remove", method = RequestMethod.POST)
	public String remove(@RequestParam("nno") int nno, Criteria cri, RedirectAttributes rttr) throws Exception {
		logger.info("remove Notice.....");
		service.removeNotice(nno);
		;

		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addFlashAttribute("msg", "success");

		return "redirect:/notice/list";
	}

	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public void modifyGET(int nno, @ModelAttribute("cri") Criteria cri, Model model) throws Exception {
		logger.info("modifyGET Notice.....");
		model.addAttribute(service.readNotice(nno));
	}

	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modifyPOST(NoticeVO vo, Criteria cri, RedirectAttributes rttr) throws Exception {
		logger.info("modifyPOST Marker.....");

		service.modifyNotice(vo);

		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addFlashAttribute("msg", "SUCCESS");

		return "redirect:/notice/list";
	}

}
