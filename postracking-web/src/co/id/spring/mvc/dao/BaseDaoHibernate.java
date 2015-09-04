
package co.id.spring.mvc.dao;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.util.List;

/**
 * every DAO must extend this class
 * 
 */
public abstract class BaseDaoHibernate<T extends Serializable> {

	@SuppressWarnings("rawtypes")
	protected Class domainClass;
	
	@Autowired
	protected SessionFactory sessionFactory;

	@SuppressWarnings("rawtypes")
	public BaseDaoHibernate() {
		this.domainClass = (Class) ((ParameterizedType)
				getClass().getGenericSuperclass())
				.getActualTypeArguments()[0];										
	}
	
	@SuppressWarnings({ "unchecked", "hiding" })
	public <T> T save(T domain) {
		return (T) sessionFactory.getCurrentSession().save(domain);
	}
		
	@SuppressWarnings("hiding")
	public <T> void saveOrUpdate(T domain){
	    sessionFactory.getCurrentSession().saveOrUpdate(domain);
	}
	
	@SuppressWarnings("unchecked")
	public T getById(Long id) {
		return (T) sessionFactory.getCurrentSession().get(domainClass, id);
	}	
	
	public void delete(T domain) {
		sessionFactory.getCurrentSession().delete(domain);
	}
	
	@SuppressWarnings({ "rawtypes" })
	public Long count() {
		List list = sessionFactory.getCurrentSession().createQuery(
		"select count(*) from " + domainClass.getName() + " x").list();
		Long count = (Long) list.get(0);
		return count;
	}
	
	@SuppressWarnings("unchecked")
	public List<T> getAll() {
		return sessionFactory.getCurrentSession().createQuery("from " +
		domainClass.getName())
		.list();
	}
	
	@SuppressWarnings("unchecked")
	public List<T> getAll(int start, int num) {
		return sessionFactory.getCurrentSession().createQuery("from " +
		domainClass.getName())
		.setFirstResult(start).setMaxResults(num)
		.list();
	}
		
}
