package co.id.spring.mvc.domain;

import java.io.Serializable;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.validation.constraints.Size;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

@Entity
@Table(name="M_SEC_GROUP", catalog = "")
public class MSecGroup implements Serializable {

	private static final long serialVersionUID = -6457916369632624186L;
	
	@Id
	@Column(name = "SEC_GROUP_ID", columnDefinition = "NUMBER(10)")
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "SECGROUPSEQ")
	@SequenceGenerator(name = "SECGROUPSEQ", sequenceName = "SECGROUP_SEQ", allocationSize = 1)
	private Long secGroupId;
	
	@Column(name = "VERSION")
	private int version;

	@Size(min=2, max=70)
	@Column(name = "SHORT_DESC")
	private String shortdescription;
	
	@Column(name = "LONG_DESC")
	private String longdescription;
	
	@OneToMany(mappedBy="secGroup", cascade=CascadeType.ALL, fetch=FetchType.EAGER)
	@Fetch(value = FetchMode.SUBSELECT)
	private List<MSecGroupRight> secGrouprights;
	
	@OneToMany(mappedBy="secGroup", cascade=CascadeType.ALL, fetch=FetchType.EAGER)
	@Fetch(value = FetchMode.SUBSELECT)
	private List<MSecRoleGroup> secRoleGroup;

	public Long getSecGroupId() {
		return secGroupId;
	}

	public void setSecGroupId(Long secGroupId) {
		this.secGroupId = secGroupId;
	}

	public int getVersion() {
		return version;
	}

	public void setVersion(int version) {
		this.version = version;
	}

	public String getShortdescription() {
		return shortdescription;
	}

	public void setShortdescription(String shortdescription) {
		this.shortdescription = shortdescription;
	}

	public String getLongdescription() {
		return longdescription;
	}

	public void setLongdescription(String longdescription) {
		this.longdescription = longdescription;
	}

	public List<MSecGroupRight> getSecGrouprights() {
		return secGrouprights;
	}

	public void setSecGrouprights(List<MSecGroupRight> secGrouprights) {
		this.secGrouprights = secGrouprights;
	}

	public List<MSecRoleGroup> getSecRoleGroup() {
		return secRoleGroup;
	}

	public void setSecRoleGroup(List<MSecRoleGroup> secRoleGroup) {
		this.secRoleGroup = secRoleGroup;
	} 
	
}
