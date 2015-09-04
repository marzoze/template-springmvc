package co.id.spring.mvc.sys.util;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ComboUtil<T> extends JSONUtil {
    private static final String DEFAULT_LABEL = "ALL";    
    private static final String DEFAULT_LABEL2 = "--- Please Select ---";    
    private String id;
    private String label;
    private String defaultLabel;
    private Collection<T> list;
    private Class<?> clazz;
    private boolean hasDefault;
    private String title;

    public ComboUtil(Class<?> clazz, Collection<T> list, String id, String label) {
        this(clazz, list, id, label, null);
    }

    public ComboUtil(Class<?> clazz, Collection<T> list, String id, String label, String defaultLabel) {
        super();
        // set class reference
        this.clazz = clazz;
        // set property name for id
        this.id = id;
        // set property name for label
        this.label = label;
        // set default label
        //this.defaultLabel = defaultLabel;
        
        this.hasDefault = true;
        
        //OR IFT_MIIS2_ML_040
        if(DEFAULT_LABEL.equals(defaultLabel)){
        	this.defaultLabel = defaultLabel;        
        }else if("".equals(defaultLabel) || defaultLabel == null){
        	this.defaultLabel = null;
        	this.hasDefault = false;
        }else{
        	this.defaultLabel = DEFAULT_LABEL2;
        }

        // set collection
        this.list = list;
    }
    
    public ComboUtil(Class<?> clazz, Collection<T> list, String id, String label, String defaultLabel, String title) {
    	this(clazz,list,id,label,defaultLabel);
        this.title = title;
    }

    @Override
    public String serialize() {
        List<Map<String, Object>> options = new ArrayList<Map<String, Object>>();
        // add default label on first option
        Map<String, Object> defaultOption = new HashMap<String, Object>(2);
        if(this.hasDefault){
        	defaultOption.put("id", "");
        	defaultOption.put("label", getDefaultLabel());
        	if(this.getTitle() != null){
        		defaultOption.put("title", this.getTitle());
        	}
        	options.add(defaultOption);
        }
        // loop through the colletion
        for (T obj : list) {
            Map<String, Object> option = new HashMap<String, Object>(2);
            try {
                // get id based on property passed on argument
                Method getId = clazz.getMethod(StringUtils.toGetterName(id));
                option.put("id", getId.invoke(obj));

                // get label based on property passed on argument
                Method getLabel = clazz.getMethod(StringUtils.toGetterName(label));
                option.put("label", getLabel.invoke(obj));
                
                // get title based on property passed on argument
                if(this.getTitle() != null){
                	Method getTitle = clazz.getMethod(StringUtils.toGetterName(title));
                	option.put("title", getTitle.invoke(obj));
                }

                // put into list
                options.add(option);
            } catch (NoSuchMethodException ignored) {
            } catch (InvocationTargetException ignored) {
            } catch (IllegalAccessException ignored) { }
        }
        // put list into object options
        addData("options", options);
        return super.serialize();
    }
    
    @SuppressWarnings("unused")
	public String serialize2() {
        List<Map<String, Object>> options = new ArrayList<Map<String, Object>>();
        // add default label on first option
        Map<String, Object> defaultOption = new HashMap<String, Object>(2);
        // loop through the colletion
        for (T obj : list) {
            Map<String, Object> option = new HashMap<String, Object>(2);
            try {
                // get id based on property passed on argument
                Method getId = clazz.getMethod(StringUtils.toGetterName(id));
                option.put("id", getId.invoke(obj));

                // get label based on property passed on argument
                Method getLabel = clazz.getMethod(StringUtils.toGetterName(label));
                option.put("label", getLabel.invoke(obj));
                
             	// get title based on property passed on argument
                if(this.getTitle() != null){
                	Method getTitle = clazz.getMethod(StringUtils.toGetterName(title));
                	option.put("title", getTitle.invoke(obj));
                }

                // put into list
                if(!options.contains(option))
                	options.add(option);
            } catch (NoSuchMethodException ignored) {
            } catch (InvocationTargetException ignored) {
            } catch (IllegalAccessException ignored) { }
        }
        // put list into object options
        addData("options", options);
        return super.serialize();
    }

    public String getDefaultLabel() {
        return defaultLabel == null ? DEFAULT_LABEL : defaultLabel;
    }

    public void setDefaultLabel(String defaultLabel) {
        this.defaultLabel = defaultLabel;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getLabel() {
        return label;
    }

    public void setLabel(String label) {
        this.label = label;
    }

    public Collection<T> getList() {
        return list;
    }

    public void setList(Collection<T> list) {
        this.list = list;
    }

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
}
