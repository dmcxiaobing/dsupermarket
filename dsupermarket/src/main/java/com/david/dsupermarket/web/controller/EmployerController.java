package com.david.dsupermarket.web.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.david.dsupermarket.model.Employer;
import com.david.dsupermarket.service.EmployerService;
import com.david.dsupermarket.utils.LogUtils;

/**
 * 员工信息的控制器
 * @Author ：程序员小冰
 * @新浪微博 ：http://weibo.com/mcxiaobing
 * @GitHub: https://github.com/QQ986945193
 */
@Controller
@RequestMapping("/employer")
public class EmployerController {

	@Resource(name="employerService")
	private EmployerService emploerService;
	
	/**
	 * 查询所有员工
	 */
	@RequestMapping("/list")
	public String list(Model model) {
		List<Employer> employerList = emploerService.findAll();
		model.addAttribute("employerList",employerList);
		return "employerlist";
	}
	
	
	/**
	 * 删除员工
	 */
	@RequestMapping("/deleteEmployer")
	public String deleteEmployer(Employer employer,Model model) {
		if (employer!=null && employer.getEid()!=null) {
			emploerService.deleteEmployer(employer.getEid());
		}
		return list(model);
	}
	/**
	 * 添加员工
	 */
	@RequestMapping("/addEmployer")
	public String addEmployer(Employer employer,Model model) {
		emploerService.addEmployer(employer);
		return list(model);
	}
	
	/**
	 * 去编辑页面的 action。查询出员工信息，toEditEmployer
	 */
	@RequestMapping("/toEditEmployer")
	public String toEditEmployer(Employer employer,Model model) {
		if (employer!=null && employer.getEid()!=null) {
			//根据员工id，查询出详情
			Employer dbEmployer = emploerService.findEmployerByEid(employer.getEid());
			model.addAttribute("emp",dbEmployer);
			return "update_employerdilog";
		}
		return "";
	}
	/**
	 * 更新出员工信息，根据eid
	 */
	@RequestMapping("/updateEmployer")
	public String updateEmployer(Employer employer,Model model) {
		if (employer!=null && employer.getEid()!=null) {
			//根据员工id，更新员工信息
			emploerService.updateEmployerByEid(employer);
		}
		return list(model);
	}
}
