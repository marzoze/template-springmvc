package co.id.spring.mvc.dao;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.lang.StringUtils;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.criterion.Expression;
import org.springframework.stereotype.Component;
import co.id.spring.mvc.domain.MPosAttachment;

@SuppressWarnings("deprecation")
@Component
public class MPosAttachmentDao extends BaseDaoHibernate<MPosAttachment> implements Serializable {

	private static final long serialVersionUID = -6168643130689289499L;
	
	public BigDecimal nextSequenceAttachment(){
		Query query 
			= sessionFactory
				.getCurrentSession()
				.createSQLQuery
					("select POSATTACHIDFK_SEQ.nextval "
					+ "from dual where rownum = 1");		
		return (BigDecimal) query.list().get(0);
	}
	
	@SuppressWarnings("unchecked")
	public List<MPosAttachment> getAttachmentById(Long id){
		StringBuilder hql = new StringBuilder();
		hql.append("from ");
		hql.append(domainClass.getName());
		hql.append(" where posAttachIdFK = :id");
		Query query 
			= sessionFactory
				.getCurrentSession()
				.createQuery(hql.toString());
		query.setParameter("id", id);
		return query.list();
	}
	
	public int deleteAttachmentByFileIndex(String fileIndex, String tranTypeNo){
		StringBuilder hql = new StringBuilder();
		hql.append("delete MPosAttachment attachment ");
		hql.append("where attachment.fileIndex = :fileIndex ");
		hql.append("and attachment.transactionNumber = :tranTypeNo");
		Query query = sessionFactory.getCurrentSession().createQuery(hql.toString());
		query.setParameter("fileIndex", fileIndex);
		query.setParameter("tranTypeNo", tranTypeNo);
		return query.executeUpdate();
	}
	
	@SuppressWarnings("unchecked")
	public List<MPosAttachment> getAttachmentByTranNo(String transactionNumber){
		Query query 
			= sessionFactory
				.getCurrentSession()
				.createQuery
					( "from " 
					+ domainClass.getName() 
					+ " where transactionNumber = "
					+ ":transactionNumber");
		query.setParameter("transactionNumber", transactionNumber);
		return query.list();
	}
	
	@SuppressWarnings("unchecked")
	public List<MPosAttachment> getAttachment(HttpServletRequest request){
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(MPosAttachment.class);
		String tranTypeNo = request.getParameter("tranTypeNo");
		String index	  = request.getParameter("index");		
		if (!StringUtils.isEmpty(tranTypeNo)) {
			criteria.add(Expression.eq("transactionNumber", tranTypeNo));
		}
		if (!StringUtils.isEmpty(index)) {
			criteria.add(Expression.eq("fileIndex", index));
		}		
		return criteria.list();
	}
	
	@SuppressWarnings("unchecked")
	public List<MPosAttachment> getAttachmentByTranNoAndDocumentDesc(String tranTypeNo, String documentDesc){
		StringBuilder hql = new StringBuilder();
		hql.append("from ");
		hql.append(domainClass.getName());
		hql.append(" where transactionNumber = :tranTypeNo ");
		hql.append("and documentDesc != :documentDesc ");
		Query query = sessionFactory.getCurrentSession().createQuery(hql.toString());
		query.setParameter("tranTypeNo", tranTypeNo);
		query.setParameter("documentDesc", documentDesc);
		return query.list();
	}
	
	@SuppressWarnings("unchecked")
	public List<MPosAttachment> getAttachmentByTranNoFileIndexAndFileName(
			String transactionNumber, String fileIndex, String fileName){
		StringBuilder hql = new StringBuilder();
		hql.append("from ");
		hql.append(domainClass.getName());
		hql.append(" where transactionNumber = :transactionNumber ");
		hql.append("and fileIndex = :fileIndex ");
		hql.append("and originalFilename = :fileName ");
		Query query = sessionFactory.getCurrentSession().createQuery(hql.toString());
		query.setParameter("transactionNumber", transactionNumber);
		query.setParameter("fileIndex", fileIndex);
		query.setParameter("fileName", fileName);
		return query.list();
	}

}