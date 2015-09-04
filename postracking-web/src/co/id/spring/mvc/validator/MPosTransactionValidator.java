package co.id.spring.mvc.validator;

import org.springframework.util.StringUtils;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;
import co.id.spring.mvc.domain.MPosTransaction;
import co.id.spring.mvc.sys.util.Constants;

public class MPosTransactionValidator implements Validator {

	@SuppressWarnings({ "rawtypes"})
	@Override
	public boolean supports(Class clazz) {
		return MPosTransaction.class.equals(clazz);
	}

	@Override
	public void validate(Object obj, Errors errors) {
		
		MPosTransaction posTransaction = (MPosTransaction) obj;
		
/*		if(!StringUtils.hasText(posTransaction.getPolicyCode())){
			errors.rejectValue("policyCode", Constants.POS.ERROR.POLICYINFO_REQUIRED_FIELD, null);		
		}*/
		
		if(posTransaction.getTransactionTypes().isEmpty()){
			errors.rejectValue("transactionTypes", Constants.POS.ERROR.TRXTYPE_REQUIRED_FIELD, null);
		}
		
	}

}
