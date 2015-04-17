package com.wanggang.web.action;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.wanggang.dao.UsersDao;
import com.wanggang.enity.Users;


public class UsersAction extends ActionSupport {
	private List<Users> list;
	private UsersDao usersDao;
	private Users users;
	private Users u = null;
	private Map<String,Object> request = null;
	private Map<String,Object> session = null;
	
	
	public List getList() {
		return list;
	}
	public void setList(List list) {
		this.list = list;
	}
	public UsersDao getUsersDao() {
		return usersDao;
	}
	public void setUsersDao(UsersDao usersDao) {
		this.usersDao = usersDao;
	}

	public Users getUsers() {
		return users;
	}
	public void setUsers(Users users) {
		this.users = users;
	}



  /**
   * 用户登录
   * @return
   */
	public String login(){
		u = usersDao.login(users.getUsername(),users.getUserpassword());
		if(u!= null){			
			    session = ActionContext.getContext().getSession();
				session.put("user",u);
				return "login_success";
			
				
			}else{
				this.addActionError("用户名或密码输入错误，请重新输入!");//添加错误信息
				return "login_out";
			}				
	}
	
	
	/**
	 * 添加新用户
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public String add() {
		session = ActionContext.getContext().getSession();
		if(session.get("user")!=null){
		request = (Map<String,Object>)ActionContext.getContext().get("request");
		u = usersDao.selectname(users.getUsername());
		//验证用户名是否存在
		if(u==null){
		   if(usersDao.add(users)!=0){		   	
			  request.put("Tip","添加用户成功!");
			  return "account_success";
		   }else{
			  request.put("Tip","添加用户失败!");
			  return "account_success";		
           }
		   }else{
			  request.put("Tip","该用户名已经存在!");
			  return "account_success";
		     }
		     }
		     return "account_success";
   }
	

	/**
	 * 查看所有员工信息
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public String selectusers(){
		session = ActionContext.getContext().getSession();
		if(session.get("user")!=null){
		   list=usersDao.selectdo();    
		}
		return "users_success";
	}
	
	
	
	
	
	
	/**
	 * 修改员工信息
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public String updateuser(){
		request = (Map<String,Object>)ActionContext.getContext().get("request");
		if(usersDao.update(users)!=0){
			request.put("Tip","修改成功!");
			return "update1_success";
		}else{
			request.put("Tip","修改失败!");
			return "fail";
		}
	}

	
	
	
	
	
	
	
	
	
	
	//密码修改
	public String password(){
		
		
//		u=(Users)session.getAttribute("user");
//		u.setUsername(users.getUsername());
//		u.setUserpassword(users.getUserpassword());
		if(usersDao.update(u)!=0){
			return "password_success";
		}else{
			return "fail";
		}
	}
	
    //用户注销(退出)
	public String out(){
		session = ActionContext.getContext().getSession();
		session.remove("user");
		return "out_success";
	}
	
	
	

	

}
