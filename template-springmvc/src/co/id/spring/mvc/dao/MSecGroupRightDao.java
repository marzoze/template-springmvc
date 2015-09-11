package co.id.spring.mvc.dao;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Component;

import co.id.spring.mvc.dao.BaseDaoHibernate;
import co.id.spring.mvc.domain.MSecGroupRight;

@Component
public class MSecGroupRightDao extends BaseDaoHibernate<MSecGroupRight> implements Serializable {

	private static final long serialVersionUID = -6890587921786784464L;
	
	@SuppressWarnings("unchecked")
	public List<MSecGroupRight> getGroupRight(List<Long> list){
		String hql = "from " + domainClass.getName() + " where secGroup.secGroupId in (:list)";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameterList("list", list);
		return query.list();
	}
	
}