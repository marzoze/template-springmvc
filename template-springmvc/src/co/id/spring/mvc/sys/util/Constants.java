package co.id.spring.mvc.sys.util;

public class Constants {
	public static class COMMON {
		
		public static final String LOGIN_SESSION = "POSTRACKING-SESS";
		public static final String SELECT_LABEL_DEFAULT = "Select";		
		public static final String HSR = "HSR";
		public static final String HC = "HC";
		public static final String HO = "HO";
		public static final String BRC = "BRC";
		public static final String ACTIVE = "Y";
		public static final String NOT_ACTIVE = "N";
		public static final String BRANCH_USER = "SAO_USERS";
		public static final String SUCCESS = "200";
		public static final String FAIL = "400";
		public static final String UPLOAD_PATH = "#{config['upload.path']}";
		public static final String GLOBAL_SAVE = "globalsave";
		public static final String GLOBAL_INFO = "globalinfo";
		public static final String GLOBAL_SUBMIT = "globalsubmit";
		public static final String ERROR_SAVE = "errorsave";
		public static final String POS = "POS";
		public static final String SLASH = "/";
		public static final String OTHERS = "Others";
		public static final String READY_TO_SUBMIT = "readytosubmit";
		public static final String DASH = "-";
		public static final String YES = "Y";
		public static final String NO = "N";
		public static final String SUBMITTED = "submitted";
		public static final String TRAN_STATUS = "transactionstatus";
		public static final String DOCUMENT_COMPLETE = "documentcomplete";
		public static final String IHSR01 = "IHSR01";
		public static final String MCR = "MCR";
		
		// CONFIG FILE NAME
		public static final String UPLOAD_PROP_VALUE = "upload.path";
		public static final String HOSTNAME = "upload.hostName";
		
		public static class EVENT_PROCESS{
			public static final String PROCESS = "process";
			public static final String APPROVE = "approve";
			public static final String CLOSE = "close";
			public static final String REJECT = "reject";
		}
		
		public static class TRANSACTION_STATUS{
			public static final String REGISTRATION_IN_PROGRESS = "Registration in Progress";
			public static final String PENDING_AT_REGISTRATIOIN = "Pending at Registration";
			public static final String REGISTERED = "Registered";
			public static final String CANCELLED = "Cancelled";
			public static final String IN_PROGRESS = "In Progress";
			public static final String APPROVE = "Approve";
			public static final String CLOSE = "Close";
			public static final String REJECT = "Reject";
		}
		
		public static class REGISTRATION_STATUS{
			public static final String PROGRESS = "P";
			public static final String SUBMITED_BY_BRANCH = "S";
			public static final String SUBMITED_BY_HO = "H";
		}
		
		public static class Attachment{
			public static final String MANDATORY = "M";
			public static final String OPTIONAL = "O";
			public static final String FORM = "F";
			public static final String FORMLIST = "L";
			public static final String UPLOADED = "200";
			public static final String UPLOAD_FAILED = "300";
		}
		
		public interface MENU {
			public static final String MENU_ACTIVE = "menuActive";
			public static final String SIDE_MENU_ACTIVE = "sideMenuActive";
		}
		
		public interface SESSION {
			public static final String USER_SESS = "user";
			public static final String USER_ID_SESS = "userId";
			public static final String LIST_USER_SESS = "listUser";
			public static final String USERNAME_SESS = "userName";
			public static final String USERID_SESS = "userId";
			public static final String ROLE_SESS = "role";
			public static final String RIGHT_SESS = "right";			
			public static final String GROUP_SESS = "group";
			public static final String IS_BRANCH = "isBranch";
		}								
		
		public interface JQGRID {
			public static final String ROWS = "rows";
			public static final String PAGE = "page";
			public static final String SIDX = "sidx";
			public static final String SORD = "sord";
			public static final String RECORDS = "records"; 
			public static final String TOTAL = "total";
			public static final String UPLOAD_TIMESTAMP = "UPLOAD_TIMESTAMP";
		}
				
	}
	
	public static class LOGIN {
		
		public interface VALIDATION {
			public static final String USERNAME = "userName";
			public static final String PASSWORD = "password";
		}
		
		public interface ERROR {
			public static final String USERNAME_PASSWORD_REQUIRED = "validation.required.username.password";
			public static final String USERNAME_REQUIRED = "validation.required.username";
			public static final String PASSWORD_REQUIRED = "validation.required.password";			
			public static final String USERNAME_PASSWORD_INVALID = "user.action.invalidUserPassword";
			public static final String LOGIN_ERROR = "global.error.login";
		}						
		
		public interface ACTION {
			public static final String LOGIN = "common/login";
			public static final String REDIRECT_LOGIN = "redirect:/login";
			public static final String REDIRECT_DASHBOARD = "redirect:/dashboard";
		}
		
	}
	
	public static class DASHBOARD {
		
		public interface ACTION {
			public static final String LOAD_DASHBOARD = "pages/dashboard/dashboard";
		}
		
		public interface MENU {
			public static final String MENU_DASHBOARD = "dashboard";
		}
		
	}
	
	public static class POS {
		
		public interface PAGE {
			public static final String POLICY_INFO = "pages/pos/policyinfo";
			public static final String POS_TRANSACTION = "pages/pos/postransaction";
			public static final String POS_DOCUMENT = "pages/pos/posdocument";
			public static final String POLICY_INFO_BRANCH = "pages/pos/policyinfobranch";
			public static final String POS_TRANSACTION_BRANCH = "pages/pos/postransactionbranch";
			public static final String INQUIRY = "pages/pos/inquiry";
			public static final String PROCESS_INQUIRY = "pages/pos/processinquiry";
			public static final String POLICY_INFO_PROCESS = "pages/pos/policyinfoprocess";
			public static final String POS_TRANSACTION_PROCESS = "pages/pos/postransactionprocess";
			public static final String POS_DOCUMENT_PROCESS = "pages/pos/posdocumentprocess";
		}
		
		public interface ACTION {
			public static final String LOAD_QUERY = "pages/pos/query";	
			public static final String LOAD_REGISTER = "pages/pos/register";
			public static final String LOAD_REGISTER_HO = "pages/pos/registerho";
			public static final String LOAD_COMMON_QUERY = "pages/pos/commonquery";
			public static final String LOAD_PROCESS_INQUIRY = "pages/pos/processinquiry";
			public static final String LOAD_PROCESS_DETAIL = "pages/pos/processdetail";
		}
		
		public interface MENU {
			public static final String MENU_QUERY = "query";
			public static final String MENU_REGISTER = "register";
			public static final String MENU_REGISTER_HO = "registerho";
			public static final String MENU_COMMON_QUERY = "commonquery";
			public static final String MENU_PROCESS = "processinquiry";
			public static final String MENU_POS = "pos";
			public static final String SIDE_MENU_POLICY_INFO = "policyinfo";			
			public static final String SIDE_MENU_POS_TRANSACTION = "postransaction";
			public static final String SIDE_MENU_POS_DOCUMENT = "posdocument";
		}		
		
		public interface VALIDATION {
			public static final String DOCUMENT = "documentId";
		}
		
		public interface ERROR {
			public static final String REQUIRED_FIELD = "validation.required.valueNotPresent";
			public static final String BRANCH_FIELD = "validation.required.branch";
			public static final String DOCUMENT_REQUIRED_FIELD = "validation.required.document";
			public static final String POSNUMBER_REQUIRED_FIELD = "validation.required.posNumber";
			public static final String POLICYINFO_REQUIRED_FIELD = "validation.required.policyinfo";
			public static final String TRXTYPE_REQUIRED_FIELD = "validation.required.trxtype";
			public static final String RECEIVE_DATE_REQUIRED_FIELD = "validation.required.receiveDate";
			public static final String REASONOFREJECTION_REQUIRED_FIELD = "validation.required.reasonOfRejection";
		}
		
		public interface FIELD {
			public static final String POS_REGISTRATION_ID = "posregistrationid";
			public static final String POS_TRANSACTION_ID = "postransactionid";
			public static final String POS_TRANSACTION_TYPE_ID = "postransactiontypeid";
			public static final String POS_DOCUMENT_ID = "posdocumentid";
		}
		
	}	
	
	public static class ADMINISTRATION {
		
		public interface ACTION {
			public static final String LOAD_ADMINISTRATION_ROLE = "pages/administration/role";
			public static final String LOAD_ADMINISTRATION_ROLE_FORM = "pages/administration/roleform";
			public static final String LOAD_ADMINISTRATION_GROUP = "pages/administration/group";
			public static final String LOAD_ADMINISTRATION_GROUP_FORM = "pages/administration/groupform";
			public static final String LOAD_ADMINISTRATION_DEPARTMENT = "pages/administration/department";
			public static final String LOAD_ADMINISTRATION_EMPLOYEE = "pages/administration/employee";
			public static final String LOAD_ADMINISTRATION_EMPLOYEE_FORM = "pages/administration/employeeform";
			public static final String LOAD_ADMINISTRATION_WORKDAYS = "pages/administration/workdays";
		}
		
		public interface MENU {
			public static final String MENU_ADMINISTRATION = "administration";			
		}
		
	}
	
	public static class REPORT {
		
		public interface ACTION {
			public static final String LOAD_REPORT_LIST = "pages/report/reportlist";
		}
		
		public interface MENU {
			public static final String MENU_REPORT_LIST = "reportlist";			
		}
		
	}
}