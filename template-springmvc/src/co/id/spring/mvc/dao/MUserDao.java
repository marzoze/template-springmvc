package co.id.spring.mvc.dao;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Component;

import co.id.spring.mvc.dao.BaseDaoHibernate;
import co.id.spring.mvc.domain.MUser;

@Component
public class MUserDao extends BaseDaoHibernate<MUser> implements Serializable {

	private static final long serialVersionUID = 2320869558597602353L;	
	
	@SuppressWarnings("unchecked")
	public List<MUser> getUserByUsernameAndPassword(String username, String password){		
		String hql = "from " + domainClass.getName() + " where userName = :username and password = :password";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("username", username);
		query.setParameter("password", password);
		return query.list(); 				 
	}
	
	@SuppressWarnings("unchecked")
	public List<MUser> getUserWithPagination(int offset, int limit){
		Query query = sessionFactory.getCurrentSession().createQuery("from " + domainClass.getName());
		query.setFirstResult(offset);
		query.setMaxResults(limit);
		return query.list();
	}
	
	@SuppressWarnings("unchecked")
	public List<String> listUserAutoComplete(){
		String sql = "select (FIRST_NAME|| '-' ||PASSWORD) as name from M_USER";
		Query query = sessionFactory.getCurrentSession().createSQLQuery(sql);
		return query.list(); 					
	}

}
