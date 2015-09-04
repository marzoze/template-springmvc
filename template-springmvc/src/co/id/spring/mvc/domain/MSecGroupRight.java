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
@Table(name="M_SEC_GROUP_RIGHT", catalog = "")
public class MSecGroupRight implements Serializable {

	private static final long serialVersionUID = -4796763921100842598L;
	
	@Id
	@Column(name = "SEC_GROUP_RIGHT_ID", columnDefinition = "NUMBER(10)")
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "SECGROUPRIGHTSEQ")
	@SequenceGenerator(name = "SECGROUPRIGHTSEQ", sequenceName = "SECGROUPRIGHT_SEQ", allocationSize = 1)
	private Long secGroupRightId;
	
	@Column(name = "version")
	private int version;
	
	@ManyToOne
	@JoinColumn(name = "SEC_GROUP_ID", nullable = false)
	private MSecGroup secGroup;
	
	@ManyToOne
	@JoinColumn(name = "SEC_RIGHT_ID", nullable = false)
	private MSecRight secRight;

	
	public Long getSecGroupRightId() {
		return secGroupRightId;
	}

	public void setSecGroupRightId(Long secGroupRightId) {
		this.secGroupRightId = secGroupRightId;
	}

	public int getVersion() {
		return version;
	}

	public void setVersion(int version) {
		this.version = version;
	}

	public MSecGroup getSecGroup() {
		return secGroup;
	}

	public void setSecGroup(MSecGroup secGroup) {
		this.secGroup = secGroup;
	}

	public MSecRight getSecRight() {
		return secRight;
	}

	public void setSecRight(MSecRight secRight) {
		this.secRight = secRight;
	}
	
}