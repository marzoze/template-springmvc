package co.id.spring.mvc.sys.config;

/**
 * This Enum contains all status transaction attribute name.
 *  
 * @author Fathur
 */
public enum TransactionScopeConstants {

	REGISTRATION_IN_PROGRESS("Registration in progress"), // Save by Branch
	PENDING_AT_REGISTRATION("Pending at Registration"), // Submit by Branch
	REGISTERED_BY_HO("Registered"), // Submit by HO
	CANCELLED("Cancelled"),
	IN_PROGRESS("In Progress"),
	APPROVE("Approve"),
	CLOSE("Close"),
	REJECT("Reject");
	
	private TransactionScopeConstants(String key) {
		this.key = key;
	}

	private final String key;

	public String getKey() {
		return key;
	}
	
	@Override
	public String toString(){
		return key;
	}
}
