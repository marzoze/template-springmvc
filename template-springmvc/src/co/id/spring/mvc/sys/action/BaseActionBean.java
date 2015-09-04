package co.id.spring.mvc.sys.action;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.web.context.ServletContextAware;

import co.id.spring.mvc.sys.util.Constants;
import co.id.spring.mvc.sys.util.JqGridUtil;
import co.id.spring.mvc.sys.util.Paging;

public abstract class BaseActionBean implements ServletContextAware, Serializable {

	private static final long serialVersionUID = -6384365692160605503L;
		
	protected BaseActionBeanContext context;
	protected JqGridUtil grid;
	protected Paging paging;
	protected ServletContext servletContext;	
	
	protected final static int MAX_ROW = 10;
	private int start;
	private int limit;
	private int page;
	private int records;
	private int total;
	private int rows;
	private String id;
	protected String userName;
	protected String userRole;
	private boolean sessionTimeout = false;
	private String act;
	protected String menuActive;
	private String sidx;
	private String sord;
	private String redirectUrl;
	
	public BaseActionBean() {		
		if (paging == null)	paging = new Paging();
		if (context == null) context = new BaseActionBeanContext();
		paging.setExtPaging(true);		
	}

	public JqGridUtil getGrid() {
		return grid;
	}
	public void setGrid(JqGridUtil grid) {
		this.grid = grid;
	}
	public Paging getPaging() {
		return paging;
	}
	public void setPaging(Paging paging) {
		this.paging = paging;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getLimit() {
		return limit;
	}
	public void setLimit(int limit) {
		this.limit = limit;
	}
	public int getPage(HttpServletRequest request) {		
		if(request != null)	
			page = Integer.parseInt(request.getParameter(Constants.COMMON.JQGRID.PAGE));
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getRecords() {
		return records;
	}
	public void setRecords(int records) {
		this.records = records;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public int getRows(HttpServletRequest request) {
		if(request != null)	
			rows = Integer.parseInt(request.getParameter(Constants.COMMON.JQGRID.ROWS));		
		return rows;
	}
	public void setRows(int rows) {		
		this.rows = rows;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserRole() {
		return userRole;
	}
	public void setUserRole(String userRole) {
		this.userRole = userRole;
	}
	public boolean isSessionTimeout() {
		return sessionTimeout;
	}
	public void setSessionTimeout(boolean sessionTimeout) {
		this.sessionTimeout = sessionTimeout;
	}
	public String getAct() {
		return act;
	}
	public void setAct(String act) {
		this.act = act;
	}
	public String getMenuActive() {
		return menuActive;
	}
	public void setMenuActive(String menuActive) {
		this.menuActive = menuActive;
	}
	public String getSidx(HttpServletRequest request) {
		if(request != null) 
			sidx = request.getParameter(Constants.COMMON.JQGRID.SIDX);
		return sidx;
	}
	public void setSidx(String sidx) {
		this.sidx = sidx;
	}
	public String getSord(HttpServletRequest request) {
		if(request != null) 
			sord = request.getParameter(Constants.COMMON.JQGRID.SORD);
		return sord;
	}
	public void setSord(String sord) {
		this.sord = sord;
	}
	public String getRedirectUrl() {
		return redirectUrl;
	}
	public void setRedirectUrl(String redirectUrl) {
		this.redirectUrl = redirectUrl;
	}

	public String getStringToday(){
		SimpleDateFormat df = new SimpleDateFormat("EEEE, MMMM dd, yyyy");
		return df.format(new Date()).toString() + " +GMT8";
	}
	
	protected void addGlobalError(String key, Object... params) {
		
	}
	
	protected void setSessionAttribute(String parameterName, Object value) {
		HttpSession session = context.getSession();
		session.setAttribute(parameterName, value);
	}
	
	protected Object getSessionAttribute(String parameterName) {
		HttpSession session = context.getSession();
		return session.getAttribute(parameterName);
	}

	protected void removeSessionAttribute(String parameterName) {
        context.removeCurrent(parameterName);
    }

	@Override
	public void setServletContext(ServletContext servletContext) {
		this.servletContext = servletContext;
	}	
	
}