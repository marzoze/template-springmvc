package co.id.spring.mvc.helper;

import java.security.MessageDigest;
import java.security.Security;
import javax.crypto.*;
import javax.crypto.interfaces.*;
import javax.crypto.Cipher;
import javax.crypto.spec.DESKeySpec;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

@SuppressWarnings({ "unused" })
public class DESEncryptor {
	
	public static final String PASSPHRASE = "Mangka ng Jinatwa kalawan Siwatatwa tunggal";
	
	public static byte [] encrypt (byte [] data) throws Exception {

		byte [] dataTemp;
		//PMLogger logger = new PMLogger(PMLoggerConstants.DEFECTO);

		try {
			//Security.addProvider( new com.sun.crypto.provider.SunJCE() );
			MessageDigest md = MessageDigest.getInstance("MD5");
			md.update(PASSPHRASE.getBytes());
			DESKeySpec key = new DESKeySpec (md.digest());
			SecretKeySpec DESKey = new SecretKeySpec (key.getKey(), "DES");
			
			Cipher cipher = Cipher.getInstance("DES/ECB/PKCS5Padding");
			cipher.init(Cipher.ENCRYPT_MODE, DESKey);
			dataTemp = cipher.doFinal (data);
		}catch (Exception e) {
			throw e;
		}

		return dataTemp;
	}

	public static byte [] decrypt (byte [] data) throws Exception {

		byte [] dataTemp;

		//PMLogger logger = new PMLogger(PMLoggerConstants.DEFECTO);

		try {
			Security.addProvider( new com.sun.crypto.provider.SunJCE() );
			MessageDigest md = MessageDigest.getInstance("MD5");
			md.update(PASSPHRASE.getBytes());
			DESKeySpec key = new DESKeySpec (md.digest());
			SecretKeySpec DESKey = new SecretKeySpec (key.getKey(), "DES");
	
			Cipher cipher = Cipher.getInstance("DES/ECB/PKCS5Padding");
			cipher.init(Cipher.DECRYPT_MODE, DESKey);
	
			dataTemp = cipher.doFinal (data);
		}catch (Exception e) {
			//logger.error("[com.DESEncryptor]+e);
			throw e;
		}

		return dataTemp;

	}	
}
