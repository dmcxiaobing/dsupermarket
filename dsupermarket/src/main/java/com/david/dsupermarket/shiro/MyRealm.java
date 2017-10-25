package com.david.dsupermarket.shiro;

import javax.annotation.Resource;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;

import com.david.dsupermarket.constants.Constants;
import com.david.dsupermarket.model.User;
import com.david.dsupermarket.service.UserService;
import com.david.dsupermarket.utils.LogUtils;
/**
 * shiro 自定义的realm
 * @Author ：程序员小冰
 * @新浪微博 ：http://weibo.com/mcxiaobing
 * @GitHub: https://github.com/QQ986945193
 */
public class MyRealm extends AuthorizingRealm{

	@Resource(name="userService")
	private UserService userService;
	/**
	 * 为当前登陆的用户授予角色和权限 授权，当jsp页面出现shiro标签时，就会执行授权方法
	 */
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		// TODO Auto-generated method stub
		return null;
	}
	/**
	 * 验证当前登陆的用户
	 */
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
		// 向下转型
		String username = (String) token.getPrincipal();
		User dbUser = userService.findUserByUsername(username);
		if (dbUser!=null) {
			// 证明用户名正确，数据库存在用户信息。
			SecurityUtils.getSubject().getSession().setAttribute(Constants.SESSION_CURRENT_USER_INFO, dbUser);
			AuthenticationInfo info = new SimpleAuthenticationInfo(dbUser.getUsername(),
					dbUser.getPassword(),dbUser.getUsername());
			LogUtils.E(dbUser.getUsername()+"==="+dbUser.getPassword());
			return info;
		}
		
		return null;
	}

}
