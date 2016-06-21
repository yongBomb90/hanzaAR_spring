
package bit.team42.controller;


import java.util.Date;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import bit.team42.domain.Criteria;
import bit.team42.domain.PageMaker;
import bit.team42.service.NoticeService;
import bit.team42.service.StatsService;
import bit.team42.service.TodayHanzaService;
import bit.team42.domain.MemberVO;
import bit.team42.service.ChildService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

  
   @Inject
   private NoticeService service;
   
   @Inject
   private ChildService cservice;
  
   
   @Inject
   private TodayHanzaService rhService;
   
   @Inject
   private StatsService statsService;
   
   

   private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

   /**
    * Simply selects the home view to render by returning its name.
    */
   @RequestMapping(value = "/", method = RequestMethod.GET)
      public String home(Criteria cri,Model model, HttpServletRequest req) {
	   logger.info("2016/05/27");
      logger.info("home2");
      
      try {
         
         HttpSession temp = req.getSession();
         
         MemberVO user = (MemberVO)temp.getAttribute("login");
         if(user!=null){
            String userid = user.getUserid();
            logger.info(""+cservice.useridlist(userid));
            model.addAttribute("userlist",cservice.useridlist(userid));
            
         }
         
         model.addAttribute("list", service.listAll());
         PageMaker pageMaker = new PageMaker();
         pageMaker.setCri(cri);
         pageMaker.setTotalCount(service.listCountCriteria(cri));

         model.addAttribute("pageMaker", pageMaker);
         
         model.addAttribute("Hanzalist",rhService.getlist(new Date()));

         
 		model.addAttribute("visitToday",statsService.visitTodayCount());
 		model.addAttribute("visitTotal",statsService.visitTotalCount());
 		model.addAttribute("memberCount",statsService.memberTotalCount());
 		model.addAttribute("childCount",statsService.childTotalCount());
 		model.addAttribute("markerCount",statsService.markerTotalCount());
 		model.addAttribute("hanzaCount",statsService.hanzaTotalCount());
         
         
      } catch (Exception e) {
         e.printStackTrace();
      }
      
      return "home2";

   }
   

   @RequestMapping(value = "/team42", method = RequestMethod.GET)
   public void homepage() {
      logger.info("team42");

   }
   
   @RequestMapping(value = "/m.home", method = RequestMethod.GET)
   public String mobilehome() {
      logger.info("team42");
	return "mobilehome";

   }



}

   