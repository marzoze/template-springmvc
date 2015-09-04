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
@Table(name="M_SEC_USER_ROLE", catalog = "")
public class MSecUserRole implements Serializable {

	private static final long serialVersionUID = 316316288503000911L;
	
	@Id
	@Column(name = "SEC_USER_ROLE_ID", columnDefinition = "NUMBER(10)")
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "SECUSERROLESEQ")
	@SequenceGenerator(name = "SECUSERROLESEQ", sequenceName = "SECUSERROLE_SEQ", allocationSize = 1)
	private Long secUserRole;
	
	@Column(name = "VERSION")
	private int version;
	
	@ManyToOne
	@JoinColumn(name = "SEC_USER_ID", nullable = false)
	private MSecUser secUser;
	
	@ManyToOne
	@JoinColumn(name = "SEC_ROLE_ID", nullable = false)
	private MSecRole secRole;

	public Long getSecUserRole() {
		return secUserRole;
	}

	public void setSecUserRole(Long secUserRole) {
		this.secUserRole = secUserRole;
	}

	public int getVersion() {
		return version;
	}

	public void setVersion(int version) {
		this.version = version;
	}

	public MSecUser getSecUser() {
		return secUser;
	}

	public void setSecUser(MSecUser secUser) {
		this.secUser = secUser;
	}

	public MSecRole getSecRole() {
		return secRole;
	}

	public void setSecRole(MSecRole secRole) {
		this.secRole = secRole;
	}
	
}
