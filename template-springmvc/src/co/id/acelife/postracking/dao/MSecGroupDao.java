package co.id.acelife.postracking.dao;

import java.io.Serializable;
import java.util.Iterator;
import java.util.List;

import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.springframework.stereotype.Component;

import co.id.spring.mvc.dao.BaseDaoHibernate;
import co.id.spring.mvc.domain.MSecGroup;
import co.id.spring.mvc.domain.MSecGroupRight;
import co.id.spring.mvc.domain.MSecRoleGroup;
import co.id.spring.mvc.domain.MSecUserRole;

@Component
public class MSecGroupDao extends BaseDaoHibernate<MSecGroup> implements Serializable {

	private static final long serialVersionUID = -2049119056155532925L;
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<MSecGroup> getGroupWithPagination(int offset, int limit){
		String hql = "from " + domainClass.getName();
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setFirstResult(offset);
		query.setMaxResults(limit);
		
		for(Iterator iter = query.list().iterator(); iter.hasNext();){
			MSecGroup msg = (MSecGroup) iter.next();
			for(MSecGroupRight msgr: msg.getSecGrouprights()){
				for(MSecGroupRight msgr2: msgr.getSecRight().getSecGroupRights()){
					for(MSecRoleGroup msrg: msgr2.getSecGroup().getSecRoleGroup()){						
						for(MSecUserRole msur: msrg.getSecRole().getSecUserRoles()){
							Hibernate.initialize(msur.getSecUser().getEmployee().getBranch().getInsertedBy());
						}
					}
				}
			}
		}
		return query.list();
	}
	
}