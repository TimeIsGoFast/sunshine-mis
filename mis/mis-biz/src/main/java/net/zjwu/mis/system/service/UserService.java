/**
 * 
 */
package net.zjwu.mis.system.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.github.pagehelper.PageInfo;

import net.zjwu.mis.base.service.BaseService;
import net.zjwu.mis.system.model.User;

/**
 * @author Lay
 *
 */
public interface UserService extends BaseService<User>{
	
	List<User> listUsers();
	
	PageInfo<User> listUsersPaged(int page,int pageSize,User user);
	
	List<User> getUsersByRoleId(int roleId);
	
	User getUserByUid(String uid);

	void insertIntoInfo(User user);

	
}
