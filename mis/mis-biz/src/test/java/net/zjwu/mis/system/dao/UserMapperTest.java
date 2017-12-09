/**
 * 
 */
package net.zjwu.mis.system.dao;

import net.zjwu.mis.BaseTest;
import net.zjwu.mis.system.model.User;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @author Lay
 *
 */
public class UserMapperTest extends BaseTest{

	@Autowired
	private UserMapper userMapper;
	
	@Test
	public void testGetUserWithRolesByUid(){
		User user = userMapper.getUserWithRolesByUid("test");
		System.out.println(user.getRoles().size());
	}
}
