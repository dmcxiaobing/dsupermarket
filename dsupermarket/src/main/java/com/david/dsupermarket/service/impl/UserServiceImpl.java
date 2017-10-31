package com.david.dsupermarket.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.david.dsupermarket.dao.UserDao;
import com.david.dsupermarket.model.User;
import com.david.dsupermarket.service.UserService;

/**
 * 用户的实现
 * 
 * @Author ：程序员小冰
 * @新浪微博 ：http://weibo.com/mcxiaobing
 * @GitHub: https://github.com/QQ986945193
 */
@Service(value="userService")
public class UserServiceImpl implements UserService {

	@Resource
	private UserDao userDao;
	/**
	 * 根据用户名查找用户
	 */
	@Override
	public User findUserByUsername(String username) {
		return userDao.findUserByUsername(username);
	}
	/**
	 * 添加用户
	 */
	@Override
	public void addUser(User user) {
		userDao.addUser(user);
	}
	/**
	 * 更新用户信息
	 */
	@Override
	public void updateUser(User user) {
		userDao.updateUser(user);
	}

}
