package com.david.dsupermarket.dao;

import com.david.dsupermarket.model.User;

/**
 * 用户的Dao
 * @Author ：程序员小冰
 * @新浪微博 ：http://weibo.com/mcxiaobing
 * @GitHub: https://github.com/QQ986945193
 */
public interface UserDao {
	/**
	 * 根据用户名查找用户
	 * @param username  用户名
	 * @return 返回一个用户
	 */
	public User findUserByUsername(String username);
	/**
	 * 添加用户
	 * @param user 要添加的用户实体
	 */
	public void addUser(User user);

}
