package net.zjwu.mis.system.dao;

import java.util.List;

import net.zjwu.mis.system.model.Resource;
import tk.mybatis.mapper.common.Mapper;

public interface ResourceMapper extends Mapper<Resource> {
	
	List<Resource> getResourcesByPidAndType(Resource resource);
	
	List<Resource> getResourcesByRoleId(int roleId);
}