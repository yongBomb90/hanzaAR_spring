package bit.team42.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.xml.ws.Response;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import bit.team42.domain.Criteria;
import bit.team42.domain.MemberVO;
import bit.team42.domain.PageMaker;
import bit.team42.domain.SearchCriteria;
import bit.team42.domain.VisitVO;
import bit.team42.service.StatsService;

@Controller
@RequestMapping("/stats/*")
public class StatsController {

	@Inject
	StatsService statsService;

	private static final Logger logger = LoggerFactory.getLogger(StatsController.class);

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void registerGET(Integer clevel, Model model, HttpServletRequest req, Criteria cri) throws Exception {

		HttpSession temp = req.getSession();
		MemberVO user = (MemberVO) temp.getAttribute("login");
		String userid = user.getUserid();

		VisitVO vo = new VisitVO();
		vo.setUserid(userid);

		model.addAttribute("list", statsService.VisitList(vo));

		model.addAttribute("list", statsService.listCriteria(cri));

		PageMaker pageMaker = new PageMaker();

		pageMaker.setCri(cri);

		pageMaker.setTotalCount(statsService.visitTodayCount());

		model.addAttribute("pageMaker", pageMaker);

		model.addAttribute("visitToday", statsService.visitTodayCount());
		model.addAttribute("visitTotal", statsService.visitTotalCount());
		model.addAttribute("memberCount", statsService.memberTotalCount());
		model.addAttribute("childCount", statsService.childTotalCount());
		model.addAttribute("markerCount", statsService.markerTotalCount());
		model.addAttribute("hanzaCount", statsService.hanzaTotalCount());

	}

	@RequestMapping(value = "/memberStats", method = RequestMethod.GET)
	public void stats(Integer clevel, Model model, HttpServletRequest req, SearchCriteria cri) throws Exception {

	}

	@RequestMapping(value = "/visit", method = RequestMethod.GET)
	public List<VisitVO> visitGetJSON(Criteria cri) throws Exception {

		Map<String, Object> map = new HashMap<>();
		// 현재 방문한 사람들에 대한 정보를 가지고 온다. 10명씩
		// map.put("list", statsService.listCriteria(cri));
		List<VisitVO> lists = statsService.listCriteria(cri);

		for (VisitVO visitVO : lists) {
			logger.info("" + visitVO);
		}
		/*
		 * PageMaker pageMaker = new PageMaker();
		 * 
		 * pageMaker.setCri(cri);
		 * pageMaker.setTotalCount(statsService.visitTodayCount());
		 * map.put("pageMaker", pageMaker);
		 */
		return lists;
	}

}
