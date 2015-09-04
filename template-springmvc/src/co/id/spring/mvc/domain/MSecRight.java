package co.id.spring.mvc.domain;

import java.io.Serializable;
import java.util.Comparator;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name="M_SEC_RIGHT", catalog = "")
public class MSecRight implements Serializable, Comparable<MSecRight> {

	private static final long serialVersionUID = 8983607841507803617L;

	@Id
	@Column(name = "SEC_RIGHT_ID", columnDefinition = "NUMBER(10)")
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "SECRIGHTSEQ")
	@SequenceGenerator(name = "SECRIGHTSEQ", sequenceName = "SECRIGHT_SEQ", allocationSize = 1)
	private Long secRightId;
	
	@Column(name = "VERSION")
	private int version;
	
	@Column(name = "RIG_TYPE")
	private Integer rigType;
	
	@Column(name = "RIG_NAME")
	private String rigName;
	
	@Column(name = "RIG_NAME_MNU")
	private String rigNameMnu;
	
	@Column(name = "ICON")
	private String icon;
	
	@JoinColumn(name = "PARENT_SEC_RIGHT_ID")
	@ManyToOne
	private MSecRight parentSecRightId;

	@OneToMany(mappedBy="secRight", cascade=CascadeType.ALL, fetch=FetchType.EAGER)
	private List<MSecGroupRight> secGroupRights;

	public Long getSecRightId() {
		return secRightId;
	}

	public void setSecRightId(Long secRightId) {
		this.secRightId = secRightId;
	}

	public int getVersion() {
		return version;
	}

	public void setVersion(int version) {
		this.version = version;
	}

	public Integer getRigType() {
		return rigType;
	}

	public void setRigType(Integer rigType) {
		this.rigType = rigType;
	}

	public String getRigName() {
		return rigName;
	}

	public void setRigName(String rigName) {
		this.rigName = rigName;
	}
	
	public String getRigNameMnu() {
		return rigNameMnu;
	}

	public void setRigNameMnu(String rigNameMnu) {
		this.rigNameMnu = rigNameMnu;
	}
	
	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	public List<MSecGroupRight> getSecGroupRights() {
		return secGroupRights;
	}

	public void setSecGroupRights(List<MSecGroupRight> secGroupRights) {
		this.secGroupRights = secGroupRights;
	}
	
	public MSecRight getParentSecRightId() {
		return parentSecRightId;
	}

	public void setParentSecRightId(MSecRight parentSecRightId) {
		this.parentSecRightId = parentSecRightId;
	}

	@Override
	public int compareTo(MSecRight o) {
		return Comparators.ID.compare(this, o);
	} 
	
	public static class Comparators{
		public static Comparator<MSecRight> ID = new Comparator<MSecRight>() {
			@Override
			public int compare(MSecRight arg0, MSecRight arg1) {
				return arg0.secRightId.compareTo(arg1.secRightId);
			}			
		};	
	}
	
}
