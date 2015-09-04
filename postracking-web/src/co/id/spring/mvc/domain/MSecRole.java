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
@Table(name="M_SEC_ROLE", catalog = "")
public class MSecRole implements Serializable {

	private static final long serialVersionUID = 7602268658178245982L;
	
	@Id
	@Column(name = "SEC_ROLE_ID", columnDefinition = "NUMBER(10)")
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "SECROLESEQ")
	@SequenceGenerator(name = "SECROLESEQ", sequenceName = "SECROLE_SEQ", allocationSize = 1)
	private Long secRoleId;
	
	@Column(name = "VERSION")
	private int version;
	
	@Size(min=2, max=50)
	@Column(name = "ROLE_SHORT_DESC")
	private String roleShortdescription;
	
	@Column(name = "ROLE_LONG_DESC")
	private String roleLongdescription;
	
	@OneToMany(mappedBy="secRole", cascade=CascadeType.ALL, fetch=FetchType.EAGER)
	@Fetch(value = FetchMode.SUBSELECT)
	private List<MSecUserRole> secUserRoles; 
	
	@OneToMany(mappedBy="secRole", cascade=CascadeType.ALL, fetch=FetchType.EAGER)
	@Fetch(value = FetchMode.SUBSELECT)
	private List<MSecRoleGroup> secRoleGroup;

	public Long getSecRoleId() {
		return secRoleId;
	}

	public void setSecRoleId(Long secRoleId) {
		this.secRoleId = secRoleId;
	}

	public int getVersion() {
		return version;
	}

	public void setVersion(int version) {
		this.version = version;
	}

	public String getRoleShortdescription() {
		return roleShortdescription;
	}

	public void setRoleShortdescription(String roleShortdescription) {
		this.roleShortdescription = roleShortdescription;
	}

	public String getRoleLongdescription() {
		return roleLongdescription;
	}

	public void setRoleLongdescription(String roleLongdescription) {
		this.roleLongdescription = roleLongdescription;
	}

	public List<MSecUserRole> getSecUserRoles() {
		return secUserRoles;
	}

	public void setSecUserRoles(List<MSecUserRole> secUserRoles) {
		this.secUserRoles = secUserRoles;
	}

	public List<MSecRoleGroup> getSecRoleGroup() {
		return secRoleGroup;
	}

	public void setSecRoleGroup(List<MSecRoleGroup> secRoleGroup) {
		this.secRoleGroup = secRoleGroup;
	} 
	
}
