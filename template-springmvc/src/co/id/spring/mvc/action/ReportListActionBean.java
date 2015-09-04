package co.id.spring.mvc.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import co.id.spring.mvc.domain.MPosReport;
import co.id.spring.mvc.sys.action.MainActionBean;
import co.id.spring.mvc.sys.util.Constants;
import co.id.spring.mvc.sys.util.UrlVO;

@Controller
@RequestMapping("/reportlist")
public class ReportListActionBean extends MainActionBean{
	
	private static final long serialVersionUID = 2789692160744985426L;
	private static final Logger log = Logger.getLogger(ReportListActionBean.class);
	
	@Autowired private MPosReportService mPosReportService;
	
	private Map<String, List<UrlVO>> menuMap = new HashMap<String, List<UrlVO>>();
	private List<String> menuGroup = new ArrayList<String>();
	private String reportURL;
	
	@RequestMapping(method = RequestMethod.GET)
	public String loadReport(ModelMap model, HttpServletRequest request) {
		log.debug(ReportListActionBean.class);
		init(request);
		refreshList();
		
		model.addAttribute("menuMap", menuMap);
		model.addAttribute("menuGroup", menuGroup);
		model.addAttribute(Constants.COMMON.MENU.MENU_ACTIVE, Constants.REPORT.MENU.MENU_REPORT_LIST);
		return Constants.REPORT.ACTION.LOAD_REPORT_LIST;
	}
	
	public void init(HttpServletRequest request) {
		menuMap.clear();
		menuGroup.clear();
		
		String ip = request.getServerName(); //or getLocalAddress()
		int serverPort = request.getServerPort();
		StringBuilder sb = new StringBuilder();
		sb.append("http://").append(ip).append(":").append(serverPort).
			append("/gnosis-report/frameset?__report=");
		reportURL = sb.toString();
	}
	
	private void refreshList() {
		List<MPosReport> posReports = mPosReportService.getList();
		for(MPosReport posReport: posReports) {
			List<UrlVO> list = menuMap.get(posReport.getReportGroup());
			if(list == null) {
				list = new ArrayList<UrlVO>();
				menuMap.put(posReport.getReportGroup(), list);
				menuGroup.add(posReport.getReportGroup());
			}
			UrlVO urlVo = new UrlVO();
			urlVo.setReportName(posReport.getReportName());
			urlVo.setUrl(reportURL + posReport.getReportFileName() + "&__title=" + 
					posReport.getReportName().replace(' ', '+'));
			list.add(urlVo);
		}
	}
}
