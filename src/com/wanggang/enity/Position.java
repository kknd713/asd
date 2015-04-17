package com.wanggang.enity;

import java.util.HashSet;
import java.util.Set;

/**
 * 
 * 职位
 * 
 **/
public class Position {
	private int positionid;         //职位id
	private String positionname;    //职位名称
	private Department department;
	private Set users =new HashSet();
	
	
	public int getPositionid() {
		return positionid;
	}
	public void setPositionid(int positionid) {
		this.positionid = positionid;
	}
	public String getPositionname() {
		return positionname;
	}
	public void setPositionname(String positionname) {
		this.positionname = positionname;
	}
	public Department getDepartment() {
		return department;
	}
	public void setDepartment(Department department) {
		this.department = department;
	}
	public Set getUsers() {
		return users;
	}
	public void setUsers(Set users) {
		this.users = users;
	}
	
	
		
	
	

    
		

}
