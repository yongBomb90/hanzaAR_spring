package bit.team42.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import bit.team42.domain.ChildVO;
import bit.team42.domain.Criteria;
import bit.team42.domain.HanzaVO;
import bit.team42.service.HanzaService;

@Controller
@RequestMapping("/play")
public class PlayController {
	
	private static final Logger logger = LoggerFactory.getLogger(PlayController.class);
	
	@Inject
	private HanzaService hservice;

	@RequestMapping(value = "/card/{grade}", method = RequestMethod.GET)
	public String webtest(Model model,@PathVariable("grade")int grade,HttpServletRequest res){
		ChildVO vo = (ChildVO)res.getAttribute("clogin");
		model.addAttribute("childvo", vo);
		
		model.addAttribute("grade", grade);
		if(grade==7){
			return "play/card7";
		}
		return "play/card";
		
	}


	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String Home(Model model,HttpServletRequest res){
		ChildVO vo = (ChildVO)res.getSession().getAttribute("clogin");
		model.addAttribute("childvo", vo);
		model.addAttribute("grade", 8);
		if(vo == null){
			return "redirect:/user/child/list/0";
		}
		return "play/home";
		
	}
	
	 @RequestMapping(value = "voice/study/{grade},{page}", method = RequestMethod.GET)
	   public String study(Model model,HanzaVO vo,Criteria cri){
	      List<HanzaVO> list = new ArrayList<HanzaVO>();
	      list = hservice.selbygrade(vo,cri);
	      model.addAttribute("list", list);
	      model.addAttribute("past",list.get(0).getGrade());
	      model.addAttribute("depth", cri.getPage());
	      return "play/voice/studyui";
	   }
	   
	   
	   
	   @RequestMapping(value = "voice/gradedepth/{grade},{page}", method = RequestMethod.GET)
	   public String gradedepth(Model model,HanzaVO vo,@PathVariable("page")int page,Criteria cri,HttpServletRequest req){
		  int grade,deep;
		  HttpSession temp = req.getSession();
		  
		  ChildVO child = (ChildVO)temp.getAttribute("clogin");
	      if(child == null){

	  		return "redirect:/user/child/list/1";
	      }
		  
		  
		  logger.info(""+cri);
	      
	      if(vo.getGrade() != 0 || page !=0){
	    	  grade = vo.getGrade();
	    	  deep = cri.getPage();
	      }else{
	    	  grade = child.getClevel();
	    	  deep = child.getDeep();
	      }
	      
	      List<HanzaVO> list = new ArrayList<HanzaVO>();
	      list = hservice.selbygrade(vo,cri);
	       
	      model.addAttribute("grade",grade);
	      model.addAttribute("deep",deep);
	      model.addAttribute("childVO",child);
	      logger.info("--------childVO--------"+child);
	      return "play/voice/grade";
	   }
	   
	   
	   @RequestMapping(value = "voice/block/{grade},{page}", method = RequestMethod.GET)
	   public String block(Model model,HanzaVO vo,Criteria cri){
		   	  List<HanzaVO> list = new ArrayList<HanzaVO>();
		      list = hservice.selbygrade(vo,cri);
		      model.addAttribute("volist", list);
		      model.addAttribute("grade", vo.getGrade());
		      model.addAttribute("deep", cri.getPage());
		      model.addAttribute("token", cri.getPage());
		      return "play/voice/block";
	   }
	   
	 

}