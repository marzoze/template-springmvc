package co.id.spring.mvc.sys.action;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * This class represent of Security Filter for POS Tracking Application.
 * 
 */
public class SecurityFilter implements Filter {
	

	@Override
	public void destroy() {
		// do nothing
	}

	@Override
	public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse,
			FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request 				= (HttpServletRequest) servletRequest;
        HttpServletResponse response 			= (HttpServletResponse) servletResponse;        
        filterChain.doFilter(request, response);
	}

	@Override
	public void init(FilterConfig config) throws ServletException {
		// do nothing
	}

}
