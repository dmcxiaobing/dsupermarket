package com.david.dsupermarket.dao;

import java.util.List;
import java.util.Map;

import com.david.dsupermarket.model.Employer;
import com.david.dsupermarket.model.PageBean;

/**
 * 员工的dao
 * 
 * @Author ：程序员小冰
 * @新浪微博 ：http://weibo.com/mcxiaobing
 * @GitHub: https://github.com/QQ986945193
 */
public interface EmployerDao {
	/*
	 * 查询所有的员工
	 */
	List<Employer> list();

	/**
	 * 添加员工
	 */
	void addEmployer(Employer employer);

	/**
	 * 删除员工
	 * 
	 * @param eid
	 *            员工id
	 * 
	 */
	void deleteEmployer(Integer eid);

	/**
	 * 根据员工id查找员工信息
	 */
	Employer findEmployerByEid(Integer eid);

	/**
	 * 更新出员工信息，根据eid
	 */
	void updateEmployerByEid(Employer employer);

	/**
	 * 分页查询所有员工 pageCode:当前页 pageSize:每页显示的总条数
	 */
	List<Employer>  findByPage(Map<String,Object> map);
	/**
	 * 
	 * 查询出总记录数
	 */
	Integer count();

}
