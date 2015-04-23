package com.wanggang.web.action;

import java.util.List;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.wanggang.dao.UsersDao;
import com.wanggang.enity.Users;
import com.wanggang.util.ActivationMail;


public class UsersAction extends ActionSupport {
	private List<Users> list;
	private UsersDao usersDao;
	private Users users;
	private Users u = null;
	private Map<String,Object> request = null;
	private Map<String,Object> session = null;
    private String flage;
	private String Code; //验证码
	
	
	public String getCode() {
		return Code;
	}
	public void setCode(String code) {
		Code = code;
	}
	public String getFlage() {
		return flage;
	}
	public void setFlage(String flage) {
		this.flage = flage;
	}
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
		u = usersDao.reglogin(users.getUsername(),users.getUserpassword());
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
	 * 验证用户邮箱状态
	 */
	public String mailCondition(){
		session = ActionContext.getContext().getSession();
		Users user=(Users)session.get("user");
		u = usersDao.reglogin(user.getUsername(),user.getUserpassword());
		session = ActionContext.getContext().getSession();
		session.remove("user");
	    session.put("user",u);
		return "mailCondition";
	}
	
	
	
	/**
	 * 激活邮箱
	 * @throws Exception 
	 */
	public String activation() throws Exception{
		System.out.println(users.getTemporaryemail());
		ActivationMail activationMail=new ActivationMail();
		String str=activationMail.makeCode();		
		activationMail.sendCode(activationMail.identifyingCode(str), users.getTemporaryemail());	    
		return "activation";
	}
    /**
     * 验证用户验证码
     */
	public String activationCode(){
		
		
		
		
		
		
		return null;
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
	 * 修改用户信息（包括密码、签名档）
	 */
	public String SignatureAndMail(){
		session = ActionContext.getContext().getSession();
		Users user=(Users)session.get("user");
		int i=usersDao.update(users,user);	
	    if(users.getSafemail()==null){
	    	return "updatepassword";
	    }else if(users.getUserpassword()==null){
	    	return "SignatureAndMail";
	    }else{
	    	return "updateusers";
	    }
		  
		
	}
	/**
	 * 添加常用联系人
	 * @return
	 */
	public String addusers(){
		session = ActionContext.getContext().getSession();
		Users user=(Users)session.get("user");
        int i=usersDao.addUser(users.getUsername(), user);
		return "addusers";
	}
	
	/**
	 * 删除指定常用联系人
	 * @return
	 */
	public String removeUser(){
		session = ActionContext.getContext().getSession();
		Users user=(Users)session.get("user");
		int i=usersDao.deleteFrind(users.getUsername(),user);
		return "removeUser";
	}
	
    /**
     * 用户注销(退出)
     * @return
     */
	public String out(){
		session = ActionContext.getContext().getSession();
		session.remove("user");
		return "out_success";
	}
	
	
	
	
	//加载用户信息
	public Users  loadUser(){
		session = ActionContext.getContext().getSession();
		Users user=(Users)session.get("user");
		return user;
	}
	
	

	

}
