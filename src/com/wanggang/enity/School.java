package com.wanggang.enity;

import java.util.HashSet;
import java.util.Set;
/**
 * 
 * 校区类
 *
 */

public class School {
	private int schoolid;   //校区ID
	private String schoolname; //校区名称
	private Set department=new HashSet();
	
	public School(){		
	}
	public School(int schoolid,String schoolname){
		this.schoolid=schoolid;
		this.schoolname=schoolname;
	}
	
	
	
	public int getSchoolid() {
		return schoolid;
	}
	public void setSchoolid(int schoolid) {
		this.schoolid = schoolid;
	}
	public String getSchoolname() {
		return schoolname;
	}
	public void setSchoolname(String schoolname) {
		this.schoolname = schoolname;
	}
	public Set getDepartment() {
		return department;
	}
	public void setDepartment(Set department) {
		this.department = department;
	}
	
	
	
	
	
	
}