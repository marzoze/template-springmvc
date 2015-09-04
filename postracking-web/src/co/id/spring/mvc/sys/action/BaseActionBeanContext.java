package co.id.spring.mvc.sys.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.log4j.Logger;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

public class BaseActionBeanContext extends RequestContextHolder {
	
	@SuppressWarnings("unused")
	private static final Logger log = Logger.getLogger(BaseActionBeanContext.class);
	
	public HttpSession getSession() {
		ServletRequestAttributes attr = (ServletRequestAttributes) currentRequestAttributes();
		return attr.getRequest().getSession();
	}
	
	public HttpServletRequest getRequest() {
		ServletRequestAttributes attr = (ServletRequestAttributes) currentRequestAttributes();
		return attr.getRequest();
	}
	
	public void setCurrent(String key, Object value) {
		getSession().setAttribute(key, value);
	}
	
	public void removeCurrent(String key) {
        getSession().removeAttribute(key);
    }
	
	@SuppressWarnings("unchecked")
	public <T> T getCurrent(String key, T defaultValue) {
		T value = (T) getSession().getAttribute(key);
		if (value == null) {
			value = defaultValue;
			setCurrent(key, value);
		}
		return value;
	}	

}
