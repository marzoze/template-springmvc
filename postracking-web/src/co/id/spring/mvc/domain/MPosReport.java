package co.id.spring.mvc.domain;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name="M_POS_REPORT", catalog = "")
public class MPosReport implements Serializable {
	
	private static final long serialVersionUID = 1036969793232167311L;
	
	@Id
	@Column(name = "REPORT_ID", columnDefinition = "NUMBER(5)")
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "REPORTSEQ")
	@SequenceGenerator(name = "REPORTSEQ", sequenceName = "REPORT_SEQ", allocationSize = 1)
	private Long reportId;
	
	@Column(name = "REPORT_NAME", length = 200)
	private String reportName;
	
	@Column(name = "REPORT_GROUP", length = 100)
	private String reportGroup;
	
	@Column(name = "REPORT_FILE_NAME", length = 100)
	private String reportFileName;
	
	@Column(name = "SUB_REPORT_FILE_NAME_1", length = 100)
	private String subReportFileName1;
	
	@Column(name = "SUB_REPORT_FILE_NAME_2", length = 100)
	private String subReportFileName2;
	
	public Long getReportId() {
		return reportId;
	}
	
	public void setReportId(Long reportId) {
		this.reportId = reportId;
	}
	
	public String getReportName() {
		return reportName;
	}
	
	public void setReportName(String reportName) {
		this.reportName = reportName;
	}
	
	public String getReportGroup() {
		return reportGroup;
	}
	
	public void setReportGroup(String reportGroup) {
		this.reportGroup = reportGroup;
	}
	
	public String getReportFileName() {
		return reportFileName;
	}
	
	public void setReportFileName(String reportFileName) {
		this.reportFileName = reportFileName;
	}
	
	public String getSubReportFileName1() {
		return subReportFileName1;
	}
	
	public void setSubReportFileName1(String subReportFileName1) {
		this.subReportFileName1 = subReportFileName1;
	}
	
	public String getSubReportFileName2() {
		return subReportFileName2;
	}
	
	public void setSubReportFileName2(String subReportFileName2) {
		this.subReportFileName2 = subReportFileName2;
	}
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((reportId == null) ? 0 : reportId.hashCode());
		return result;
	}
	
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		MPosReport other = (MPosReport) obj;
		if (reportId == null) {
			if (other.reportId != null)
				return false;
		} else if (!reportId.equals(other.reportId))
			return false;
		return true;
	}
	
	@Override
	public String toString() {
		return "MReport [reportId=" + reportId + ", reportName="
				+ reportName + "]";
	}
}
