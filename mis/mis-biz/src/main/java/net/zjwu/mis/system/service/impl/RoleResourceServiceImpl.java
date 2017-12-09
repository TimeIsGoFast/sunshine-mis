/**
 * 
 */
package net.zjwu.mis.system.service.impl;

import java.util.HashSet;

import net.zjwu.mis.base.service.impl.BaseServiceImpl;
import net.zjwu.mis.system.dao.RoleResourceMapper;
import net.zjwu.mis.system.model.Resource;
import net.zjwu.mis.system.model.Role;
import net.zjwu.mis.system.model.RoleResource;
import net.zjwu.mis.system.service.RoleResourceService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author Lay
 *
 */
@Service
public class RoleResourceServiceImpl extends BaseServiceImpl<RoleResource>
		implements RoleResourceService {

	@Autowired
	private RoleResourceMapper roleResourceMapper;

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * net.zjwu.mis.system.service.RoleResourceService#saveRoleResources(net
	 * .zjwu.mis.system.model.Role)
	 */
	@Override
	public void saveRoleResources(Role role) {
		roleResourceMapper.deleteRoleResourcesByRoleId(role.getId());
		for (Resource resource : new HashSet<Resource>(role.getResources())) {
			RoleResource roleResource = new RoleResource();
			roleResource.setRoleId(role.getId());
			roleResource.setResourceId(resource.getId());
			roleResourceMapper.insert(roleResource);
		}
	}

}
