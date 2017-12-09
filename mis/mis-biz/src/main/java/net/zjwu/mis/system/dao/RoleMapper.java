package net.zjwu.mis.system.dao;

import java.util.List;

import net.zjwu.mis.system.model.Role;
import tk.mybatis.mapper.common.Mapper;

public interface RoleMapper extends Mapper<Role> {

	List<Role> getRolesByUserId(int userId);

	List<Role> getRolesByUid(String uid);
}