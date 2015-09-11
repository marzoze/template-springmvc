package co.id.spring.mvc.dao;

import java.io.Serializable;
import java.util.Iterator;
import java.util.List;

import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.springframework.stereotype.Component;

import co.id.spring.mvc.dao.BaseDaoHibernate;
import co.id.spring.mvc.domain.MSecRole;
import co.id.spring.mvc.domain.MSecUserRole;

@Component
public class MSecRoleDao extends BaseDaoHibernate<MSecRole> implements Serializable {

	private static final long serialVersionUID = 7421642854919086892L;
	
	@SuppressWarnings("unchecked")
	public List<MSecRole> getRolesById(Long id){
		String sql = "select * from M_SEC_ROLE where SEC_ROLE_ID = :id";
		Query query = sessionFactory.getCurrentSession().createSQLQuery(sql);
		query.setParameter("id", id);
		return query.list();
	}
	
	@SuppressWarnings("unchecked")
	public List<MSecRole> getRolesById(List<MSecUserRole> list){
		String hql = "from " + domainClass.getName() + " where secRoleId in (:list)";	
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameterList("list", list);
		return query.list();
	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<MSecRole> getRoleWithPagination(int offset, int limit){
		String hql = "from " + domainClass.getName();
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setFirstResult(offset);
		query.setMaxResults(limit);
		
		for (Iterator iter = query.list().iterator(); iter.hasNext();) {	
			MSecRole msr = (MSecRole) iter.next();			
			for(MSecUserRole msur: msr.getSecUserRoles()){
				Hibernate.initialize(msur.getSecUser().getEmployee().getBranch().getInsertedBy());		
			}
		}
		
		return query.list();
	}

}