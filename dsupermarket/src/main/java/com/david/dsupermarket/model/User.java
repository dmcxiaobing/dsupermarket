package com.david.dsupermarket.model;

import java.util.Date;

/**
 * 用户管理员的model
 * 
 * @Author ：程序员小冰
 * @新浪微博 ：http://weibo.com/mcxiaobing
 * @GitHub: https://github.com/QQ986945193
 */
public class User {
	// 用户的uid
	private Integer uid;
	// 用户名
	private String username;
	// 加密后的用户密码
	private String password;
	// 创建用户的时间
	private Date createDate;
	// 用户的状态，1,表示可用。0表示不可用
	private Integer state;
	//判断是否是管理员，1是管理员，0是普通用户
	private Integer role;
	
	public Integer getUid() {
		return uid;
	}

	public void setUid(Integer uid) {
		this.uid = uid;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Integer getState() {
		return state;
	}

	public void setState(Integer state) {
		this.state = state;
	}

	@Override
	public String toString() {
		return "User [uid=" + uid + ", username=" + username + ", password=" + password + ", createDate=" + createDate
				+ ", state=" + state + ", role=" + role + "]";
	}

	public Integer getRole() {
		return role;
	}

	public void setRole(Integer role) {
		this.role = role;
	}

	
	
	
}
