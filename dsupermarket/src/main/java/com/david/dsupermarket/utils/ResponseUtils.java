package com.david.dsupermarket.utils;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

/**
 * Response响应工具类
 * 
 * @Author ：程序员小冰
 * @新浪微博 ：http://weibo.com/mcxiaobing
 * @GitHub: https://github.com/QQ986945193
 */
public class ResponseUtils {
	/**
	 * 输出
	 */
	public static void write(HttpServletResponse response, Object o) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(o.toString());
		out.flush();
		if (out != null) {
			out.close();
		}
	}
}
