package com.david.dsupermarket.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.david.dsupermarket.dao.EmployerDao;
import com.david.dsupermarket.model.Employer;
import com.david.dsupermarket.model.PageBean;
import com.david.dsupermarket.service.EmployerService;

/**
 * 员工信息的实现接口类
 * @Author ：程序员小冰
 * @新浪微博 ：http://weibo.com/mcxiaobing
 * @GitHub: https://github.com/QQ986945193
 */
@Service(value="employerService")
public class EmployerServiceImpl implements EmployerService{
	
	@Resource
	private EmployerDao employerDao;
	
	/*
	 * 查询所有的员工
	 */
	@Override
	public List<Employer> findAll() {
		return employerDao.list();
	}
	/**
	 * 添加员工
	 */
	@Override
	public void addEmployer(Employer employer) {
		employerDao.addEmployer(employer);
		
	}
	/**
	 * 删除员工
	 */
	@Override
	public void deleteEmployer(Integer eid) {
		employerDao.deleteEmployer(eid);
	}
	/**
	 * 根据员工id查找员工信息·
	 */
	@Override
	public Employer findEmployerByEid(Integer eid) {
		return employerDao.findEmployerByEid(eid);
	}
	/**
	 * 更新出员工信息，根据eid
	 */
	@Override
	public void updateEmployerByEid(Employer employer) {
		employerDao.updateEmployerByEid(employer);
	}
	/**
	 * 分页查询所有员工
	 * pageCode:当前页
	 * pageSize:每页显示的总条数
	 */
	@Override
	public List<Employer>  findfindByPage(Map<String,Object> map) {
		return employerDao.findByPage(map);
	}
	/**
	 * 查询出总记录数
	 */
	@Override
	public Integer count() {
		return employerDao.count();
	}

}
