/**
 * 
 */
package net.zjwu.mis.system.service.impl;

import java.util.HashSet;

import net.zjwu.mis.base.service.impl.BaseServiceImpl;
import net.zjwu.mis.system.dao.UserRoleMapper;
import net.zjwu.mis.system.model.Role;
import net.zjwu.mis.system.model.User;
import net.zjwu.mis.system.model.UserRole;
import net.zjwu.mis.system.service.UserRoleService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author Lay
 *
 */
@Service
public class UserRoleServiceImpl extends BaseServiceImpl<UserRole> implements
		UserRoleService {
	
	@Autowired
	private UserRoleMapper userRoleMapper;

	/*
	 * (non-Javadoc)
	 * @see net.zjwu.mis.system.service.UserRoleService#saveUserRoles(net.zjwu.mis.system.model.User)
	 */
	@Override
	public void saveUserRoles(User user) {
		userRoleMapper.deleteUserRolesByUserId(user.getId());
		for(Role role:new HashSet<Role>(user.getRoles())){
			UserRole userRole = new UserRole();
			userRole.setUserId(user.getId());
			userRole.setRoleId(role.getId());
			userRoleMapper.insert(userRole);
		}
	}

	/*
	 * (non-Javadoc)
	 * @see net.zjwu.mis.system.service.UserRoleService#saveRoleUsers(net.zjwu.mis.system.model.Role)
	 */
	@Override
	public void saveRoleUsers(Role role) {
		userRoleMapper.deleteRoleUsersByRoleId(role.getId());
		for (User user : new HashSet<User>(role.getUsers())) {
			UserRole userRole = new UserRole();
			userRole.setUserId(user.getId());
			userRole.setRoleId(role.getId());
			userRoleMapper.insert(userRole);
		}
	}
}
