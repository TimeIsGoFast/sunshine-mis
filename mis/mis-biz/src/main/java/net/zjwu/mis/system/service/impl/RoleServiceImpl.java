/**
 * 
 */
package net.zjwu.mis.system.service.impl;

import java.util.List;

import net.zjwu.mis.base.service.ExampleBuilder;
import net.zjwu.mis.base.service.impl.BaseServiceImpl;
import net.zjwu.mis.system.dao.RoleMapper;
import net.zjwu.mis.system.dao.UserMapper;
import net.zjwu.mis.system.dao.UserRoleMapper;
import net.zjwu.mis.system.model.Role;
import net.zjwu.mis.system.service.RoleService;

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
public class RoleServiceImpl extends BaseServiceImpl<Role> implements
		RoleService {

	@Autowired
	private RoleMapper roleMapper;

	@Autowired
	private UserMapper userMapper;

	@Autowired
	private UserRoleMapper userRoleMapper;

	/*
	 * (non-Javadoc)
	 * 
	 * @see net.zjwu.mis.system.service.RoleService#listRoles()
	 */
	@Override
	public List<Role> listRoles(Role role) {
		ExampleBuilder example = new ExampleBuilder(role.getClass());
		example.andEqualTo(role);
		return roleMapper.selectByExample(example);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see net.zjwu.mis.system.service.RoleService#getRolesByUserId(int)
	 */
	@Override
	public List<Role> getRolesByUserId(int userId) {
		return roleMapper.getRolesByUserId(userId);
	}

	/* (non-Javadoc)
	 * @see net.zjwu.mis.system.service.RoleService#listRolesPaged(int, int, net.zjwu.mis.system.model.Role)
	 */
	@Override
	public PageInfo<Role> listRolesPaged(int page, int pageSize, Role role) {
		ExampleBuilder example = new ExampleBuilder(role.getClass());
		example.andEqualTo(role);
		PageHelper.startPage(page, pageSize);
		List<Role> roles = roleMapper.selectByExample(example);
		return new PageInfo<Role>(roles);
	}
}
