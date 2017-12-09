/**
 * 
 */
package net.zjwu.mis.system.service.impl;

import java.util.List;

import net.zjwu.mis.base.service.ExampleBuilder;
import net.zjwu.mis.base.service.impl.BaseServiceImpl;
import net.zjwu.mis.business.dao.PerfectInfoMapper;
import net.zjwu.mis.system.dao.UserMapper;
import net.zjwu.mis.system.model.User;
import net.zjwu.mis.system.service.UserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

/**
 * @author Lay
 *
 */
@Service
@Transactional
public class UserServiceImpl extends BaseServiceImpl<User> implements UserService {
	
	@Autowired
	private UserMapper userMapper;
    
	@Autowired
	private PerfectInfoMapper perfectInfoMapper;
	
	/* (non-Javadoc)
	 * @see net.zjwu.mis.system.service.UserService#listUsers()
	 */
	@Override
	public List<User> listUsers() {
		return userMapper.selectAll();
	}

	/* (non-Javadoc)
	 * @see net.zjwu.mis.system.service.UserService#getUsersByRoleId(int)
	 */
	@Override
	public List<User> getUsersByRoleId(int roleId) {
		return userMapper.getUsersByRoleId(roleId);
	}


	/* (non-Javadoc)
	 * @see net.zjwu.mis.system.service.UserService#getUserByUid(java.lang.String)
	 */
	@Override
	public User getUserByUid(String uid) {
		return userMapper.getUserByUid(uid);
	}


	/* (non-Javadoc)
	 * @see net.zjwu.mis.system.service.UserService#listUsersPaged()
	 */
	@Override
	public PageInfo<User> listUsersPaged(int page,int pageSize,User user) {
		ExampleBuilder example = new ExampleBuilder(user.getClass());
		example.andEqualTo(user);
		PageHelper.startPage(page, pageSize);
		List<User> users = userMapper.selectByExample(example);
		return new PageInfo<User>(users);
	}

	@Override
	public void insertIntoInfo(User user) {
		// TODO Auto-generated method stub
		perfectInfoMapper.insertIntoInfo(user);
	}


	
	
}
