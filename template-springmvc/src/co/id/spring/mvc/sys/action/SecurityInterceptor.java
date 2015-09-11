package co.id.spring.mvc.sys.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import co.id.spring.mvc.domain.MSecUser;
import co.id.spring.mvc.sys.util.Constants;

/**
 * This class represent of Security Filter.
 * 
 * @author FATCHX
 * @category
 * {@code}
 * @web.security-role
 *   role-name=
 * 
 */
public class SecurityInterceptor implements HandlerInterceptor {

	@Override
	public void afterCompletion(HttpServletRequest servletRequest,
			HttpServletResponse servletResponse, Object obj, Exception exception)
			throws Exception {
		// do nothing
	}

	@Override
	public void postHandle(HttpServletRequest servletRequest, HttpServletResponse servletResponse,
			Object obj, ModelAndView mv) throws Exception {
		// do nothing
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
			Object obj) throws Exception {
		boolean isAuthenticated = true;
		HttpSession session 	= request.getSession(false);

		MSecUser user = session != null ?
				(MSecUser) session.getAttribute(Constants.COMMON.SESSION.USER_SESS) : null;
		
		if (user == null) {								
			response.sendRedirect(request.getContextPath() + "/login");					
			isAuthenticated = false;
		} else {			
			isAuthenticated = true;
		}
						
		return isAuthenticated;				
	}

}
