package co.id.spring.mvc.sys.action;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import co.id.spring.mvc.action.AttachmentActionBean;
import co.id.spring.mvc.domain.MSecGroup;
import co.id.spring.mvc.domain.MSecGroupRight;
import co.id.spring.mvc.domain.MSecRight;
import co.id.spring.mvc.domain.MSecRole;
import co.id.spring.mvc.domain.MSecRoleGroup;
import co.id.spring.mvc.domain.MSecUser;
import co.id.spring.mvc.domain.MSecUserRole;
import co.id.spring.mvc.service.UserService;

/**
 * @author FATCHX
 */
public class MainActionBean extends AttachmentActionBean implements Serializable {	

	private static final long serialVersionUID = -1330271934385248019L;
	private static final Logger log = Logger.getLogger(MainActionBean.class);
	
	@Autowired
	private UserService userService;	
	private List<MSecRole> secRoles;
	private List<MSecRight> secRights;
	private List<MSecGroup> secGroups;

	public ModelMap list(){
		return new ModelMap(userService.getUser());
	}
	
	public List<MSecRole> getSecRoles() {
		return secRoles;
	}
	
	public void setSecRoles(List<MSecRole> secRoles) {
		this.secRoles = secRoles;
	}

	public List<MSecRight> getSecRights() {
		return secRights;
	}

	public void setSecRights(List<MSecRight> secRights) {
		this.secRights = secRights;
	}

	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}	
	
	public List<MSecGroup> getSecGroups() {
		return secGroups;
	}

	public void setSecGroups(List<MSecGroup> secGroups) {
		this.secGroups = secGroups;
	}

	protected void secUserRights(List<MSecUser> users){
		log.info(MainActionBean.class);
		List<MSecRole> roles 				= new ArrayList<MSecRole>();
		List<MSecUserRole> secRoles 		= new ArrayList<MSecUserRole>();
		List<Long> secRoleId 				= new ArrayList<Long>();
		List<MSecRoleGroup> roleGroups 		= new ArrayList<MSecRoleGroup>();
		List<MSecGroup> groups 				= new ArrayList<MSecGroup>();
		List<Long> secRoleGroupId 			= new ArrayList<Long>();
		List<MSecGroupRight> groupRights 	= new ArrayList<MSecGroupRight>();
		List<MSecRight> rights 				= new ArrayList<MSecRight>();
		
		for(MSecUserRole obj: users.get(0).getSecUserRoles()){
			roles.add(obj.getSecRole());
			secRoles.add(obj);
			secRoleId.add(obj.getSecRole().getSecRoleId());
		}
		if(secRoleId.size() > 0)
			roleGroups = this.getUserService().getRoleGroupById(secRoleId);
		if(roleGroups.size() > 0){
			for(int i = 0; i < roleGroups.size() ; i++){
				groups.add(roleGroups.get(i).getSecGroup());	
				secRoleGroupId.add(roleGroups.get(i).getSecGroup().getSecGroupId());
			}
		}
		if(secRoleGroupId.size() > 0)
			groupRights = this.getUserService().getGroupRight(secRoleGroupId);
		for(int k = 0; k < groupRights.size(); k++){
			rights.add(groupRights.get(k).getSecRight());
		}
		this.secRoles  = roles;
		this.secGroups = groups;
		this.secRights = rights;	
		Collections.sort(this.secRights, MSecRight.Comparators.ID);
	}

}
