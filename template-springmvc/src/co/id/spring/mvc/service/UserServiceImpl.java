package co.id.spring.mvc.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import co.id.spring.mvc.dao.MSecGroupDao;
import co.id.spring.mvc.dao.MSecGroupRightDao;
import co.id.spring.mvc.dao.MSecRoleDao;
import co.id.spring.mvc.dao.MSecRoleGroupDao;
import co.id.spring.mvc.dao.MSecUserDao;
import co.id.spring.mvc.domain.MSecGroup;
import co.id.spring.mvc.domain.MSecGroupRight;
import co.id.spring.mvc.domain.MSecRight;
import co.id.spring.mvc.domain.MSecRole;
import co.id.spring.mvc.domain.MSecRoleGroup;
import co.id.spring.mvc.domain.MSecUser;
import co.id.spring.mvc.domain.MSecUserRole;

@Service("userService")
@Transactional(readOnly=true)
public class UserServiceImpl implements UserService {
	
	@Autowired private MSecGroupRightDao mSecGroupRightDao;
	@Autowired private MSecRoleDao mSecRoleDao;
	@Autowired private MSecRoleGroupDao mSecRoleGroupDao;
	@Autowired private MSecUserDao mSecUserDao;
	@Autowired private MSecGroupDao mSecGroupDao;

	@Override
	public MSecUser getUser() {
		return null;
	}

	@Override
	public Long getCountAllUser() {
		return mSecUserDao.count();
	}

	@Override
	public List<MSecUser> getAllUsers() {
		return mSecUserDao.getAll();
	}

	@Override
	public MSecUser getUserByID(Long id) {
		return mSecUserDao.getById(id);
	}

	@Override
	public List<MSecUser> getUserByUsernameAndPassword(String username,
			String password) {
		return mSecUserDao.getUserByUsernameAndPassword(username, password);
	}

	@Override
	@Transactional(readOnly=false)
	public void save(MSecUser mSecUser) {
		mSecUserDao.save(mSecUser);
	}

	@Override
	public void delete(MSecUser mSecUser) {
		mSecUserDao.delete(mSecUser);
	}

	@Override
	public List<MSecRole> getRolesByUserID(Long id) {	
		return mSecRoleDao.getRolesById(id);
	}

	@Override
	public List<MSecRole> getRolesByUserID(List<MSecUserRole> list) {	
		return mSecRoleDao.getRolesById(list);
	}
	
	@Override
	public List<MSecRole> getAllRoles() {
		return mSecRoleDao.getAll();
	}

	@Override
	public List<MSecRight> getRightsByUser(MSecUser mSecUser) {
		return null;
	}

	@Override
	public List<MSecGroup> getGroupsById(List<Long> list) {
		return null;
	}

	@Override
	public List<MSecRoleGroup> getRoleGroupById(List<Long> list) {
		return mSecRoleGroupDao.getRoleGroupById(list);
	}

	@Override
	public List<MSecGroupRight> getGroupRight(List<Long> list) {
		return mSecGroupRightDao.getGroupRight(list);
	}

	@Override
	public List<MSecRole> getRoleWithPagination(int offset, int limit) {
		return mSecRoleDao.getRoleWithPagination(offset, limit);
	}

	@Override
	public Long countRole() {
		return mSecRoleDao.count();
	}

	@Override
	public List<MSecGroup> getGroupWithPagination(int offset, int limit) {
		return mSecGroupDao.getGroupWithPagination(offset, limit);
	}

	@Override
	public Long countGroup() {
		return mSecGroupDao.count();
	}

	@Override
	public List<MSecUser> getUserWithPagination(int offset, int limit, HttpServletRequest request) {
		return mSecUserDao.getUserWithPagination(offset, limit, request);
	}

	@Override
	public Long countUser() {
		return mSecUserDao.count();
	}

	@Override
	@Transactional(readOnly=false)
	public void saveRole(MSecRole secRole) {
		mSecRoleDao.save(secRole);
	}

	@Override
	@Transactional(readOnly=false)
	public void saveGroup(MSecGroup secGroup) {
		mSecGroupDao.saveOrUpdate(secGroup);
	}

	@Override
	public MSecGroup getGroupById(Long id) {
		return mSecGroupDao.getById(id);
	}

	@Override
	public List<MSecGroup> getAllGroups() {
		return mSecGroupDao.getAll();
	}

}
