package com.david.dsupermarket.web.controller;

import javax.annotation.Resource;
import javax.security.auth.Subject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.david.dsupermarket.constants.Constants;
import com.david.dsupermarket.model.User;
import com.david.dsupermarket.service.UserService;
import com.david.dsupermarket.utils.CryptographyUtils;
import com.david.dsupermarket.utils.LogUtils;
import com.david.dsupermarket.utils.ResponseUtils;

/**
 * 用户的controller
 * 
 * @Author ：程序员小冰
 * @新浪微博 ：http://weibo.com/mcxiaobing
 * @GitHub: https://github.com/QQ986945193
 */
@RequestMapping("/user")
@Controller
public class UserController {

	@Resource(name = "userService")
	private UserService userService;

	/**
	 * 首页
	 */
	@RequestMapping("/index")
	public String index() {
		return "index";
	}

	/**
	 * 用户登陆的action
	 */
	@RequestMapping("/login")
	public String login(User user, HttpServletRequest request) {
		// System.err.println(user + CryptographyUtils.md5(user.getPassword(),
		// user.getUsername()));
		org.apache.shiro.subject.Subject subject = SecurityUtils.getSubject();
		UsernamePasswordToken token = new UsernamePasswordToken(user.getUsername(),
				CryptographyUtils.md5(user.getPassword(), user.getUsername()));
		try {
			subject.login(token);
			return "index";// 登陆成功
		} catch (Exception e) {
			// 登录失败
			LogUtils.e(e.getMessage());
			request.setAttribute("user", user);
			request.setAttribute("errorInfo", "用户名或者密码错误!!");
			return "login";
		}

	}

	/**
	 * 用户退出的action
	 */
	@RequestMapping("/logout")
	public String logout() {
		// 退出shiro，清除session
		SecurityUtils.getSubject().logout();
		return Constants.REDIRECT_LOGIN_JSP_PATH;
	}

	/**
	 * 检测用户名是否可用
	 */
	@RequestMapping("/checkUsernameIsExists")
	public String checkUsernameIsExists(String username, HttpServletResponse response) throws Exception {
		// 根据用户名查找用户
		User dbUser = userService.findUserByUsername(username);
		if (dbUser == null) {
			// 则说明用户名不存在，可以使用
			ResponseUtils.write(response, "用户名可用，请输入密码");
			return null;
		} else {
			// 则说明用户名已经存在，不可用使用
			ResponseUtils.write(response, "用户名已经存在了。请更换！");
			return null;
		}
	}

	/**
	 * 添加用户.由于前面已经有过非空判断的代码，所以，就不再重复写了。
	 */
	@RequestMapping("/addUser")
	public String addUser(User user) {
		userService.addUser(user);
		return "employerlist";
	}

}
