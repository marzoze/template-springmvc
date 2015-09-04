package co.id.spring.mvc.sys.util;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import co.id.spring.mvc.sys.config.CommonConstants;
import flexjson.DateTransformer;
import flexjson.JSONSerializer;


public class JSONUtil {
    private Map<String, Object> data;
	private Set<String> dateFields;
	private String dateFormat;

	public String getDateFormat() {
		return dateFormat;
	}

	public void setDateFormat(String dateFormat) {
		this.dateFormat = dateFormat;
	}

	public JSONUtil(){
		data = new HashMap<String, Object>();
	}

	/**
	 * add date field name to be transform
	 * @param fieldName the field name
	 */
	public void addDateField(String fieldName){
		if(dateFields == null){
			dateFields = new HashSet<String>();
		}
		dateFields.add(fieldName);
	}

	/**
	 * add the data to be transform.
	 * @param key the key value
	 * @param value the object
	 */
	public void addData(String key, Object value){
		data.put(key, value);
	}


	/**
	 * Set the mapped data
	 * @param data the data map
	 */
	public void setData(Map<String, Object>  data ){
		this.data=data;
	}

	/**
	 * serialize json object
	 * @return json object
	 */
	public String serialize(){
		JSONSerializer json = new JSONSerializer();
		if((dateFields != null) && (dateFields.size() > 0)){
			DateTransformer transformer = new DateTransformer(CommonConstants.DATE_FORMAT);
			if(null!=this.getDateFormat()){
				transformer = new DateTransformer(this.getDateFormat());
			}
			for (String field : dateFields) {
				json.transform(transformer, field);
			}
		}
		return json.exclude("*.class").deepSerialize(data);
	}
}
