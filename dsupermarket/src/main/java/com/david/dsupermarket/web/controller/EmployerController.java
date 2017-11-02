package com.david.dsupermarket.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.javassist.expr.NewArray;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.david.dsupermarket.constants.Constants;
import com.david.dsupermarket.model.Employer;
import com.david.dsupermarket.model.PageBean;
import com.david.dsupermarket.model.PageModel;
import com.david.dsupermarket.service.EmployerService;
import com.david.dsupermarket.utils.LogUtils;
import com.david.dsupermarket.utils.PageUtils;
import com.david.dsupermarket.utils.UtilFuns;

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
	 * 分页查询所有员工
	 * pageCode:当前页
	 * pageSize:每页显示的总条数
	 */
	@RequestMapping("/findByPage")
	public String findByPage(@RequestParam(value = "pageCode", required = false) String pageCode,
			@RequestParam(value = "pageSize", required = false) String pageSize,Model model) {
		LogUtils.E("pageCode"+pageCode+"pageSize="+pageSize);
		/**
		 * 设置分页的数据
		 */
		if (UtilFuns.isEmpty(pageCode) || UtilFuns.isEmpty(pageCode.trim())) {
			pageCode = "1";
		}
		if (UtilFuns.isEmpty(pageSize) || UtilFuns.isEmpty(pageSize.trim())) {
			pageSize = Constants.PAGE_SIZE + "";
		}
		PageModel pageModel = new PageModel(Integer.parseInt(pageCode), Integer.parseInt(pageSize));
		Map<String, Object> map = new HashMap<String, Object>();
		LogUtils.E("pageModel.getStart()"+pageModel.getStart());
		map.put("start", pageModel.getStart());// 开始第几页，
		map.put("size", pageModel.getPageSize());// 每页展示数量
		// 分页查询数据
		List<Employer> employerLists = emploerService.findfindByPage(map);
		//设置返回的数据
		PageBean<Employer> pageBean = new PageBean<>();
		//查询出总记录数
		Integer totalCountSize = emploerService.count();
		//设置查询的数据
		pageBean.setBeanList(employerLists);
		//设置当前页
		pageBean.setPageCode(pageModel.getPage());
		//设置每页的记录数
		pageBean.setPageSize(pageModel.getPageSize());
		//设置总记录数
		pageBean.setTotalCount(totalCountSize);
		model.addAttribute("pageBean",pageBean);
		System.out.println(pageBean);
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
