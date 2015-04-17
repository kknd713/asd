package com.wanggang.dao;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import com.wanggang.enity.Department;
import com.wanggang.enity.Position;
import com.wanggang.enity.School;
import com.wanggang.enity.Users;

/**
 * 用户操作
 * @author Administrator
 *
 */
public class UsersDaoImpl implements UsersDao {
	private Transaction tr =null;
	private SessionFactory sessionFactory;
	private Session session = null;
	private Users user = null;

	
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	
	//用户登录
	@Override
	public Users login(String uid,String password) {
		user = null;
		try {
			session = sessionFactory.openSession();
			Criteria criteria1 =session.createCriteria(Users.class);
			criteria1.add(Restrictions.eq("username",uid));
			criteria1.add(Restrictions.eq("userpassword",password));
			List list=criteria1.list();
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
		   session = sessionFactory.openSession();
		   tr = session.beginTransaction();
		   session.save(us);
		   tr.commit();
		   i = 1;
	     } catch (HibernateException e) {
		  if (tr != null){
		   tr.rollback();
		  }
		  e.printStackTrace();
	     }finally {
		  session.close();
	     }
	      return i;
	     }
	
	//修改员工信息
	@Override
	public int update(Users us) {
		int i = 0;
		try {
			session = sessionFactory.openSession();
			tr = session.beginTransaction();
			Users users=(Users)session.load(Users.class, us.getUsername());
			users.setZsname(us.getZsname());
			users.setUserpassword(us.getUserpassword());
			users.setSex(us.getSex());
			users.setPosition(us.getPosition());
			users.setCondition1(us.getCondition1());
			tr.commit();
			i = 1;
		} catch (HibernateException e) {
			if (tr != null){
				tr.rollback();
			}
			e.printStackTrace();
		}finally {
			//session.close();
		}
		return i;
	}
	
	//查询员工的所有信息
	@SuppressWarnings("unchecked")
	@Override
	public List selectdo() {
		List<Object> list= new ArrayList<Object>();		
		try {
			session = sessionFactory.openSession();
			Criteria criteria1 =session.createCriteria(Users.class);
			list =criteria1.list();
		} catch (HibernateException e) {
			e.printStackTrace();
		 }
	    	return list;

	}
	
	
	
	//验证的帐号是否存在
	@Override
	public Users selectname(String uid){
		user = null;
		try {
			session = sessionFactory.openSession();
			Criteria criteria1 =session.createCriteria(Users.class);
			criteria1.add(Restrictions.eq("username",uid));
			List list=criteria1.list();
			
			Iterator it=list.iterator();
			if(it.hasNext()){
				user=(Users)it.next();
			}
		  } catch (HibernateException e) {
			e.printStackTrace();
	      }finally {
			session.close();
		  }
		  return user;
        	}	
			
			
	}
	
	



