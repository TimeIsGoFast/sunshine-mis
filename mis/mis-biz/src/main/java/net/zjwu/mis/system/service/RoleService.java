/**
 * 
 */
package net.zjwu.mis.system.service;

import java.util.List;

import net.zjwu.mis.base.service.BaseService;
import net.zjwu.mis.system.model.Role;

import com.github.pagehelper.PageInfo;

/**
 * @author Lay
 *
 */
public interface RoleService extends BaseService<Role>{
	
	List<Role> listRoles(Role role);
	
	PageInfo<Role> listRolesPaged(int page,int pageSize,Role role);
	
	List<Role> getRolesByUserId(int userId);
	
}
