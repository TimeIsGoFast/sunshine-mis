/**
 * 
 */
package net.zjwu.mis.system.security.realm;

import java.util.List;

import net.zjwu.mis.system.dao.ResourceMapper;
import net.zjwu.mis.system.dao.RoleMapper;
import net.zjwu.mis.system.dao.UserMapper;
import net.zjwu.mis.system.model.Resource;
import net.zjwu.mis.system.model.Role;
import net.zjwu.mis.system.model.User;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;

/**
 * @author Lay
 *
 */
public class SimpleRealm extends AuthorizingRealm {

	private UserMapper userMapper;

	private RoleMapper roleMapper;

	private ResourceMapper resourceMapper;

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * org.apache.shiro.realm.AuthorizingRealm#doGetAuthorizationInfo(org.apache
	 * .shiro.subject.PrincipalCollection)
	 */
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(
			PrincipalCollection principals) {
		String uid = (String) principals.getPrimaryPrincipal();
		SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
		List<Role> roles = roleMapper.getRolesByUid(uid);
		for (Role role : roles) {
			// 基于Role的权限信息
			info.addRole(role.getRoid());
			// 基于Permission的权限信息
			List<Resource> resources = resourceMapper.getResourcesByRoleId(role
					.getId());
			for (Resource resource : resources) {
				if(resource.getValue()!=null&&!resource.getValue().equals(""))
				info.addStringPermission(resource.getValue());
			}
		}
		return info;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * org.apache.shiro.realm.AuthenticatingRealm#doGetAuthenticationInfo(org
	 * .apache.shiro.authc.AuthenticationToken)
	 */
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(
			AuthenticationToken token) throws AuthenticationException {
		String uid = (String) token.getPrincipal();
		User user = userMapper.getUserByUid(uid);
		if (user == null) {
			throw new UnknownAccountException();
		}
		if (Boolean.FALSE.equals(user.getEnabled())) {
			throw new LockedAccountException();
		}
		SimpleAuthenticationInfo authenticationInfo = new SimpleAuthenticationInfo(
				user.getUid(), user.getPassword(), getName());
		return authenticationInfo;
	}

	/**
	 * @param userMapper the userMapper to set
	 */
	public void setUserMapper(UserMapper userMapper) {
		this.userMapper = userMapper;
	}

	/**
	 * @param roleMapper the roleMapper to set
	 */
	public void setRoleMapper(RoleMapper roleMapper) {
		this.roleMapper = roleMapper;
	}

	/**
	 * @param resourceMapper the resourceMapper to set
	 */
	public void setResourceMapper(ResourceMapper resourceMapper) {
		this.resourceMapper = resourceMapper;
	}

}
