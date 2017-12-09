package net.zjwu.mis.system.dao;

import net.zjwu.mis.system.model.RoleResource;
import tk.mybatis.mapper.common.Mapper;

public interface RoleResourceMapper extends Mapper<RoleResource> {
	
	void deleteRoleResourcesByRoleId(int roleId);
	
}