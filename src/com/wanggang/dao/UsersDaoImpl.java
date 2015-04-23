package com.wanggang.dao;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.hibernate.Criteria;
import org.hibernate.FlushMode;
import org.hibernate.Hibernate;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.wanggang.enity.Department;
import com.wanggang.enity.Position;
import com.wanggang.enity.Relational;
import com.wanggang.enity.School;
import com.wanggang.enity.Users;

/**
 * 用户操作
 * @author Administrator
 *
 */
public class UsersDaoImpl extends HibernateDaoSupport implements UsersDao {
	private Users user = null;
	private File upload =null;
	//用户登录
	@Override
	public Users reglogin(String uid,String password) {
		user = null;
		try {					
			DetachedCriteria criteria1 =DetachedCriteria.forClass(Users.class);	 
			criteria1.add(Restrictions.eq("username",uid));
			criteria1.add(Restrictions.eq("userpassword",password));
			List list=this.getHibernateTemplate().findByCriteria(criteria1);
			Iterator it=list.iterator();
			if(it.hasNext()){
				user=(Users)it.next();
			}
		  } catch (HibernateException e) {
			e.printStackTrace();
	      }
		     return user; 
        	}
	
	
	
	
	//注册员工信息
	@Override
	public int add(Users us) {
		 int i = 0;
	     try{	
	       this.getHibernateTemplate().save(us);
		   i = 1;
	     } catch (HibernateException e) {
		   e.printStackTrace();
	     }
	      return i;
	      
	     }
	
	
	
	
	/**
	 * 修改用户信息
	 */
	public int update(Users u,Users user){ 
		int i = 0;
	try {
		Users ss=selectname(user.getUsername());
      if(u.getUserpassword()!=null){
		ss.setUserpassword(u.getUserpassword());
		}
      if(u.getZsname()!=null){
		ss.setZsname(u.getZsname());
		}
      if(u.getSex()!=0){
		ss.setSex(u.getSex());
		}
      if(u.getPosition()!=null){
    	  ss.setPosition(u.getPosition());
      }
      if(u.getSafemail()!=null){
		ss.setSafemail(u.getSafemail());
        }
      if(u.getSignature()!=null){
    	ss.setSignature(u.getSignature()); 
      }
      this.getHibernateTemplate().merge(ss);
		return 1;
	  } catch (HibernateException e) {  
			e.printStackTrace();
		}
		return i;
	}
	
	/**
	 * 查询员工的所有信息
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List selectdo() {
		List<Object> list= new ArrayList<Object>();		
		try {
			DetachedCriteria criteria1 =DetachedCriteria.forClass(Users.class);
			list=this.getHibernateTemplate().findByCriteria(criteria1);
		} catch (HibernateException e) {
			e.printStackTrace();
		 }
	    	return list;

	}
	/**
	 * 删除常用联系人(根据ID)
	 */
	public int deleteFrind(String username,Users users){	
		int i=0;
		try {	
		  Users use=selectname(username);
		  this.getHibernateTemplate().delete(users.getRelational());
		  i=1;
		  return i;
	     }catch (HibernateException e){ 	    	 	    	
	       e.printStackTrace();	 
	     }	
		 return i;
	}
	/**
	 * 添加常用联系人(根据用户名)
	 */
	@SuppressWarnings("unchecked")
	public int addUser(String username,Users users){
		int i=0;
		try {	
		  Users use=selectname(username);
		  //添加用户关系
		  Relational re = new Relational(0,use,users);
		  this.getHibernateTemplate().save(re);
		  users.getRelational().add(re);
		  i=1;
		  return i;
	     }catch (HibernateException e){ 	    	 	    	
	       e.printStackTrace();	 
	     }	
		 return i;
	  }
		
		


	
	/**
	 * 验证的帐号是否存在
	 */
	@Override
	public Users selectname(String uid){
		user = null;
		try {
			DetachedCriteria criteria1 =DetachedCriteria.forClass(Users.class);	
			criteria1.add(Restrictions.eq("username",uid));
			List list=this.getHibernateTemplate().findByCriteria(criteria1);			
			Iterator it=list.iterator();
			if(it.hasNext()){
				user=(Users)it.next();
			}
		  } catch (HibernateException e) {
			e.printStackTrace();
	      }
		  return user;
        	}	
		
	
	
	
	
	public int downloadFile(String filepath,String file){
		InputStream is=null;
		OutputStream os=null;
		int j =0;
		upload =new File(file);
		try {
			is = new BufferedInputStream(new FileInputStream(upload),3027);
			os = new BufferedOutputStream(new FileOutputStream(filepath),3027);
			byte buffer[] = new byte[3072];
			while(true) {
				int i=0;
				if(is!=null) {
					i=is.read(buffer);
					if(i==-1) {
						break;
					}
					os.write(buffer, 0, i);
					os.flush();
				}
			}
		j =1;
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(os !=null ||is !=null){
				try {
					os.close();
					is.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			
		}
		return j;
	}
	
	
			
	}
	
	



