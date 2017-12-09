/**
 * 
 */
package net.zjwu.mis.system.service;

import net.zjwu.mis.base.service.BaseService;
import net.zjwu.mis.system.model.Role;
import net.zjwu.mis.system.model.RoleResource;

/**
 * @author Lay
 *
 */
public interface RoleResourceService extends BaseService<RoleResource>{

	void saveRoleResources(Role role);
}
