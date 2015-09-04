package co.id.spring.mvc.helper;

import java.util.ResourceBundle;

import co.id.spring.mvc.sys.util.Constants;

public class PropertiesHelper {

	static ResourceBundle resUploadProp = ResourceBundle.getBundle(Constants.COMMON.UPLOAD_PATH);

	private PropertiesHelper() {}
	
	// Read Properties File
	public static String readUploadProperties(String key) {
		
		String result = "";
		
		try {
			result = resUploadProp.getString(key);
		} catch (Exception e) {
			e.printStackTrace();
		}		
		
		return result;
	}
	
}
