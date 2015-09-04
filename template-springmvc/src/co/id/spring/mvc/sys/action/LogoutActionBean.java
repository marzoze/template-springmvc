package co.id.spring.mvc.sys.action;

import java.io.Serializable;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import co.id.spring.mvc.action.DashboardActionBean;
import co.id.spring.mvc.sys.util.Constants;

@Controller
@RequestMapping("/logout")
public class LogoutActionBean extends MainActionBean implements Serializable {

	private static final long serialVersionUID = 7220016293646986362L;
	
	private static final Logger log = Logger.getLogger(DashboardActionBean.class);
	
	/**
	 * Remove all sessions
	 * @param model
	 * @return login page
	 */
	@RequestMapping(method = RequestMethod.GET)
	public String proccesLogout(ModelMap model) {
		log.debug(DashboardActionBean.class);	
		super.setSessionTimeout(true);		
		this.removeSessionAttribute(Constants.COMMON.SESSION.USER_SESS);
		this.removeSessionAttribute(Constants.COMMON.SESSION.USER_ID_SESS);
		this.removeSessionAttribute(Constants.COMMON.SESSION.USERNAME_SESS);
		this.removeSessionAttribute(Constants.COMMON.SESSION.LIST_USER_SESS);	
		this.removeSessionAttribute(Constants.COMMON.SESSION.ROLE_SESS);
		this.removeSessionAttribute(Constants.COMMON.SESSION.RIGHT_SESS);
		this.removeSessionAttribute(Constants.COMMON.SESSION.GROUP_SESS);	
		this.removeSessionAttribute(Constants.COMMON.SESSION.IS_BRANCH);
		return Constants.LOGIN.ACTION.REDIRECT_LOGIN;
	}
	
}