package com.wanggang.web.action;


import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.mail.Flags;
import javax.mail.Folder;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.mail.internet.MimeMessage;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.sun.mail.imap.IMAPFolder;
import com.wanggang.enity.Users;
import com.wanggang.service.mail.MailBean;
import com.wanggang.service.mail.MailConstant;
import com.wanggang.service.mail.receive.Flag;
import com.wanggang.service.mail.receive.MailInfo;
import com.wanggang.service.mail.receive.ReceiveMail;
import com.wanggang.service.mail.receive.UserReceiveMailService;
import com.wanggang.service.mail.send.SendMail;

@SuppressWarnings("serial")
public class EmailAction extends ActionSupport {
		
	private Map<String,Object> session = null;
	private MailBean mailBean;
	private String upload;
    private MailInfo mailInfo;
    private long[] messageUID;

    
    private ReceiveMail receiveMail=null;

	public long[] getMessageUID() {
		return messageUID;
	}
	public void setMessageUID(long[] messageUID) {
		this.messageUID = messageUID;
	}
	public MailInfo getMailInfo() {
		return mailInfo;
	}
	public void setMailInfo(MailInfo mailInfo) {
		this.mailInfo = mailInfo;
	}
	public String getUpload() {
		return upload;
	}
	public void setUpload(String upload) {
		this.upload = upload;
	}
	public MailBean getMailBean() {
		return mailBean;
	}
	public void setMailBean(MailBean mailBean) {
		this.mailBean = mailBean;
	}

	
	/**
	 * 
	 * 发送邮件
	 * @throws MessagingException 
	 * @throws UnsupportedEncodingException 
	 * @throws AddressException 
     *
	 */
	public String sendemail() throws AddressException, UnsupportedEncodingException, MessagingException{
		String path = ServletActionContext.getServletContext().getRealPath("/upload");
		//获取当前登录用户
		session = ActionContext.getContext().getSession();
		Users user=(Users)session.get("user");
		//验证用户邮箱状态
		if(user.getCondition1()==1){
        //调用发送邮件的方法		
			String i = user.getUsername()+"@cdjj.com";
			mailBean.setUsername(i);
			mailBean.setPassword(user.getUserpassword());
			mailBean.setFrom(user.getUsername());			
			if(upload.length()>0){
				   mailBean.setFile(path+"/"+getUpload());
				}
			mailBean.initSmtpAuth();
			SendMail sendMail=new SendMail(mailBean);
			sendMail.sendMail();
			return "recipients_success";
		}else{
			return "fail";
		}

	}
	
	
	 /**
	  * 查看邮件
	  * @param dd
	  * @return
	  * @throws Exception
	  */
	 public String communal(String dd ) throws Exception{	
		  //获取用户信息
	       session = ActionContext.getContext().getSession();
	       Users user=(Users)session.get("user");  
          //判断用户权限
	       if(user.getCondition1()==1){     
	          String i = user.getUsername()+"@cdjj.com";	
	          ReceiveMail receiveMail =new ReceiveMail(i,user.getUserpassword());
	          IMAPFolder folder = receiveMail.openFolder(dd, Folder.READ_WRITE);  	      
	          mailInfo=receiveMail.getMailList(folder);
	          //关闭资源
	          receiveMail.close(); 
	        //判断文件夹类型,设置返回值  
	        if(dd.equals(MailConstant.FOLDER_INBOX)){  
  		     return "receiveMail_success";			       
	        }else if(dd.equals(MailConstant.FOLDER_DELETE)){
	         return"deletedEmail_success"; 	
	        }else if(dd.equals(MailConstant.FOLDER_DRAFT)){
	         return"draftMail_success";	
	        }else if(dd.equals(MailConstant.FOLDER_SENDED)){
	         return "transmittedMail_success";	
	        }else{
	         return "rubbishMail_success";	
	        }
          }
           return INPUT;
	   }
	
	//查看收件箱
	public String reMail() throws Exception {		  
		     String io= communal(MailConstant.FOLDER_INBOX);
		     return io;
		   }
	
	//查看已删除
	public String deletedEmail() throws Exception  {		  
		  String io= communal(MailConstant.FOLDER_DELETE);
		  return io;
	   }
	//查看草稿箱
	 public String draftMail() throws Exception  {		  
		  String io= communal(MailConstant.FOLDER_DRAFT);
		  return io;       
	   }
	//查看已发送
	 public String transmittedMail() throws Exception  {	
		  String io= communal(MailConstant.FOLDER_SENDED);
		  return io;    		       
	   }
	
	//查看垃圾箱
	 public String rubbishMail() throws Exception  {		  
		  String io= communal(MailConstant.FOLDER_SPAM);
		  return io;
	   }

	 
	 
	 
    /**
     * 删除邮件(移动到已删除邮件箱)
     * @throws MessagingException 
     */
	public String deleteMail() throws MessagingException{
		receiveMail =validateUser();	    	       
	    receiveMail.moveMessage(MailConstant.FOLDER_INBOX, MailConstant.FOLDER_DELETE,messageUID);	       		
	    return "receiveMail_success";
	}	
	
	
	
	/**
	 * 彻底删除邮件
	 * @throws MessagingException 
	 */
	//彻底删除(收件箱)
	public String thoroughDelete() throws MessagingException{
		   receiveMail =validateUser();
	       receiveMail.deleteMessage(MailConstant.FOLDER_INBOX, messageUID);	
		   return "receiveMail_success";
	}
	//彻底删除(已删除)
	public String thoroughDeleteY() throws MessagingException{
		receiveMail =validateUser();
		receiveMail.deleteMessage(MailConstant.FOLDER_DELETE, messageUID);	
		return "thoroughDeleteY";
	}
	//彻底删除(草稿箱)
	public String thoroughDeleteC() throws MessagingException{
		receiveMail =validateUser();
		receiveMail.deleteMessage(MailConstant.FOLDER_DRAFT, messageUID);	
		return "thoroughDeleteC";
	}
	//彻底删除(已发送)
	public String thoroughDeleteS() throws MessagingException{
		receiveMail =validateUser();
		receiveMail.deleteMessage(MailConstant.FOLDER_SENDED, messageUID);	
		return "thoroughDeleteS";
	}
	//彻底删除(垃圾箱)
	public String thoroughDeleteR() throws MessagingException{
		receiveMail =validateUser();
		receiveMail.deleteMessage(MailConstant.FOLDER_SPAM, messageUID);	
		return "thoroughDeleteR";
	}
		

	
	
	/**
	 * 标记为已读
	 * @throws MessagingException 
	 * @throws Exception 
	 */
	 public void badge(String uu) throws MessagingException{
		 receiveMail =validateUser();
		 IMAPFolder scr = receiveMail.openFolder(uu, Folder.READ_WRITE);
		 Message[] messages = scr.getMessagesByUID(messageUID);
		 scr.setFlags(messages, Flag.SEEN.getFlag(), true);
		 receiveMail.close();
	 }
	 //标记为已读(收件箱)
     public String badgeAlready() throws Exception{
         badge(MailConstant.FOLDER_INBOX);
    	 return "receiveMail_success";
     }
     //标记为已读(已删除)
     public String badgeAlreadyY() throws Exception{
  	     badge(MailConstant.FOLDER_DELETE);
  	     return "badgeAlreadyY";
   }
     //标记为已读(垃圾箱)
     public String badgeAlreadyL() throws Exception{
	       badge(MailConstant.FOLDER_SPAM);
	  	   return "badgeAlreadyL";
   }

     
     /**
      * 移动收件箱邮件到垃圾箱
     * @throws MessagingException 
      */
     public String moveMail() throws MessagingException{	 
    	 receiveMail =validateUser();
    	 receiveMail.moveMessage(MailConstant.FOLDER_INBOX, MailConstant.FOLDER_SPAM, messageUID);
    	 receiveMail.close();// 关闭连接	 
    	 return "moveMail";
     }
     //移动垃圾邮件到收件箱
     public String moveMailR() throws MessagingException{	 
    	 receiveMail =validateUser();
    	 receiveMail.moveMessage(MailConstant.FOLDER_SPAM, MailConstant.FOLDER_INBOX, messageUID);
    	 receiveMail.close();// 关闭连接	 
    	 return "moveMailR";
     }
     
     
     
     
     
     
     
     
     
     
     
     
     
     
	 /**
	  * 存草稿
	 * @throws MessagingException 
	 * @throws UnsupportedEncodingException 
	  */
	 public String savedraft() throws MessagingException, UnsupportedEncodingException{
		
		 
		 return "savedraft";
	 }
     
     
     
     
     
     
     
     
     
     
	/**
	 * 验证用户
	 * @throws MessagingException 
	 */
	public ReceiveMail validateUser() throws MessagingException{
		   session = ActionContext.getContext().getSession();
	       Users user=(Users)session.get("user");
	       String i = user.getUsername()+"@cdjj.com";
	       ReceiveMail receiveMail =new ReceiveMail(i,user.getUserpassword()); 
	       return receiveMail;
	}
	
	
	
     

}
