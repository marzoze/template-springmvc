package co.id.spring.mvc.service;

import java.io.Serializable;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import co.id.spring.mvc.dao.MUserDao;
import co.id.spring.mvc.domain.MUser;

@Service("mUserService")
@Transactional(readOnly=true)
public class MUserServiceImpl implements MUserService,Serializable {
	
	private static final long serialVersionUID = 112030945300048470L;
	
	@Autowired 
	private MUserDao mUserDao; 

	@Transactional(readOnly=false)
	public MUser save(MUser user) {
		return mUserDao.save(user);
	}

	@Transactional(readOnly=false)
	public void delete(MUser user) {
		mUserDao.delete(user);
	}

	public MUser getUser(Long id) {
		return mUserDao.getById(id);
	}

	public List<MUser> getUsers() {
		return mUserDao.getAll();
	}

	@Override
	public List<MUser> getUserByUsernameAndPassword(String username, String password) {
		return mUserDao.getUserByUsernameAndPassword(username, password);
	}

	@Override
	public List<MUser> getUserWithPagination(int offset, int limit) {		
		return mUserDao.getUserWithPagination(offset, limit);
	}

	@Override
	public Long count() {
		return mUserDao.count();
	}

	@Override
	public List<String> listUserAutoComplete() {
		return mUserDao.listUserAutoComplete();
	}
			
}
