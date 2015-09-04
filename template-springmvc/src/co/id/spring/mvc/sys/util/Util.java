package co.id.spring.mvc.sys.util;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Properties;

public class Util {
	
	public static class DATE{	
		public static final Date CURRENT_DATE = getDate();
	}
	
	public static final DateFormat df = new SimpleDateFormat("yyyyMMdd");
	
	private static java.util.Date getDate(){
		DateFormat dateFormat = new SimpleDateFormat ("dd/MM/yyyy HH:mm:ss");
        java.util.Date date = new java.util.Date();
        String dateStr = dateFormat.format (date);
        java.util.Date date2 = new java.util.Date();
        try{
        	date2 = dateFormat.parse (dateStr);
        }catch(ParseException pe){
            pe.printStackTrace();
        }
		return date2;
	}
	
	public Date getCurrentDate(){
		DateFormat dateFormat = new SimpleDateFormat ("dd/MM/yyyy HH:mm:ss");
        java.util.Date date = new java.util.Date();
        String dateStr = dateFormat.format (date);
        java.util.Date date2 = new java.util.Date();
        try{
        	date2 = dateFormat.parse (dateStr);
        }catch(ParseException pe){
            pe.printStackTrace();
        }
		return date2;
	}
	
	public Date convertToDate(String dateStr){
		if(null!=dateStr){
			DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
			try {
				Date date;
				date = (Date) dateFormat.parse(dateStr);
				return date;
			} catch (ParseException pe) {
				pe.printStackTrace();
			}
			return null;
		}
		return null;
	}
	
	public String convertDateToString(Date date){
		if(null!=date){
			DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
		    String dateStr = dateFormat.format (date);			
			return dateStr;
		}
		return null;
	}
    
    public static boolean IsNullOrEmptyString(String s){
        return s == null || s.length() == 0;
    }
    
    public static String getProp(String key){
    	String s = System.getProperty("user.dir");    	
		Properties prop = new Properties();
		String value = null;
		try {
			prop.load(new FileInputStream (s + "/" + "config.properties"));
			 value = prop.getProperty(key);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return value;
     }

}
