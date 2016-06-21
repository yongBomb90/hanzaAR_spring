package bit.team42.controller;

import java.sql.Date;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.util.WebUtils;

import bit.team42.domain.ChildVO;
import bit.team42.domain.MemberVO;
import bit.team42.domain.VisitVO;
import bit.team42.dto.LoginDTO;
import bit.team42.service.MemberService;
import bit.team42.service.StatsService;

@Controller
@RequestMapping("/*")
public class LoginController {
   
   @Inject
   private MemberService service;
   
   @Inject
   private StatsService  vService;
   
   private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
   
   @RequestMapping(value="/login", method=RequestMethod.GET)
   public void loginGet(@ModelAttribute("dto") LoginDTO dto,Model model,HttpSession session,HttpServletRequest request)throws Exception{
      logger.info("login Get.....................");
      logger.info("login Get.....................");
         String str = (String) session.getAttribute("pastlogin");
         model.addAttribute("plogin",str);
         session.removeAttribute("pastlogin");
        
   
   }
   
   @RequestMapping(value="/loginPost", method=RequestMethod.POST)
   public void loginPost(LoginDTO dto, HttpSession session, Model model)throws Exception{
   
      MemberVO vo = service.login(dto);
      if(vo == null){
         return;
         
      }
      logger.info("vo choice::::::::::::::::::"+vo.getChoice());
      int cno = vo.getChoice();
      dto.setCno(cno);
      
      ChildVO cvo = service.clogin(dto);
      logger.info("vo:::::::::::"+vo);
      logger.info("loginPost dto::::::::::::::::::::::"+dto);
 
      VisitVO vvo = new VisitVO();
      vvo.setUserid(vo.getUserid());
      vService.visitInsert(vvo);
      
       // 오늘 방문자 수
      int todayCount = vService.visitTodayCount();
      
      
        // 전체 방문자 수
      int totalCount = vService.visitTotalCount();
      
      
      session.setAttribute("login", vo);
      session.setAttribute("clogin", cvo);
      session.setAttribute("todayCount", todayCount);
      session.setAttribute("totalCount", totalCount);
      
      logger.info("todayCount"+todayCount);
      logger.info("totalCount"+totalCount);

      
      logger.info("session vo :::::::::::::::"+vo);
      logger.info("session cvo :::::::::::::::"+cvo);
      
      model.addAttribute("memberVO", vo);
      model.addAttribute("childVO", cvo);
      
      if(dto.isUserCookie()){
         
         int amount = 60*60*24*7;
         Date sessionLimit = new Date(System.currentTimeMillis()+(1000*amount));
         service.keepLogin(vo.getUserid(), session.getId(), sessionLimit);
         logger.info("isuserCookie::::::::::::::::::::"+dto.isUserCookie());
      
      }
   
      
      
      logger.info("login id,pw:::::::"  +  model.addAttribute("memberVO", vo) );
   }
   
     @RequestMapping(value = "/logout", method = RequestMethod.GET)
     public String logout(HttpServletRequest request, 
         HttpServletResponse response, HttpSession session) throws Exception {

       Object obj = session.getAttribute("login");
       logger.info("LOGOUT:::::::"+ obj);

       if (obj != null) {
         MemberVO vo = (MemberVO) obj;

         session.removeAttribute("login");
         session.invalidate();

         Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");


         if (loginCookie != null) {
           loginCookie.setPath("/");
           loginCookie.setMaxAge(0);
           response.addCookie(loginCookie);
           service.keepLogin(vo.getUserid(), session.getId(), new Date(0));
           
         }
       }
       return "redirect:/login";
       
     }
   
   
   
   

}