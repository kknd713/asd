package com.wanggang.web.action;



import java.io.File;
import java.io.UnsupportedEncodingException;
import java.util.Map;

import javax.mail.Folder;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.mail.internet.MimeMessage;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.sun.mail.imap.IMAPFolder;
import com.wanggang.dao.UsersDao;
import com.wanggang.enity.Users;
import com.wanggang.service.mail.MailBean;
import com.wanggang.service.mail.MailConstant;
import com.wanggang.service.mail.Page;
import com.wanggang.service.mail.receive.Flag;
import com.wanggang.service.mail.receive.MailInfo;
import com.wanggang.service.mail.receive.ReceiveMail;
import com.wanggang.service.mail.send.SendMail;

@SuppressWarnings("serial")
public class EmailAction extends ActionSupport {
	
	private UsersDao usersDao;
	private Map<String,Object> session = null;
	private MailBean mailBean;
	private String upload;
    private MailInfo mailInfo;
    private long[] messageUID;
    private int index=1;        //当前页号
    private int totalPageCount; //页面显示的总页数
    private String path = ServletActionContext.getServletContext().getRealPath("/upload");
    private String downloadPath;
    private String fileName;
    
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getDownloadPath() {
		return downloadPath;
	}
	public void setDownloadPath(String downloadPath) {
		this.downloadPath = downloadPath;
	}

	public UsersDao getUsersDao() {
		return usersDao;
	}
	public void setUsersDao(UsersDao usersDao) {
		this.usersDao = usersDao;
	}
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

	public int getIndex() {
		return index;
	}
	public void setIndex(int index) {
		this.index = index;
	}
	public int getTotalPageCount() {
		return totalPageCount;
	}
	public void setTotalPageCount(int totalPageCount) {
		this.totalPageCount = totalPageCount;
	}
	
	
	/**
	 * 加载写信页面
	 */
	public String loadwritemail(){
		session = ActionContext.getContext().getSession();
		Users user=(Users)session.get("user");
		Users users=usersDao.selectname(user.getUsername());
		session.remove("user");
		session.put("user",users);
		return SUCCESS;
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
		//获取当前登录用户
		session = ActionContext.getContext().getSession();
		Users user=(Users)session.get("user");
		//验证用户邮箱状态
		if(user.getCondition1()==1){
        //调用发送邮件的方法		
			String i = user.getUsername()+"@cdjj.com";
			mailBean.setUsername(i);
			mailBean.setPassword(user.getUserpassword());
			mailBean.initSmtpAuth();
			mailBean.setFrom(user.getUsername());			
			if(upload!=null&&upload.length()>0){
				   mailBean.setFile(path+"/"+getUpload());
				}		
			SendMail sendMail=new SendMail(mailBean);
			MimeMessage msg = sendMail.createMimeMessage();
			sendMail.sendMail(msg);
			System.out.println("--------------------------");
			//保存到已发送
			//Message message=sendMail.createMimeMessage();
		   // Message[] messages={message};
		    //System.out.println(messages.length);
		    ReceiveMail receiveMail =new ReceiveMail(i,user.getUserpassword()); 
		    receiveMail.copyMessage(new Message[]{msg}, MailConstant.FOLDER_SENDED);
		    receiveMail.close();
		    
		   // Message[] messages=new Message[]{new SendMail(mailBean).createMimeMessage()};
		   // receiveMail.copyMessage(messages, MailConstant.FOLDER_SENDED);
		    //receiveMail.moveMessage(MailConstant., destFolder, mailBean.getMessageUID());
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
	          messageUID=receiveMail.getMessageUIDs(folder);
	         if(messageUID!=null){ 
	          Page page1=new Page();
	          page1.setIndex(index);
	          page1.setTotalCount(messageUID.length);
	          totalPageCount=page1.getTotalPageCount();
	          mailInfo=receiveMail.getMailList(page1.getStartRow(), page1.getEndRow(), messageUID);          
	          //关闭资源
	          receiveMail.close(); 
	         }  
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
     * 删除邮件(收件箱)
     * @throws MessagingException 
     */
	public String deleteMail() throws MessagingException{
		receiveMail =validateUser();	    	       
	    receiveMail.moveMessage(MailConstant.FOLDER_INBOX, MailConstant.FOLDER_DELETE,messageUID);	       		
	    return "receiveMail_success";
	}
	//删除邮件(草稿箱)
	public String deleteMailD() throws MessagingException{
		receiveMail =validateUser();	    	       
	    receiveMail.moveMessage(MailConstant.FOLDER_DRAFT, MailConstant.FOLDER_DELETE,messageUID);	       		
	    return "deleteMailD";
	}
	//删除邮件(已发送)
		public String deleteMailS() throws MessagingException{
			receiveMail =validateUser();	    	       
		    receiveMail.moveMessage(MailConstant.FOLDER_SENDED, MailConstant.FOLDER_DELETE,messageUID);	       		
		    return "deleteMailS";
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
     public String moveMail() throws Exception{	 
    	 receiveMail =validateUser();
    	 receiveMail.moveMessage(MailConstant.FOLDER_INBOX, MailConstant.FOLDER_SPAM, messageUID);
    	 receiveMail.close();// 关闭连接	 
    	 return "moveMail";
     }
     //移动垃圾邮件到收件箱
     public String moveMailR() throws Exception{	 
    	 receiveMail =validateUser();
    	 receiveMail.moveMessage(MailConstant.FOLDER_SPAM, MailConstant.FOLDER_INBOX, messageUID);
    	 receiveMail.close();// 关闭连接	 
    	 return "moveMailR";
     }
     
     
     
     
     
     
     
     
     /**
      *根据UID查看指定邮件内容 
      * @throws Exception 
      *
      */
     public void getmailBean(String fol,long emailUid) throws Exception{
    	receiveMail =validateUser();
    	receiveMail.openFolder(fol,Folder.READ_WRITE); 
    	mailBean = receiveMail.getMessageByUID(emailUid);
 		receiveMail.close();		
 	}   
     
    //查看邮件内容(收件箱)
     public String getmailBeanR() throws Exception{
    	 getmailBean(MailConstant.FOLDER_INBOX,messageUID[0]);
     	return "getmailBeanR";		
    }
   //查看邮件内容(已删除)
     public String getmailBeanY() throws Exception{
    	 getmailBean(MailConstant.FOLDER_DELETE,messageUID[0]);
     	return "getmailBeanY";		
    }
   //查看邮件内容(垃圾箱)
     public String getmailBeanL() throws Exception{
    	 getmailBean(MailConstant.FOLDER_SPAM,messageUID[0]);
     	return "getmailBeanL";		
    }
   //查看邮件内容(已发送)
     public String getmailBeanS() throws Exception{
    	 getmailBean(MailConstant.FOLDER_SENDED,messageUID[0]);
     	return "getmailBeanS";		
    }
   //查看邮件内容(草稿箱)
     public String getmailBeanD() throws Exception{
    	 getmailBean(MailConstant.FOLDER_DRAFT,messageUID[0]);
     	return "getmailBeanD";		
    }
   
     
     /**
      * 转发邮件
     * @throws Exception 
      * 
      */
     //转发(收件箱)
     public String transmitMailR() throws Exception{
    	getmailBean(MailConstant.FOLDER_INBOX,messageUID[0]); 
    	 return "transmitMailR";
     }
     //转发(已删除)
     public String transmitMailY() throws Exception{
     	getmailBean(MailConstant.FOLDER_DELETE,messageUID[0]); 
     	 return "transmitMailY";
      }
     //转发(垃圾箱)
     public String transmitMailL() throws Exception{
     	getmailBean(MailConstant.FOLDER_SPAM,messageUID[0]); 
     	 return "transmitMailL";
      }
   //转发(已发送)
     public String transmitMailS() throws Exception{
     	getmailBean(MailConstant.FOLDER_SENDED,messageUID[0]); 
     	 return "transmitMailS";
      }
   //转发(草稿箱)
     public String transmitMailD() throws Exception{
     	getmailBean(MailConstant.FOLDER_DRAFT,messageUID[0]); 
     	 return "transmitMailD";
      }
     
     
     
     
     
     
	 /**
	  * 存草稿
	 * @throws MessagingException 
	 * @throws UnsupportedEncodingException 
	  */
	 public String savedraft() throws MessagingException, UnsupportedEncodingException{ 
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
				if(upload!=null&&upload.length()>0){
					   mailBean.setFile(path+"/"+getUpload());
					}
		    SendMail sendMail=new SendMail(mailBean);
		    Message message=sendMail.createMimeMessage();
		    Message[] messages={message};
		    System.out.println(messages.length);
		    ReceiveMail receiveMail =new ReceiveMail(i,user.getUserpassword()); 
		    receiveMail.copyMessage(messages, MailConstant.FOLDER_DRAFT);		  
			}
		    return "savedraft";
	 }
	 
	 /**
	  * 下载文件
	  * @param folderType
	  * @param uid
	  * @param fileName
	  * @return
	  * @throws Exception
	  */
/*	 public String attachmentDownLoad()throws Exception {		  
		    receiveMail =validateUser();
		    receiveMail.openFolder(mailBean.getRecord(), Folder.READ_WRITE);
		    receiveMail.getMessageByUID(mailBean.getMessageUID(), true, mailBean.getFile(), path);// 保存附件到指定的路径中
		    receiveMail.close();
			return "attachmentDownLoad";
		}*/
     
     
     
     
     
     
     
     
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
	
/*	*//**
	 * 附件下载
	 * @return
	 * @throws UnsupportedEncodingException 
	 * @throws UnsupportedEncodingException 
	 *//*
	public String download(){
		String filepath =getDownloadPath() + fileName;
		String accessory=path+"/"+fileName;
		File f = new File(getDownloadPath()) ;// 实例化File类的对象
		f.mkdir();// 创建文件夹	
		usersDao.downloadFile(filepath,accessory);
        return "download_success";
	

	}
	*/
     

}
