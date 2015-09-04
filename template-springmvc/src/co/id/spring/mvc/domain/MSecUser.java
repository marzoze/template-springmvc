package co.id.spring.mvc.domain;

import id.co.acelife.concorde.common.MEmployee;
import java.io.Serializable;
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
import javax.persistence.Transient;

@Entity
@Table(name="M_SEC_USER", catalog = "")
public class MSecUser implements Serializable {

	private static final long serialVersionUID = 7112712086166319552L;
	
	@Id
	@Column(name = "SEC_USER_ID", columnDefinition = "NUMBER(10)")
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "SECUSERSEQ")
	@SequenceGenerator(name = "SECUSERSEQ", sequenceName = "SECUSER_SEQ", allocationSize = 1)
	private Long secUserId;
	
	@Column(name = "USER_NAME")
	private String userName;
	
	@Column(name = "PASSWORD")
	private String password;
	
	@ManyToOne
	@JoinColumn(name = "EMPLOYEE_ID")
	private MEmployee employee;
	
	@OneToMany(mappedBy="secUser", cascade=CascadeType.ALL, fetch=FetchType.EAGER)
	private List<MSecUserRole> secUserRoles;
	
	@Transient
	private String firstName;
	
	@Transient
	private String lastName;
	
	@Transient
	private String employeeCode;
	
	@Transient
	private String department;
	
	@Transient
	private String branch;
	
	@Transient
	private String email;

	public Long getSecUserId() {
		return secUserId;
	}

	public void setSecUserId(Long secUserId) {
		this.secUserId = secUserId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public MEmployee getEmployee() {
		return employee;
	}

	public void setEmployee(MEmployee employee) {
		this.employee = employee;
	}

	public List<MSecUserRole> getSecUserRoles() {
		return secUserRoles;
	}

	public void setSecUserRoles(List<MSecUserRole> secUserRoles) {
		this.secUserRoles = secUserRoles;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getEmployeeCode() {
		return employeeCode;
	}

	public void setEmployeeCode(String employeeCode) {
		this.employeeCode = employeeCode;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public String getBranch() {
		return branch;
	}

	public void setBranch(String branch) {
		this.branch = branch;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
}
