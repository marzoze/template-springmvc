/**
 * 
 */
package co.id.spring.mvc.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import co.id.spring.mvc.domain.MSecGroup;
import co.id.spring.mvc.domain.MSecGroupRight;
import co.id.spring.mvc.domain.MSecRight;
import co.id.spring.mvc.domain.MSecRole;
import co.id.spring.mvc.domain.MSecRoleGroup;
import co.id.spring.mvc.domain.MSecUser;
import co.id.spring.mvc.domain.MSecUserRole;

/**
 * @author FATCHX
 *
 */
public interface UserService {
	
	/**
	 * Get User object.<br>
	 * 
	 * @return MSecUser
	 */
	public MSecUser getUser();
	
	/**
	 * Get the count of all Users.<br>
	 * 
	 * @return Long
	 */
	public Long getCountAllUser();
	
	/**
	 * Get a list of all Users.<br>
	 * 
	 * @return List of Users
	 */
	public List<MSecUser> getAllUsers();
	
	/**
	 * Get an User by its ID.<br>
	 * 
	 * @param id / the persistence identifier
	 * @return MSecUser
	 */
	public MSecUser getUserByID(Long id);
	
	/**
	 * Get an User by its Name and password.<br>
	 * 
	 * @param userName
	 *            UserName
	 * @param passWord
	 *            password
	 * @return User
	 */
	public List<MSecUser> getUserByUsernameAndPassword(String username, String password);
	
	/**
	 * Saves new or updates an User.<br>
	 */
	void save(MSecUser mSecUser);
	
	/**
	 * 
	 * @param mSecUser
	 */
	void delete(MSecUser mSecUser);
	
	/**
	 * 
	 * @param userId
	 * @return
	 */
	public List<MSecRole> getRolesByUserID(Long userId);
	
	/**
	 * 
	 * @param list
	 * @return
	 */
	public List<MSecRole> getRolesByUserID(List<MSecUserRole> list);
	
	/**
	 * 
	 * @return
	 */
	public List<MSecRole> getAllRoles();
	
	/**
	 * 
	 * @param list
	 * @return
	 */
	public List<MSecGroup> getGroupsById(List<Long> list);
	
	/**
	 * 
	 * @param list
	 * @return
	 */
	public List<MSecRoleGroup> getRoleGroupById(List<Long> list);
	
	/**
	 * 
	 * @param mSecUser
	 * @return
	 */
	public List<MSecRight> getRightsByUser(MSecUser mSecUser);
	
	/**
	 * 
	 * @param list
	 * @return
	 */
	public List<MSecGroupRight> getGroupRight(List<Long> list);
	
	/**
	 * 
	 * @param offset
	 * @param limit
	 * @return
	 */
	List<MSecRole> getRoleWithPagination(int offset, int limit);
	
	/**
	 * 
	 * @param offset
	 * @param limit
	 * @return
	 */
	List<MSecGroup> getGroupWithPagination(int offset, int limit);
	
	/**
	 * 
	 * @param offset
	 * @param limit
	 * @param request
	 * @return
	 */
	List<MSecUser> getUserWithPagination(int offset, int limit, HttpServletRequest request);
	
	/*
	 * Count Role
	 */
	Long countRole();
	
	/*
	 * Count Group 
	 */
	Long countGroup();
	
	/**
	 * Count User
	 */
	Long countUser();
	
	/**
	 * 
	 * @param secRole
	 */
	void saveRole(MSecRole secRole);
	
	/**
	 * 
	 * @param secGroup
	 */
	void saveGroup(MSecGroup secGroup);
	
	MSecGroup getGroupById(Long id);
	
	public List<MSecGroup> getAllGroups();

}
