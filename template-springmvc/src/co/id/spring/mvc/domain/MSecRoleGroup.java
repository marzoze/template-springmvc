package co.id.spring.mvc.domain;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name="M_SEC_ROLE_GROUP", catalog = "")
public class MSecRoleGroup implements Serializable {

	private static final long serialVersionUID = 6567908746322784452L;
	
	@Id
	@Column(name = "SEC_ROLE_GROUP_ID", columnDefinition = "NUMBER(10)")
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "SECROLEGROUPSEQ")
	@SequenceGenerator(name = "SECROLEGROUPSEQ", sequenceName = "SECROLEGROUP_SEQ", allocationSize = 1)
	private Long secRoleGroupId;
	
	@Column(name = "VERSION")
	private int version;
	
	@ManyToOne
	@JoinColumn(name = "SEC_ROLE_ID", nullable = false)
	private MSecRole secRole;
	
	@ManyToOne
	@JoinColumn(name = "SEC_GROUP_ID", nullable = false)
	private MSecGroup secGroup;

	public Long getSecRoleGroupId() {
		return secRoleGroupId;
	}

	public void setSecRoleGroupId(Long secRoleGroupId) {
		this.secRoleGroupId = secRoleGroupId;
	}

	public int getVersion() {
		return version;
	}

	public void setVersion(int version) {
		this.version = version;
	}

	public MSecRole getSecRole() {
		return secRole;
	}

	public void setSecRole(MSecRole secRole) {
		this.secRole = secRole;
	}

	public MSecGroup getSecGroup() {
		return secGroup;
	}

	public void setSecGroup(MSecGroup secGroup) {
		this.secGroup = secGroup;
	} 

}
