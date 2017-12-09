package net.zjwu.mis.system.dao;

import net.zjwu.mis.system.model.UserRole;
import tk.mybatis.mapper.common.Mapper;

public interface UserRoleMapper extends Mapper<UserRole> {
	
	void deleteUserRolesByUserId(int userId);
	
	void deleteRoleUsersByRoleId(int roleId);

}