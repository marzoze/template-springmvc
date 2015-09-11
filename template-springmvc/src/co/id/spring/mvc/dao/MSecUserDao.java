package co.id.spring.mvc.dao;

import java.io.Serializable;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.hibernate.Criteria;
import org.hibernate.Hibernate;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.criterion.Expression;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Component;

import co.id.spring.mvc.dao.BaseDaoHibernate;
import co.id.spring.mvc.domain.MSecUser;

@SuppressWarnings("deprecation")
@Component
public class MSecUserDao extends BaseDaoHibernate<MSecUser> implements Serializable {

	private static final long serialVersionUID = 4111130247071798884L;
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<MSecUser> getUserByUsernameAndPassword(String username, String password){		
		String hql = "from " + domainClass.getName() + " where userName = :username and password = :password";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("username", username);
		query.setParameter("password", password);
		
		try {
			for (Iterator iter = query.list().iterator(); iter.hasNext();) {		
				MSecUser msu = (MSecUser) iter.next();				
				Hibernate.initialize(msu.getSecUserRoles());											
			}
		}catch (HibernateException e) {
			e.printStackTrace();
		}
		return query.list(); 				 
	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<MSecUser> getUserWithPagination(int offset, int limit, HttpServletRequest request){
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(MSecUser.class);
		String userName													= request.getParameter("username");
		String name														= request.getParameter("name");
		String branch													= request.getParameter("branch");
		if(!StringUtils.isEmpty(userName)){
			criteria.add(Expression.sql("lower(USER_NAME) like lower(?)", "%"+userName.toLowerCase()+"%", Hibernate.STRING));
		}
		if(!StringUtils.isEmpty(name)){
			criteria.add(Restrictions.like("employee.fullName", name, MatchMode.START));
		}
		if(!StringUtils.isEmpty(branch)){
			Long branchId = Long.valueOf(request.getParameter("branch"));
			criteria.add(Expression.eq("employee.branch.locationId", branchId));
		}
		criteria.setFirstResult(offset);
		criteria.setMaxResults(limit);
		for (Iterator iter = criteria.list().iterator(); iter.hasNext();) {
			MSecUser msu = (MSecUser) iter.next();	
			Hibernate.initialize(msu.getEmployee().getBranch().getInsertedBy());
		}
		return criteria.list();
	}

}
