package bit.team42.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.util.WebUtils;

import bit.team42.domain.ChildCriteria;
import bit.team42.domain.ChildVO;
import bit.team42.domain.Criteria;
import bit.team42.domain.HanzaSearchType;
import bit.team42.domain.HanzaVO;
import bit.team42.domain.MemberVO;
import bit.team42.domain.MobileCriteria;
import bit.team42.domain.SearchCriteria;
import bit.team42.dto.LoginDTO;
import bit.team42.service.ChildService;
import bit.team42.service.HanzaService;
import bit.team42.service.MemberService;

@Controller
@RequestMapping("/mobile")
public class MobileController {

	private static final Logger logger = LoggerFactory.getLogger(MobileController.class);

	@Inject
	private HanzaService hservice;

	@Inject
	private MemberService service;

	@Inject
	private ChildService cservice;

	@RequestMapping(value = "/hanza/{grade},{page}", method = RequestMethod.GET)
	public String HanzaHome(Model model, HanzaVO vo, MobileCriteria cri, HttpServletRequest req, String userid,
			String token) {
		logger.info("" + cri);

		List<HanzaVO> list = hservice.mobileHanzalist(cri, vo);
		model.addAttribute("list", list);
		model.addAttribute("pagemaker", cri);
		model.addAttribute("past", list.get(0).getGrade());
		model.addAttribute("depth", cri.getPage());
		Cookie ck[] = req.getCookies();
		for (Cookie cookie : ck) {
			logger.info("--------------------------" + cookie.getName());
		}

		return "mobile/mobilehanzalist";

	}

	@RequestMapping(value = "/hanza/searchlist/{page}", method = RequestMethod.GET)
	public String search(Model model, HanzaSearchType searchtype, MobileCriteria cri) {
		cri = hservice.searchmobilecnt(cri, searchtype);
		List<HanzaVO> list = hservice.mobilesearchlist(cri, searchtype);

		model.addAttribute("searchvo", searchtype);
		model.addAttribute("pagemaker", cri);
		model.addAttribute("list", list);
		return "mobile/mobilesearchlist";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ResponseEntity<String> login(LoginDTO dto, String token, HttpSession session, HttpServletResponse response) {
		MemberVO vo = new MemberVO();
		try {
			vo = service.login(dto);
			if (vo == null) {
				return new ResponseEntity<String>("wrong Password or ID", HttpStatus.FAILED_DEPENDENCY);
			}
			vo.setToken(token);
			service.updatetoken(vo);
			session.setAttribute("login", service.readOne(vo.getUserid()));
		} catch (Exception e) {
			e.printStackTrace();
			logger.info("에러발생");

			return new ResponseEntity<String>("fail", HttpStatus.FAILED_DEPENDENCY);
		}
		return new ResponseEntity<String>("sucess", HttpStatus.OK);
	}

	@RequestMapping(value = "/loginout", method = RequestMethod.GET)
	public ResponseEntity<String> loginout(HttpServletRequest request, HttpSession session,
			HttpServletResponse response) {
		try {
			session.removeAttribute("login");
			session.removeAttribute("clogin");
			session.invalidate();
			Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
			if (loginCookie != null) {
				loginCookie.setPath("/");
				loginCookie.setMaxAge(0);
				response.addCookie(loginCookie);
			}
		} catch (Exception e) {
			e.printStackTrace();
			logger.info("에러발생");

			return new ResponseEntity<String>("fail", HttpStatus.FAILED_DEPENDENCY);
		}
		return new ResponseEntity<String>("sucess", HttpStatus.OK);
	}

	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String mobileHome(Model model, String userid, String token, HttpSession session,
			HttpServletResponse response) {
		try {

			MemberVO vo = service.readOne(userid);
			if (vo.getToken().equals(token)) {
				session.setAttribute("login", vo);
				LoginDTO dto = new LoginDTO();
				logger.info("" + vo.getChoice());
				ChildVO cvo = cservice.read(vo.getChoice());
				logger.info("" + cvo);
				session.setAttribute("clogin", cvo);
				Cookie loginCookie = new Cookie("loginCookie", session.getId());
				loginCookie.setPath("/");
				loginCookie.setMaxAge(60 * 60 * 24 * 7);
				response.addCookie(loginCookie);
				model.addAttribute("childvo", cvo);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return "mobile/home";

	}

	@RequestMapping(value = "gradedepth/{grade},{page}", method = RequestMethod.GET)
	public String gradedepth(Model model, HanzaVO vo, @PathVariable("page") int page, Criteria cri,
			HttpServletRequest req) {
		int grade, deep;
		HttpSession temp = req.getSession();
		ChildVO child = (ChildVO) temp.getAttribute("clogin");
		if (child == null) {
			return "redirect:/user/child/list/1";
		}
		logger.info("" + cri);
		if (vo.getGrade() != 0 || page != 0) {
			grade = vo.getGrade();
			deep = cri.getPage();
		} else {
			grade = child.getClevel();
			deep = child.getDeep();
		}

		List<HanzaVO> list = new ArrayList<HanzaVO>();
		list = hservice.selbygrade(vo, cri);
		model.addAttribute("grade", grade);
		model.addAttribute("deep", deep);
		model.addAttribute("childVO", child);
		logger.info("--------childVO--------" + child);
		return "mobile/grade";
	}

	@RequestMapping(value = "study/{grade},{page}", method = RequestMethod.GET)
	public String study(Model model, HanzaVO vo, Criteria cri) {
		List<HanzaVO> list = new ArrayList<HanzaVO>();
		list = hservice.selbygrade(vo, cri);
		model.addAttribute("list", list);
		model.addAttribute("past", list.get(0).getGrade());
		model.addAttribute("depth", cri.getPage());
		return "mobile/studyui";
	}

	@RequestMapping(value = "/childlist/{page}", method = RequestMethod.GET)
	public String choice(Model model, HttpServletRequest req, ChildCriteria cri) throws Exception {
		HttpSession temp = req.getSession();
		MemberVO user = (MemberVO) temp.getAttribute("login");
		String userid = user.getUserid();
		cri = cservice.userchildlistcnt(userid, cri);
		if (cri == null) {
			return "redirect:/login";
		}
		List<ChildVO> list = cservice.userchildlist(userid, cri);
		model.addAttribute("MemberVO", service.readOne(userid));
		model.addAttribute("list", list);
		model.addAttribute("cri", cri);
		return "mobile/childlist";
	}

	@RequestMapping(value = "child/register", method = RequestMethod.GET)
	public String registerGET(ChildVO child, Model model, HttpServletRequest req) throws Exception {
		HttpSession temp = req.getSession();
		MemberVO user = (MemberVO) temp.getAttribute("login");
		String userid = user.getUserid();
		model.addAttribute("MemberVO", service.readOne(userid));
		return "mobile/register";
	}

	@RequestMapping(value = "child/register", method = RequestMethod.POST)
	public ResponseEntity<String> registerPOST(ChildVO child, MultipartFile file, HttpServletRequest req)
			throws Exception {
		HttpSession temp = req.getSession();
		MemberVO user = (MemberVO) temp.getAttribute("login");
		child.setImgpath("/resources/img/defaultchild.png");
		child.setS_imgpath("/resources/img/defaultchild.png");
		cservice.regist(child, user.getUserid());
		return new ResponseEntity<String>("success", HttpStatus.OK);

	}

	@RequestMapping(value = "/userread", method = RequestMethod.GET)
	public String read(Model model, @ModelAttribute("cri") SearchCriteria cri, HttpServletRequest req)
			throws Exception {
		HttpSession temp = req.getSession();
		MemberVO user = (MemberVO) temp.getAttribute("login");
		String userid = user.getUserid();
		MemberVO userInfo = service.readOne(userid);
		String email = userInfo.getEmail();
		int idx = userInfo.getEmail().indexOf("@");
		String head = email.substring(0, idx);
		String tail = email.substring(idx);
		model.addAttribute("MemberVO", userInfo);
		model.addAttribute("head", head);
		model.addAttribute("tail", tail);
		return "mobile/read";
	}

	@RequestMapping(value = "chat", method = RequestMethod.GET)
	public String chat(Model model, HanzaVO vo, Criteria cri) {
		return "mobile/mobilechat";
	}
	@RequestMapping(value = "/msg/{page}", method = RequestMethod.GET)
	public String msg(Model model, HttpServletRequest req, ChildCriteria cri) throws Exception {
		HttpSession temp = req.getSession();
		MemberVO user = (MemberVO) temp.getAttribute("login");
		String userid = user.getUserid();
		cri = cservice.userchildlistcnt(userid, cri);
		if (cri == null) {
			return "redirect:/login";
		}
		List<ChildVO> list = cservice.userchildlist(userid, cri);
		model.addAttribute("MemberVO", service.readOne(userid));
		model.addAttribute("list", list);
		model.addAttribute("cri", cri);
		return "mobile/msg";
	}
	@RequestMapping(value = "/msg", method = RequestMethod.POST)
	public ResponseEntity<String> POSTmsg(Model model, String msg,String userid,int cno,int markerid) throws Exception {
		logger.info(msg+"::"+userid+"::"+cno+"::"+markerid);
		return new ResponseEntity<String>("success", HttpStatus.OK);
	}

}
