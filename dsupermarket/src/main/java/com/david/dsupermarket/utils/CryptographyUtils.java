package com.david.dsupermarket.utils;

import org.apache.shiro.crypto.hash.Md5Hash;

/**
 * 加密工具类
 * @Author ：程序员小冰
 * @新浪微博 ：http://weibo.com/mcxiaobing
 * @GitHub: https://github.com/QQ986945193
 */
public class CryptographyUtils {
	
	/**
	 * Md5加密  password密码，salt盐
	 */
	public static String md5(String password,String salt){
		//默认两次
		return new Md5Hash(password,salt,2).toString();
	}
	
	public static void main(String[] args) {
		String password="123456";
		//928bfd2577490322a6e19b793691467e
//		System.out.println("Md5加密："+CryptographyUtils.md5(password, "自己的用户名"));
		System.out.println("Md5加密："+CryptographyUtils.md5(password, "admin"));
	}
}
