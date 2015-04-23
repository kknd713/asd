package com.wanggang.dao;

import java.util.List;

import com.wanggang.enity.Users;

public interface UsersDao {
	
	public Users reglogin(String uid,String password);//用户登录
	public int add(Users u);//增加账户
	public int update(Users u,Users user);	//更新账户
	public List<Users> selectdo();//查询全部账户
	public Users selectname(String uid);//验证帐号是否存在
	public int deleteFrind(String username,Users users);//删除联系人
	public int addUser(String username,Users users);//添加常用联系人
	public int downloadFile(String filepath,String file);
}
