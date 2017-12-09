/**
 * 
 */
package net.zjwu.mis.system.service;

import java.util.List;

import net.zjwu.mis.base.service.BaseService;
import net.zjwu.mis.system.model.Resource;

/**
 * @author Lay
 *
 */
public interface ResourceService extends BaseService<Resource>{

	List<Resource> listResources();

	List<Resource> getResourcesByPidAndType(Resource resource);
	
	List<Resource> getResourcesByRoleId(Integer roleId);
}
