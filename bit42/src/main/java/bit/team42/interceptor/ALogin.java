package bit.team42.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import bit.team42.domain.MemberVO;

public class ALogin extends HandlerInterceptorAdapter {


	private static final String LOGIN = "login";


	private static final Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

	
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute(LOGIN);
		
		
		logger.warn("Admin preHandle::::::::::::::::::::::::::"+memberVO);
		
		if (memberVO != null) {
			logger.info("clear");
			System.out.println("vo 체크=========================");
			if(memberVO.getGubun().equals("u")){
			System.out.println("구분 체크========================="+memberVO.getGubun());
			response.sendRedirect("/");
			return true;
			
			}
			
		}
		return true;
	}
	
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {

		
		HttpSession session = request.getSession();
		ModelMap modelMap = modelAndView.getModelMap();
		MemberVO MemberVO =(MemberVO) modelMap.get("memberVO");
		
		logger.warn("Adim  postHandle   postHandle    postHandle");
		System.out.println("Adim  postHandle   postHandle    postHandle");
		if(MemberVO != null){
			logger.warn("success");
			logger.warn("AD success  gubun  "+MemberVO.getGubun());
			if(MemberVO.getGubun() == "a"){
			session.setAttribute(LOGIN, MemberVO);
			if(request.getParameter("userCookie") != null){
			logger.warn("userCookie 있다...");
			Cookie loginCookie = new Cookie("loginCookie", session.getId());
			loginCookie.setPath("/");
			loginCookie.setMaxAge(60*60*24*7);
			response.addCookie(loginCookie);
			}
			}
			
			
			
			Object dest = session.getAttribute("dest");
			response.sendRedirect(dest != null ? (String)dest:"/");
		
			
		}
		
		
	}

	
}
