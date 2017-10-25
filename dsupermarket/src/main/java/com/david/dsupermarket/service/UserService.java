package com.david.dsupermarket.service;

import com.david.dsupermarket.model.User;

/**
 * 用户的操作
 * @Author ：程序员小冰
 * @新浪微博 ：http://weibo.com/mcxiaobing
 * @GitHub: https://github.com/QQ986945193
 */
public interface UserService {

	public User findUserByUsername(String username);

	public void addUser(User user);

}
