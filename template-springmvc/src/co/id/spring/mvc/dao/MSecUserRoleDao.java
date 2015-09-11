package co.id.spring.mvc.dao;

import java.io.Serializable;

import org.springframework.stereotype.Component;

import co.id.spring.mvc.dao.BaseDaoHibernate;
import co.id.spring.mvc.domain.MSecUserRole;

@Component
public class MSecUserRoleDao extends BaseDaoHibernate<MSecUserRole> implements Serializable {

	private static final long serialVersionUID = 9081703569389552421L;

}
