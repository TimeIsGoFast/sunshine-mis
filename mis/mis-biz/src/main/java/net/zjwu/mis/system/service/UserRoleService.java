/**
 * 
 */
package net.zjwu.mis.system.service;

import net.zjwu.mis.base.service.BaseService;
import net.zjwu.mis.system.model.Role;
import net.zjwu.mis.system.model.User;
import net.zjwu.mis.system.model.UserRole;

/**
 * @author Lay
 *
 */
public interface UserRoleService extends BaseService<UserRole>{
	
	void saveUserRoles(User uesr);
	
	void saveRoleUsers(Role role);

}
