package bit.team42.interceptor;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import bit.team42.domain.MemberVO;
import bit.team42.service.MemberService;

public class AuthInterceptor extends HandlerInterceptorAdapter {

	private static final Logger logger = LoggerFactory.getLogger(AuthInterceptor.class);
	@Inject
	private MemberService service;
	
	private void saveDest(HttpServletRequest req) {
		
		System.out.println("saveDest::::::::::::::::::::::::::::::::::::");
		String uri = req.getRequestURI();
		String query = req.getQueryString();
		System.out.println("saveDest::::::::::"+uri);
		System.out.println("saveDest::::::::::"+query);
		
		if (query == null || query.equals("null")) {
			System.out.println("111111111111111111111111111111");
			query = "";

		} else {
			System.out.println("222222222222222222222222222");
			query = "?" + query;
		}

		if (req.getMethod().equals("GET")) {
			System.out.println("33333333333333333333333333333");
			logger.info("dset" + (uri + query));
			req.getSession().setAttribute("dest", uri + query);
			
			System.out.println("dest uri+query::::::::::"+uri + query);
			
		}

	}
	
	
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		System.out.println("Auth preHandle::::::::::::::::::::::::::::::::::::");
		HttpSession session  = request.getSession();
		System.out.println("session::::::::::::::::::::::::::::::::"+session);
		
		if(session.getAttribute("login")== null){
			
			logger.info("not login");
			saveDest(request);
			Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
			
			
			if(loginCookie != null){
				MemberVO memberVO = service.checkLogin(loginCookie.getValue());
				logger.info("MEMBERVO:::::::" + memberVO);
				if(memberVO != null){
			
						session.setAttribute("login", memberVO);
						return true;
					
				}
			}
					
			response.sendRedirect("/login");
			return false;
		}
		
		
		
		return true;
	}
	

}
