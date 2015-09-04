package co.id.spring.mvc.service;

import java.util.List;

import co.id.spring.postracking.domain.MUser;

public interface MUserService {
	
	public MUser save(MUser user);
	public void delete(MUser user);
	public MUser getUser(Long id);
	public List<MUser> getUsers();
	public List<MUser> getUserByUsernameAndPassword(String username, String password);
	public List<MUser> getUserWithPagination(int offset, int limit);
	Long count();
	List<String> listUserAutoComplete();

}