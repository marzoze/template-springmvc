package co.id.spring.mvc.dao;

import java.io.Serializable;
import java.util.List;
import org.hibernate.Query;
import org.springframework.stereotype.Component;

import co.id.spring.mvc.dao.BaseDaoHibernate;
import co.id.spring.mvc.domain.MSecRoleGroup;

@Component
public class MSecRoleGroupDao extends BaseDaoHibernate<MSecRoleGroup> implements Serializable {

	private static final long serialVersionUID = -5078286280580468439L;
	
	@SuppressWarnings("unchecked")
	public List<MSecRoleGroup> getRoleGroupById(List<Long> list){
		String hql = "from " + domainClass.getName() + " where secRole.secRoleId in (:list)";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameterList("list", list);
		return query.list();
	}

}