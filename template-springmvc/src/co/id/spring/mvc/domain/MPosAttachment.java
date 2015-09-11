package co.id.spring.mvc.domain;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name="M_POS_ATTACHMENT", catalog = "", schema = "posttrack")
public class MPosAttachment implements Serializable {

	private static final long serialVersionUID = 6412901512290596130L;
	
	@Id
	@Column(name = "POS_ATTACHMENT_ID", columnDefinition = "NUMBER(10)")
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "POSATTACHMENTSEQ")
	@SequenceGenerator(name = "POSATTACHMENTSEQ", sequenceName = "POSATTACHMENT_SEQ", allocationSize = 1)
	private Long posAttachmentId;
	
	@Column(name = "FILE_NAME")
	private String filename;
	
	@Column(name = "ORIGINAL_FILENAME")
	private String originalFilename;
	
	@Column(name = "FOLDER")
	private String folder;
	
	@Column(name = "UPLOAD_TIMESTAMP")
	private Date uploadTimestamp;
	
	@Column(name = "TYPE")
	private String type;
	
	@Column(name = "PATH")
	private String path;
	
	@Column(name = "TRANSACTION_NUMBER")
	private String transactionNumber; // ini yang jadi rujukan untuk mendapatkan attachment file
	
	@Column(name = "FILE_INDEX")
	private String fileIndex;
	
	@Column(name = "SERVICE_ID")
	private String serviceId;
	
	@Column(name = "DOCUMENT_DESC")
	private String documentDesc;
	

	public String getDocumentDesc() {
		return documentDesc;
	}

	public void setDocumentDesc(String documentDesc) {
		this.documentDesc = documentDesc;
	}

	public String getServiceId() {
		return serviceId;
	}

	public void setServiceId(String serviceId) {
		this.serviceId = serviceId;
	}

	public String getFileIndex() {
		return fileIndex;
	}

	public void setFileIndex(String fileIndex) {
		this.fileIndex = fileIndex;
	}

	public String getTransactionNumber() {
		return transactionNumber;
	}

	public void setTransactionNumber(String transactionNumber) {
		this.transactionNumber = transactionNumber;
	}
	
	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public String getFolder() {
		return folder;
	}

	public void setFolder(String folder) {
		this.folder = folder;
	}

	public Date getUploadTimestamp() {
		return uploadTimestamp;
	}

	public void setUploadTimestamp(Date uploadTimestamp) {
		this.uploadTimestamp = uploadTimestamp;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public String getOriginalFilename() {
		return originalFilename;
	}

	public void setOriginalFilename(String originalFilename) {
		this.originalFilename = originalFilename;
	}

	public Long getPosAttachmentId() {
		return posAttachmentId;
	}

	public void setPosAttachmentId(Long posAttachmentId) {
		this.posAttachmentId = posAttachmentId;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((posAttachmentId == null) ? 0 : posAttachmentId.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		MPosAttachment other = (MPosAttachment) obj;
		if (posAttachmentId == null) {
			if (other.posAttachmentId != null)
				return false;
		} else if (!posAttachmentId.equals(other.posAttachmentId))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "MPosAttach [posAttachmentId=" + posAttachmentId + "]";
	}
	
	
}