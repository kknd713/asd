package com.wanggang.enity;

import java.util.HashSet;
import java.util.Set;


/**
 * 部门类
 * 
 **/
public class Department {
	private int departmentid;               //部门ID
	private String departmentname;  
	//部门名称
	private Set position=new HashSet();
	private School school;
	
	
	
	
	public int getDepartmentid() {
		return departmentid;
	}
	public void setDepartmentid(int departmentid) {
		this.departmentid = departmentid;
	}
	public String getDepartmentname() {
		return departmentname;
	}
	public void setDepartmentname(String departmentname) {
		this.departmentname = departmentname;
	}
	public Set getPosition() {
		return position;
	}
	public void setPosition(Set position) {
		this.position = position;
	}
	public School getSchool() {
		return school;
	}
	public void setSchool(School school) {
		this.school = school;
	}
	

	
	
	
	
	
}