package co.id.spring.mvc.converter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;

import co.id.spring.mvc.domain.MPosDocument;
import co.id.spring.mvc.service.MPosDocumentService;

public class IdToDocumentConverter implements Converter<Long, MPosDocument> {
	
	@Autowired private MPosDocumentService mPosDocumentService;

	@Override
	public MPosDocument convert(Long id) {
		return mPosDocumentService.getDocumentById(id);
	}

}