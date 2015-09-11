package co.id.spring.mvc.action;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Date;
import java.util.List;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import co.id.spring.mvc.domain.MPosAttachment;
import co.id.spring.mvc.service.MPosAttachmentService;
import co.id.spring.mvc.sys.action.BaseActionBean;
import co.id.spring.mvc.sys.action.BaseActionBeanContext;
import co.id.spring.mvc.sys.util.Constants;

/**
 * @author FATCHX
 *
 */
public class AttachmentActionBean extends BaseActionBean {

	private static final long serialVersionUID = -7294987933204022046L;
	private static final Logger log = Logger.getLogger(BaseActionBeanContext.class);
	
	@Autowired private MPosAttachmentService mPosAttachService;
	
	@Value(Constants.COMMON.UPLOAD_PATH) 
	private String uploadPath;
	
	public String getUploadPath() {
		return uploadPath;
	}

	public void setUploadPath(String uploadPath) {
		this.uploadPath = uploadPath;
	}

	/**
	 * @param file
	 * @param posNumber
	 * @param tranId
	 * @param fileIndex
	 * @param tranNo
	 * @param serviceId
	 * @param documentDesc
	 * @return id
	 * @throws Exception
	 */
	protected Long saveFileAttachment
		(MultipartFile file, 
		 String posNumber, 
		 Long tranId, 
		 String fileIndex, 
		 String tranNo, 
		 String serviceId, 
		 String documentDesc) throws Exception {	
		
		StringBuilder result = new StringBuilder();				
		String fileLocation = uploadPath;
		Long id = Long.valueOf(0);		
		
		if (file != null) {
			String storeName[] = null;
			String originalFilename = null;
			log.info("Original Filename " + file.getOriginalFilename());  
			originalFilename = file.getOriginalFilename().toString();
			storeName = parseExtensionFile(file.getOriginalFilename());
			String folder01 = posNumber.replace("/", "");
			String folder02 = tranNo.replace("/", "");
			
			try {
				result.append
					(this.sendFile
							(file, originalFilename, folder01, fileIndex, folder02));
			} catch (Exception e) {
				id = Long.valueOf(0);
				log.error("Error " + e.getMessage());
				e.printStackTrace();
			}	    	
			
			mPosAttachService.deleteByFileIndex(fileIndex,tranNo);
			if (result.toString().equalsIgnoreCase(Constants.COMMON.Attachment.UPLOADED)) {						
				MPosAttachment attachment = new MPosAttachment();
				attachment.setTransactionNumber(tranNo);
				attachment.setServiceId(serviceId);
				attachment.setFilename(fileIndex + "_" + file.getOriginalFilename());	
				attachment.setType(storeName[1]);
				attachment.setOriginalFilename(file.getOriginalFilename());
				attachment.setFolder(fileLocation + folder01 + File.separator + folder02);
				attachment.setUploadTimestamp(new Date());
				attachment.setPath(fileLocation + folder01 + File.separator + folder02);
				attachment.setFileIndex(fileIndex);				
				attachment.setDocumentDesc(documentDesc);
				mPosAttachService.save(attachment);
			} else id = Long.valueOf(0);
		}
		return id;
	}
	
	/**
	 * @param files
	 * @param posNumber
	 * @param tranId
	 * @return id
	 * @throws Exception
	 */
	protected Long saveFileAttachment
		(List<CommonsMultipartFile> files, 
		 String posNumber, 
		 Long tranId) throws Exception {
		
		String result = new String();				
		String fileLocation = uploadPath;
		Long id = Long.valueOf(0);
		
		if (files != null) {
			
			String storeName[] = null;
			String originalFilename = null;
			
			if (tranId != null) {
				
				if(id == null)
					id = mPosAttachService.nextSequenceAttachment().longValue();
			} else 	id = mPosAttachService.nextSequenceAttachment().longValue();
			
			for (CommonsMultipartFile commonsMultipartFile: files) {
				
				if (commonsMultipartFile.getSize() > 0) {
					
					log.info("Original Filename : " + commonsMultipartFile.getOriginalFilename());
					originalFilename = commonsMultipartFile.getOriginalFilename().toString();
					storeName = parseExtensionFile(commonsMultipartFile.getOriginalFilename());
					String folder = posNumber.replace("/", "");
					
					try {
						result = this.sendFile(commonsMultipartFile, originalFilename, folder);
					} catch (Exception e) {
						id = Long.valueOf(0);
						log.error("Error " + e.getMessage());
						e.printStackTrace();
					}
					
					if (result.equalsIgnoreCase(Constants.COMMON.Attachment.UPLOADED)) {						
						MPosAttachment attachment = new MPosAttachment();
						attachment.setFilename(storeName[0]);	
						attachment.setType(storeName[1]);
						attachment.setOriginalFilename(commonsMultipartFile.getOriginalFilename());
						attachment.setFolder(fileLocation + folder);
						attachment.setUploadTimestamp(new Date());
						attachment.setPath(fileLocation + folder);
						mPosAttachService.save(attachment);					
					} else id = Long.valueOf(0);
				}
			}							    			   
		}
		return id;
	}
	
	/**
	 * @param multipartFile
	 * @param filename
	 * @param folder01
	 * @param fileIndex
	 * @param folder02
	 * @return id
	 */
	public String sendFile
		(MultipartFile multipartFile, 
		 String filename, 
		 String folder01, 
		 String fileIndex, 
		 String folder02) {
		
    	String result 		= Constants.COMMON.Attachment.UPLOADED;    	
    	String fileLocation = uploadPath;    			
		byte[] byteArr 		= null;
		File file 			= null;
		
		try {
			byteArr = multipartFile.getBytes();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		InputStream inputStream = new ByteArrayInputStream(byteArr); 
    	FileOutputStream fos = null;
    	file = new File(fileLocation + folder01 + "/" + folder02);
    	
    	if (!file.exists())	file.mkdirs();
    	String fullPath 
    		= fileLocation 
    		+ folder01 
    		+ "/" 
    		+ folder02
    		+ "/"
    		+ fileIndex
    		+ "_"
    		+ filename;
    	
		try {			
			file = new File(fullPath);
			fos = new FileOutputStream(file);				
			byte[] buffer = new byte[1024000];				
			int len = inputStream.read(buffer);			 
			while (len != -1) {				
			    fos.write(buffer, 0, len);
			    len = inputStream.read(buffer);
			}
			result = Constants.COMMON.Attachment.UPLOADED;
		} catch(FileNotFoundException e) {
			log.error
				("Upload " 
				+ filename 
				+ " in to " 
				+ fileLocation
				+ folder01
				+ folder02
				+ " failed...");
			result = Constants.COMMON.Attachment.UPLOAD_FAILED;
			e.printStackTrace();
		} catch (IOException e) {
			log.error
				("Upload " 
				+ filename 
				+ " in to " 
				+ fileLocation 
				+ folder01
				+ folder02
				+ " failed...");
			result = Constants.COMMON.Attachment.UPLOAD_FAILED;
			e.printStackTrace();
		}
		
		finally {
			if(fos != null){
				try {
					fos.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
        return result;
    }
	
	/**
	 * @param commonsMultipartFile
	 * @param filename
	 * @param folder
	 * @return string msg
	 */
	public String sendFile
		(CommonsMultipartFile commonsMultipartFile, 
		 String filename, 
		 String folder) {
		
    	String result 		= Constants.COMMON.Attachment.UPLOADED;    	
    	String fileLocation = uploadPath;
    	File file 			= null;
    	
		byte[] byteArr = null;		
		byteArr = commonsMultipartFile.getBytes();
		InputStream inputStream = new ByteArrayInputStream(byteArr); 
    	FileOutputStream fos = null;    	
    	file = new File(fileLocation + folder);
    	
    	if(!file.exists()) file.mkdirs();
    	String fullPath 
    		= fileLocation 
    		+ folder 
    		+ "/" 
    		+ filename;
    	
		try {
			file = new File(fullPath);			
			fos = new FileOutputStream(file);				
			byte [] buffer = new byte[1024000];				
			int len = inputStream.read(buffer);			 
			while (len != -1) {				
			    fos.write(buffer, 0, len);
			    len = inputStream.read(buffer);
			}
			result = Constants.COMMON.Attachment.UPLOADED;
		} catch(FileNotFoundException e) {
			log.error
				("Upload " 
				+ filename 
				+ " in to " 
				+ fileLocation
				+ folder
				+ " failed...");
			result = Constants.COMMON.Attachment.UPLOAD_FAILED;
			e.printStackTrace();
		} catch (IOException e) {
			log.error
				("Upload " 
				+ filename 
				+ " in to " 
				+ fileLocation 
				+ folder
				+ " failed...");
			result = Constants.COMMON.Attachment.UPLOAD_FAILED;
			e.printStackTrace();
		}
		
		finally {
			if(fos != null){
				try {
					fos.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
        return result;
    }
	
	public String[] parseExtensionFile(String name){
		String temp[] = {"",""};
		int size = name.length();
		temp[0] = name.substring(0, size-4);
		temp[1] = name.substring(name.lastIndexOf(".") + 1, size);		
		return temp;
	}
	
}