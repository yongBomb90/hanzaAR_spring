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

public class LoginInterceptor extends HandlerInterceptorAdapter {

	private static final String LOGIN = "login";

	private static final Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		HttpSession session = request.getSession();
		
		logger.warn("preHandle   preHandle    preHandle");
		if (session.getAttribute(LOGIN) != null) {
			logger.info("clear");
			
		}

		return true;
	}



	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {

		
		HttpSession session = request.getSession();
		ModelMap modelMap = modelAndView.getModelMap();
		Object dest = session.getAttribute("dest");
		MemberVO MemberVO =(MemberVO) modelMap.get("memberVO");
		System.out.println("dest:::::LoginInterceptor"+dest);
		logger.warn("postHandle   postHandle    postHandle");
		System.out.println("postHandle   postHandle    postHandle");
		
		if(MemberVO == null){
			session.setAttribute("pastlogin", "fail");
			response.sendRedirect((String) (dest = "/login"));;
			
		}else{logger.warn("success");
			logger.warn("success  gubun  "+MemberVO.getGubun());
	
			session.setAttribute(LOGIN, MemberVO);
			if(request.getParameter("userCookie") != null){
			logger.warn("userCookie ...");
			Cookie loginCookie = new Cookie("loginCookie", session.getId());
			loginCookie.setPath("/");
			loginCookie.setMaxAge(60*60*24*7);
			response.addCookie(loginCookie);
			
			}
			
				if(dest == null){
					response.sendRedirect((String) (dest = "/"));;
					System.out.println("dest null");
				}else{
					System.out.println("dest not null");
					response.sendRedirect(dest != null ? (String)dest:"/");

				}
				
				
			
		}
		
		
	}

}
