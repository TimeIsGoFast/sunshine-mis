package net.zjwu.mis.system.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import net.zjwu.mis.system.model.User;
import tk.mybatis.mapper.common.Mapper;

public interface UserMapper extends Mapper<User> {
	User getUserByUid(String uid);

	User getUserWithRolesByUid(String uid);
	
	List<User> getUsersByRoleId(int roleId);

	
	int updateUserName(@Param(value="uid")String uid, @Param(value="nickname")String nickname);

	
}