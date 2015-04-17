package com.wanggang.enity;

import java.util.HashSet;
import java.util.Set;

/**
 * 
 * 用户类
 *
 */

public class Users {
	private int userid;           //用户id
	private String username;      //用户名
	private String userpassword;  //用户密码
	private String zsname;          //真实姓名
	private int sex;              //性别
	private String safemail;        //安全邮箱
	private String temporaryemail; //临时邮箱
	private int condition1;        //邮箱激活状态
	private String permission;     //权限
	private String signature;      //签名档
	
	private Position position;     //将职位作为属性创建
	private Set relational =new HashSet();
	
	
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getUserpassword() {
		return userpassword;
	}
	public void setUserpassword(String userpassword) {
		this.userpassword = userpassword;
	}
	public String getZsname() {
		return zsname;
	}
	public void setZsname(String zsname) {
		this.zsname = zsname;
	}
	public int getSex() {
		return sex;
	}
	public void setSex(int sex) {
		this.sex = sex;
	}
	public String getSafemail() {
		return safemail;
	}
	public void setSafemail(String safemail) {
		this.safemail = safemail;
	}
	public String getTemporaryemail() {
		return temporaryemail;
	}
	public void setTemporaryemail(String temporaryemail) {
		this.temporaryemail = temporaryemail;
	}
	public int getCondition1() {
		return condition1;
	}
	public void setCondition1(int condition1) {
		this.condition1 = condition1;
	}
	public String getPermission() {
		return permission;
	}
	public void setPermission(String permission) {
		this.permission = permission;
	}
	public String getSignature() {
		return signature;
	}
	public void setSignature(String signature) {
		this.signature = signature;
	}
	public Position getPosition() {
		return position;
	}
	public void setPosition(Position position) {
		this.position = position;
	}
	public Set getRelational() {
		return relational;
	}
	public void setRelational(Set relational) {
		this.relational = relational;
	}
	
	
	
	
	
	
	
	
	
	
	
	

	

}
