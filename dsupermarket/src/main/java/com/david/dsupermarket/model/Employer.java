package com.david.dsupermarket.model;
/**
 * 员工信息
 * @Author ：程序员小冰
 * @新浪微博 ：http://weibo.com/mcxiaobing
 * @GitHub: https://github.com/QQ986945193
 */
public class Employer {
	//员工编号
	private Integer eid;
	//员工姓名
	private String ename;
	//员工地址
	private String address;
	//员工电话
	private String telephone;
	//员工月薪
	private Double monthpay;
	@Override
	public String toString() {
		return "Employer [eid=" + eid + ", ename=" + ename + ", address=" + address + ", telephone=" + telephone
				+ ", monthpay=" + monthpay + "]";
	}
	public Integer getEid() {
		return eid;
	}
	public void setEid(Integer eid) {
		this.eid = eid;
	}
	public String getEname() {
		return ename;
	}
	public void setEname(String ename) {
		this.ename = ename;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public Double getMonthpay() {
		return monthpay;
	}
	public void setMonthpay(Double monthpay) {
		this.monthpay = monthpay;
	}
	public Employer(Integer eid, String ename, String address, String telephone, Double monthpay) {
		super();
		this.eid = eid;
		this.ename = ename;
		this.address = address;
		this.telephone = telephone;
		this.monthpay = monthpay;
	}
	public Employer() {
		super();
	}

	
	

}
