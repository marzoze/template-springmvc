package co.id.spring.mvc.service;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import co.id.spring.mvc.dao.MPosAttachmentDao;
import co.id.spring.mvc.domain.MPosAttachment;

@Service("mPosAttachmentService")
@Transactional(readOnly=true)
public class MPosAttachmentServiceImpl implements MPosAttachmentService, Serializable {
	
	private static final long serialVersionUID = 1211280191899801844L;
	
	@Autowired
	private MPosAttachmentDao mPosAttachmentDao;

	@Override
	public MPosAttachment getById(Long id) {
		return mPosAttachmentDao.getById(id);
	}

	@Override
	@Transactional(readOnly=false)
	public void save(MPosAttachment mPosAttach) {
		mPosAttachmentDao.saveOrUpdate(mPosAttach);
	}

	@Override
	public BigDecimal nextSequenceAttachment() {
		return mPosAttachmentDao.nextSequenceAttachment();
	}

	@Override
	public List<MPosAttachment> getAttachmentById(Long id) {
		return mPosAttachmentDao.getAttachmentById(id);
	}

	@Override
	@Transactional(readOnly=false)
	public void delete(MPosAttachment mPosAttach) {
		mPosAttachmentDao.delete(mPosAttach);
	}

	@Override
	@Transactional(readOnly=false)
	public int deleteByFileIndex(String fileIndex, String tranTypeNo) {
		return mPosAttachmentDao.deleteAttachmentByFileIndex(fileIndex, tranTypeNo);
	}

	@Override
	public List<MPosAttachment> getAttachmentByTranNo(String tranNo) {
		return mPosAttachmentDao.getAttachmentByTranNo(tranNo);
	}

	@Override
	public List<MPosAttachment> getAttachment(HttpServletRequest request) {
		return mPosAttachmentDao.getAttachment(request);
	}

	@Override
	public List<MPosAttachment> getAttachmentByTranNoAndDocumentDesc(
			String tranTypeNo, String documentDesc) {
		return mPosAttachmentDao.getAttachmentByTranNoAndDocumentDesc(tranTypeNo, documentDesc);
	}

	@Override
	public List<MPosAttachment> getAttachmentByTranNoFileIndexAndFileName(
			String tranNo, String fileIndex, String fileName) {
		return mPosAttachmentDao.getAttachmentByTranNoFileIndexAndFileName(tranNo, fileIndex, fileName);
	}
	
}