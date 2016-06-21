package bit.team42.controller;


import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.util.WebUtils;

import bit.team42.domain.BoardVO;
import bit.team42.domain.ChildCriteria;
import bit.team42.domain.ChildVO;
import bit.team42.domain.Criteria;
import bit.team42.domain.HanzaSearchType;
import bit.team42.domain.HanzaVO;
import bit.team42.domain.MemberVO;
import bit.team42.domain.MobileCriteria;
import bit.team42.domain.MsgVO;
import bit.team42.domain.SearchCriteria;
import bit.team42.dto.LoginDTO;
import bit.team42.service.ChildService;
import bit.team42.service.HanzaService;
import bit.team42.service.MemberService;
import bit.team42.service.MsgService;

@Controller
@RequestMapping("/mobliemsg")
public class MoblieMsg {
	
	private static final Logger logger = LoggerFactory.getLogger(MobileController.class);

	
	@Inject
	private MemberService mservice;

	@Inject
	private ChildService cservice;
	
	@Inject
	private MsgService service;
	
	@RequestMapping(value = "{page}", method = RequestMethod.GET)
	public String msg(Model model, HttpServletRequest req, ChildCriteria cri) throws Exception {
		HttpSession temp = req.getSession();
		MemberVO user = (MemberVO) temp.getAttribute("login");
		String userid = user.getUserid();
		cri = cservice.userchildlistcnt(userid, cri);
		if (cri == null) {
			return "redirect:/login";
		}
		List<ChildVO> list = cservice.userchildlist(userid, cri);
		model.addAttribute("MemberVO", mservice.readOne(userid));
		model.addAttribute("list", list);
		model.addAttribute("cri", cri);
		return "mobile/msg/msg";
	}
	@RequestMapping(value = "/list/{cno},{page}", method = RequestMethod.GET)
	public String childlist( MsgVO vo, MobileCriteria cri, Model model){
		try {
			cri = service.selectbycnocnt(vo,cri);
			List<MsgVO> list = service.selectbycno(vo,cri);
			model.addAttribute("list",list);
			model.addAttribute("pagemaker",cri);
			model.addAttribute("past",vo.getCno());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "mobile/msg/list";
	}
	
}
