package co.id.spring.mvc.sys.util;

import java.io.Serializable;

public class UrlVO implements Serializable, Comparable<UrlVO> {

	private static final long serialVersionUID = -4080233088299980779L;
	private String reportName;
	private String url;

	public String getReportName() {
		return reportName;
	}

	public void setReportName(String reportName) {
		this.reportName = reportName;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	/* (non-Javadoc)
	 * @see java.lang.Comparable#compareTo(java.lang.Object)
	 */
	@Override
	public int compareTo(UrlVO vo) {
		if(url == null){
			return -1;
		}
		if(vo == null || vo.getUrl() == null){
			return -1;
		}
		return url.compareTo(vo.getUrl());
	}

}
