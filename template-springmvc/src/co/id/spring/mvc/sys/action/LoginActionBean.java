package co.id.spring.mvc.sys.action;

import java.io.Serializable;
import java.util.List;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.support.SessionStatus;

import co.id.spring.mvc.domain.MSecGroup;
import co.id.spring.mvc.domain.MSecUser;
import co.id.spring.mvc.domain.MUser;
import co.id.spring.mvc.helper.Base64;
import co.id.spring.mvc.helper.DESEncryptor;
import co.id.spring.mvc.sys.util.Constants;

/**
 * 
 * @author FATCHX
 * @session
 *   USER_SESS, USER_ID, USERNAME_SESS, LIST_USER_SESS, ROLE_SESS, RIGHT, GROUP_SESS
 *
 */
@Controller
@RequestMapping("/login")
public class LoginActionBean extends MainActionBean implements Serializable {	
	
	private static final long serialVersionUID = 1439267881554352199L;
	private static final Logger log = Logger.getLogger(LoginActionBean.class);	

	@RequestMapping(method = RequestMethod.GET)
	public String loadLogin(ModelMap model){
		model.addAttribute("user", new MUser());
		return Constants.LOGIN.ACTION.LOGIN;
	}
	
	/**
	 * @param user
	 * @param result
	 * @param status
	 * @return
	 */
	@RequestMapping(method = RequestMethod.POST)
	public String proccesLogin(
			@ModelAttribute("user") MSecUser user, 
			BindingResult result, 
			SessionStatus status){
		
		log.debug(LoginActionBean.class);
		
		/* Remove Active Session */
		this.removeSessionAttribute(Constants.COMMON.LOGIN_SESSION);
		/* Set New Session */
		this.setSessionAttribute(Constants.COMMON.LOGIN_SESSION, true);
		boolean isValid = true;
		
		/* Login authentication begin here */		 
		if(!StringUtils.hasText(user.getUserName()) 
				&& !StringUtils.hasText(user.getPassword())){
			isValid = false;
			result.rejectValue(Constants.LOGIN.VALIDATION.USERNAME, 
					Constants.LOGIN.ERROR.USERNAME_PASSWORD_REQUIRED, null);
			
		} else if(StringUtils.hasText(user.getUserName())
				&& !StringUtils.hasText(user.getPassword())){
			isValid = false;
			result.rejectValue(Constants.LOGIN.VALIDATION.USERNAME, 
					Constants.LOGIN.ERROR.USERNAME_REQUIRED, null);
			
		} else if(!StringUtils.hasText(user.getUserName())
				&& StringUtils.hasText(user.getPassword())){
			isValid = false;
			result.rejectValue(Constants.LOGIN.VALIDATION.PASSWORD, 
					Constants.LOGIN.ERROR.PASSWORD_REQUIRED, null);
			
		} else isValid = true;
		
		if(isValid){
			String password = new String(user.getPassword().trim());
			byte [] StringToByte = password.getBytes();
			
			/* encrypt processing to compare with existing password  */
			try {
				StringToByte = DESEncryptor.encrypt(StringToByte);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			/* Check to DB*/
			List<MSecUser> users = this
					.getUserService()
					.getUserByUsernameAndPassword(user.getUserName(), 
							Base64.encodeToString(StringToByte, false).trim());
			
			if(users.size() > 0){
				this.secUserRights(users);
				if(this.getSecRoles().size() > 0){
					this.setSessionAttribute(Constants.COMMON.SESSION.USER_SESS, users.get(0));
					this.setSessionAttribute(Constants.COMMON.SESSION.USER_ID_SESS, users.get(0).getSecUserId());
					this.setSessionAttribute(Constants.COMMON.SESSION.USERNAME_SESS, users.get(0).getEmployee().getFirstName());
					this.setSessionAttribute(Constants.COMMON.SESSION.LIST_USER_SESS, users);
					this.setSessionAttribute(Constants.COMMON.SESSION.ROLE_SESS, this.getSecRoles());				
					this.setSessionAttribute(Constants.COMMON.SESSION.RIGHT_SESS, this.getSecRights());
					this.setSessionAttribute(Constants.COMMON.SESSION.GROUP_SESS, this.getSecGroups());	
					this.setSessionAttribute(Constants.COMMON.SESSION.IS_BRANCH, false);
					for(MSecGroup obj: this.getSecGroups()){	
						if(obj.getShortdescription().equals(Constants.COMMON.BRANCH_USER))
							this.setSessionAttribute(Constants.COMMON.SESSION.IS_BRANCH, true);
					}
					status.setComplete();
					return Constants.LOGIN.ACTION.REDIRECT_DASHBOARD;
				}else{
					result.rejectValue(Constants.LOGIN.VALIDATION.USERNAME, 
							Constants.LOGIN.ERROR.LOGIN_ERROR, null);				
					return Constants.LOGIN.ACTION.LOGIN;
				}
			} else {
				result.rejectValue(Constants.LOGIN.VALIDATION.USERNAME, 
						Constants.LOGIN.ERROR.USERNAME_PASSWORD_INVALID, null);				
				return Constants.LOGIN.ACTION.LOGIN;
			}	
		} else {			
			return Constants.LOGIN.ACTION.LOGIN;			
		}
					
	}	

}