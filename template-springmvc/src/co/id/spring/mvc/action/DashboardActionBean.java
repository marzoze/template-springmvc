package co.id.spring.mvc.action;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import co.id.spring.mvc.sys.action.MainActionBean;
import co.id.spring.mvc.sys.util.Constants;

@Controller
@RequestMapping("/dashboard")
public class DashboardActionBean extends MainActionBean {

	private static final long serialVersionUID = 1065364787058201547L;
	private static final Logger log = Logger.getLogger(DashboardActionBean.class);
	
	@RequestMapping(method = RequestMethod.GET)
	public String loadDashboard(ModelMap model) {
		log.debug(DashboardActionBean.class);
		model.addAttribute(Constants.COMMON.MENU.MENU_ACTIVE, Constants.DASHBOARD.MENU.MENU_DASHBOARD);		
		return Constants.DASHBOARD.ACTION.LOAD_DASHBOARD;
	}	
	
}