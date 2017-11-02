package com.david.dsupermarket.model;

import java.io.Serializable;
/**
 * 出勤的实体类
 * @Author ：程序员小冰
 * @新浪微博 ：http://weibo.com/mcxiaobing
 * @GitHub: https://github.com/QQ986945193
 */
public class Workday implements Serializable{

	//是否出勤的id
	private Integer wid;
	
	private Employer employer;
	//出勤的天数
	private String workday;
	
	private Double addwork;
}
