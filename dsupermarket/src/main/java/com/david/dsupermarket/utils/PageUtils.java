package com.david.dsupermarket.utils;
/**
 * 分页的一个工具类
 * @Author ：程序员小冰
 * @新浪微博 ：http://weibo.com/mcxiaobing
 * @GitHub: https://github.com/QQ986945193
 */
public class PageUtils {
	
	/**
	 * 设置当前页。默认从第1页开始
	 * @param pageCode 当前页
	 */
	public static void setPageCode(Integer pageCode) {
		if(pageCode == null){
			pageCode = 1;
		}
		
	}
	
	/**
	 * 设置每页显示的数据的条数
	 * 默认每页显示10条记录
	 */
	public static void setPageSize(Integer pageSize) {
		if(pageSize == null){
			pageSize = 10;
		}
	}
}
