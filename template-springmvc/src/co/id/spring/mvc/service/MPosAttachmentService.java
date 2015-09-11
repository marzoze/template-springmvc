package co.id.spring.mvc.service;

import java.math.BigDecimal;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import co.id.spring.mvc.domain.MPosAttachment;

public interface MPosAttachmentService {
	
	BigDecimal nextSequenceAttachment();
	MPosAttachment getById(Long id);
	void save(MPosAttachment attachment);
	List<MPosAttachment> getAttachmentById(Long id);	
	void delete(MPosAttachment attachment);
	int deleteByFileIndex(String fileIndex, String tranTypeNo);
	List<MPosAttachment> getAttachmentByTranNo(String tranNo);
	List<MPosAttachment> getAttachment(HttpServletRequest request);	
	List<MPosAttachment> getAttachmentByTranNoAndDocumentDesc(String tranTypeNo, String documentDesc);
	List<MPosAttachment> getAttachmentByTranNoFileIndexAndFileName(String tranNo, String fileIndex, String fileName);

}