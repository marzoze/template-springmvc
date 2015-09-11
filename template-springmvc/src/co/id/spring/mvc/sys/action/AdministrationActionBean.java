package co.id.spring.mvc.sys.action;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import co.id.spring.mvc.domain.MSecGroup;
import co.id.spring.mvc.domain.MSecRole;
import co.id.spring.mvc.domain.MSecUser;
import co.id.spring.mvc.service.UserService;
import co.id.spring.mvc.sys.config.CommonConstants;
import co.id.spring.mvc.sys.util.ComboUtil;
import co.id.spring.mvc.sys.util.Constants;
import co.id.spring.mvc.sys.util.JSONUtil;
import co.id.spring.mvc.sys.util.Paging;

@Controller
@RequestMapping("/administration")
public class AdministrationActionBean extends MainActionBean {

	private static final long serialVersionUID = 2567293675784215881L;
	private static final Logger log = Logger.getLogger(AdministrationActionBean.class);
	
	@Autowired private UserService userService;
	
	@RequestMapping(value="/role", method = RequestMethod.GET)
	public String loadRole(ModelMap model){
		log.debug(AdministrationActionBean.class);
		model.addAttribute(Constants.COMMON.MENU.MENU_ACTIVE, Constants.ADMINISTRATION.MENU.MENU_ADMINISTRATION);
		return Constants.ADMINISTRATION.ACTION.LOAD_ADMINISTRATION_ROLE;
	}
	
	@RequestMapping(value="/roleform", method = RequestMethod.GET)
	public String loadRoleForm(ModelMap model){
		log.debug(AdministrationActionBean.class);
		MSecRole role = new MSecRole();
		model.addAttribute("role", role);
		model.addAttribute(Constants.COMMON.MENU.MENU_ACTIVE, Constants.ADMINISTRATION.MENU.MENU_ADMINISTRATION);
		return Constants.ADMINISTRATION.ACTION.LOAD_ADMINISTRATION_ROLE_FORM;
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public String saveRole(
			@Valid @ModelAttribute("role") MSecRole role, 
			BindingResult result, SessionStatus status, 
			ModelMap model, final RedirectAttributes redirectAttributes){
		
		if(result.hasErrors()){
			model.addAttribute("role", role);
			model.addAttribute(Constants.COMMON.MENU.MENU_ACTIVE, Constants.ADMINISTRATION.MENU.MENU_ADMINISTRATION);
			return Constants.ADMINISTRATION.ACTION.LOAD_ADMINISTRATION_ROLE_FORM;
		}
		
		try {
			userService.saveRole(role);
			status.setComplete();
			model.addAttribute(Constants.COMMON.MENU.MENU_ACTIVE, Constants.ADMINISTRATION.MENU.MENU_ADMINISTRATION);
			model.addAttribute("message", "Data Successfully Saved");
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return Constants.ADMINISTRATION.ACTION.LOAD_ADMINISTRATION_ROLE_FORM;
	}
	
	@RequestMapping(value="/group", method = RequestMethod.GET)
	public String loadGroup(ModelMap model){
		log.debug(AdministrationActionBean.class);
		model.addAttribute(Constants.COMMON.MENU.MENU_ACTIVE, Constants.ADMINISTRATION.MENU.MENU_ADMINISTRATION);
		return Constants.ADMINISTRATION.ACTION.LOAD_ADMINISTRATION_GROUP;
	}
	
	@RequestMapping(value="/groupform", method = RequestMethod.GET)
	public String loadGroupForm(ModelMap model){
		log.debug(AdministrationActionBean.class);
		MSecGroup group = new MSecGroup();
		model.addAttribute("group", group);
		model.addAttribute(Constants.COMMON.MENU.MENU_ACTIVE, Constants.ADMINISTRATION.MENU.MENU_ADMINISTRATION);
		return Constants.ADMINISTRATION.ACTION.LOAD_ADMINISTRATION_GROUP_FORM;
	}
	
	@RequestMapping(value="/_groupform", method = RequestMethod.GET)
	public String editGorup(
			ModelMap model,
			@RequestParam(value = "groupid", required = false) Long groupId){
		log.debug(AdministrationActionBean.class);
		if(groupId == null){
			//
		}		
		MSecGroup group = userService.getGroupById(groupId);
		model.addAttribute("group", group);
		model.addAttribute(Constants.COMMON.MENU.MENU_ACTIVE, Constants.ADMINISTRATION.MENU.MENU_ADMINISTRATION);
		return Constants.ADMINISTRATION.ACTION.LOAD_ADMINISTRATION_GROUP_FORM;
	}
	
	@RequestMapping(value="savegroup", method = RequestMethod.POST)
	public String saveGroup(
			@Valid @ModelAttribute("group") MSecGroup group, 
			BindingResult result, SessionStatus status, 
			ModelMap model, final RedirectAttributes redirectAttributes){
		if(result.hasErrors()){
			model.addAttribute("group", group);
			model.addAttribute(Constants.COMMON.MENU.MENU_ACTIVE, Constants.ADMINISTRATION.MENU.MENU_ADMINISTRATION);
			return Constants.ADMINISTRATION.ACTION.LOAD_ADMINISTRATION_GROUP_FORM;
		}
		
		try {
			userService.saveGroup(group);
			status.setComplete();
			model.addAttribute(Constants.COMMON.MENU.MENU_ACTIVE, Constants.ADMINISTRATION.MENU.MENU_ADMINISTRATION);
			model.addAttribute("message", "Data Successfully Saved");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return Constants.ADMINISTRATION.ACTION.LOAD_ADMINISTRATION_GROUP_FORM;
	}
	
	@RequestMapping(value="/department", method = RequestMethod.GET)
	public String loadDepartment(ModelMap model){
		log.debug(AdministrationActionBean.class);
		model.addAttribute(Constants.COMMON.MENU.MENU_ACTIVE, Constants.ADMINISTRATION.MENU.MENU_ADMINISTRATION);
		return Constants.ADMINISTRATION.ACTION.LOAD_ADMINISTRATION_DEPARTMENT;
	}
	
	@RequestMapping(value="/employee", method = RequestMethod.GET)
	public String loadEmployee(@RequestParam(value = "posTranId", required = false) Long id, ModelMap model){
		log.debug(AdministrationActionBean.class);
		model.addAttribute(Constants.COMMON.MENU.MENU_ACTIVE, Constants.ADMINISTRATION.MENU.MENU_ADMINISTRATION);
		return Constants.ADMINISTRATION.ACTION.LOAD_ADMINISTRATION_EMPLOYEE;
	}
	
	@RequestMapping(value="/employeeform", method = RequestMethod.GET)
	public String employeeForm(
			ModelMap model, 
			@RequestParam(value = "employeeid", required = false) Long employeeId){
		log.debug(AdministrationActionBean.class);
		if(employeeId == null){
			
		}
		MSecUser user = userService.getUserByID(employeeId);
		model.addAttribute("user", user);
		model.addAttribute(Constants.COMMON.MENU.MENU_ACTIVE, Constants.ADMINISTRATION.MENU.MENU_ADMINISTRATION);
		return Constants.ADMINISTRATION.ACTION.LOAD_ADMINISTRATION_EMPLOYEE_FORM;
	}
	
	@RequestMapping(value="/workdays", method = RequestMethod.GET)
	public String loadWorkingDays(ModelMap model){
		log.debug(AdministrationActionBean.class);
		model.addAttribute(Constants.COMMON.MENU.MENU_ACTIVE, Constants.ADMINISTRATION.MENU.MENU_ADMINISTRATION);
		return Constants.ADMINISTRATION.ACTION.LOAD_ADMINISTRATION_WORKDAYS;
	}
	
	@RequestMapping(value="/role/getRole")
	@ResponseBody
	public String getRole(HttpServletRequest request){
		Paging paging = new Paging();
		paging.setStart((this.getPage(request) - 1) * this.getRows(request));
		paging.setEnd((this.getPage(request) * this.getRows(request)));
		
		List<MSecRole> finalRoles = new ArrayList<MSecRole>();
		List<MSecRole> roles = userService.getRoleWithPagination(paging.getStart(), paging.getEnd());
		if(roles.size() > 0){			
			for(MSecRole msr: roles){
				MSecRole obj = new MSecRole();
				obj.setSecRoleId(obj.getSecRoleId());
				obj.setRoleShortdescription(msr.getRoleShortdescription());
				obj.setRoleLongdescription(msr.getRoleLongdescription());
				finalRoles.add(obj);
			}
		}
		
		//set total page
		int totalRec = userService.countRole().intValue();
		paging.setTotalResults(totalRec);
		int totalPage = 1;
		if(paging.getTotalResults() > 0) {
			if(paging.getTotalResults() % this.getRows(request) > 0) 
				totalPage = (paging.getTotalResults() / this.getRows(request)) + 1;
			else
				totalPage = (paging.getTotalResults() / this.getRows(request));			
		}
		
		JSONUtil json = new JSONUtil();		
		json.addData(Constants.COMMON.JQGRID.TOTAL,totalPage);
		json.addData(Constants.COMMON.JQGRID.PAGE, this.getPage(request));
		json.addData(Constants.COMMON.JQGRID.RECORDS, paging.getTotalResults());
		json.addData(Constants.COMMON.JQGRID.ROWS, finalRoles);		
		json.addDateField(Constants.COMMON.JQGRID.UPLOAD_TIMESTAMP);
		json.setDateFormat(CommonConstants.DATE_FORMAT_HOUR);
		return json.serialize();
	}
	
	@RequestMapping(value="/role/getGroup")
	@ResponseBody
	public String getGroup(HttpServletRequest request){
		Paging paging = new Paging();
		paging.setStart((this.getPage(request) - 1) * this.getRows(request));
		paging.setEnd((this.getPage(request) * this.getRows(request)));
		
		List<MSecGroup> finalGroups = new ArrayList<MSecGroup>();
		List<MSecGroup> groups = userService.getGroupWithPagination(paging.getStart(), paging.getEnd());
		if(groups.size() > 0){
			for(MSecGroup obj: groups){
				MSecGroup msg = new MSecGroup();
				msg.setSecGroupId(obj.getSecGroupId());
				msg.setShortdescription(obj.getShortdescription());
				msg.setLongdescription(obj.getLongdescription());
				finalGroups.add(msg);
			}
		}
		
		//set total page
		int totalRec = userService.countGroup().intValue();
		paging.setTotalResults(totalRec);
		int totalPage = 1;
		if(paging.getTotalResults() > 0) {
			if(paging.getTotalResults() % this.getRows(request) > 0) 
				totalPage = (paging.getTotalResults() / this.getRows(request)) + 1;
			else
				totalPage = (paging.getTotalResults() / this.getRows(request));			
		}
		
		JSONUtil json = new JSONUtil();
		json.addData(Constants.COMMON.JQGRID.TOTAL,totalPage);
		json.addData(Constants.COMMON.JQGRID.PAGE, this.getPage(request));
		json.addData(Constants.COMMON.JQGRID.RECORDS, paging.getTotalResults());
		json.addData(Constants.COMMON.JQGRID.ROWS, finalGroups);		
		json.addDateField(Constants.COMMON.JQGRID.UPLOAD_TIMESTAMP);
		json.setDateFormat(CommonConstants.DATE_FORMAT_HOUR);
		return json.serialize();
	}
	
	@RequestMapping(value="/role/getEmployee")
	@ResponseBody
	public String getEmployee(HttpServletRequest request){
		Paging paging = new Paging();
		paging.setStart((this.getPage(request) - 1) * this.getRows(request));
		paging.setEnd((this.getPage(request) * this.getRows(request)));
		
		List<MSecUser> finalEmployees = new ArrayList<MSecUser>();
		List<MSecUser> employees = userService.getUserWithPagination(paging.getStart(), paging.getEnd(), request);
		if(employees.size() > 0){
			for(MSecUser obj: employees){
				MSecUser msu = new MSecUser();
				msu.setSecUserId(obj.getSecUserId());
				msu.setEmployee(obj.getEmployee());
				msu.setUserName(obj.getUserName());
				finalEmployees.add(msu);
			}
		}
		
		//set total page
		int totalRec = userService.countUser().intValue();
		paging.setTotalResults(totalRec);
		int totalPage = 1;
		if(paging.getTotalResults() > 0) {
			if(paging.getTotalResults() % this.getRows(request) > 0) 
				totalPage = (paging.getTotalResults() / this.getRows(request)) + 1;
			else
				totalPage = (paging.getTotalResults() / this.getRows(request));			
		}
		
		JSONUtil json = new JSONUtil();
		json.addData(Constants.COMMON.JQGRID.TOTAL,totalPage);
		json.addData(Constants.COMMON.JQGRID.PAGE, this.getPage(request));
		json.addData(Constants.COMMON.JQGRID.RECORDS, paging.getTotalResults());
		json.addData(Constants.COMMON.JQGRID.ROWS, finalEmployees);		
		json.addDateField(Constants.COMMON.JQGRID.UPLOAD_TIMESTAMP);
		json.setDateFormat(CommonConstants.DATE_FORMAT_HOUR);
		return json.serialize();
	}

	@RequestMapping(value="getRoleType")
	@ResponseBody
	public String getRoleType(){
		List<MSecRole> roles = userService.getAllRoles();
		ComboUtil<MSecRole> combo = new ComboUtil<MSecRole>(MSecRole.class, roles, "secRoleId", "roleShortdescription", Constants.COMMON.SELECT_LABEL_DEFAULT);
		return combo.serialize();
	}
	
	@RequestMapping(value="getRoleGroup")
	@ResponseBody
	public String getRoleGroup(){
		List<MSecGroup> groups = userService.getAllGroups();
		ComboUtil<MSecGroup> combo = new ComboUtil<MSecGroup>(MSecGroup.class, groups, "secGroupId", "shortdescription", Constants.COMMON.SELECT_LABEL_DEFAULT);
		return combo.serialize();
	}
}
