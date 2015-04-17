package com.wanggang.dao;

import java.util.List;

import com.wanggang.enity.Users;

public interface UsersDao {
	
	public Users login(String uid,String password);//用户登录
	public int add(Users u);//增加账户
	public int update(Users u);	//更新账户
	public List<Users> selectdo();//查询全部账户
	public Users selectname(String uid);//验证帐号是否存在
}
