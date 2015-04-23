package com.wanggang.util;

import java.util.Random;
import com.wanggang.service.mail.MailBean;
import com.wanggang.service.mail.send.SendMail;

/**
 *用户邮箱激活 
 * @author Administrator
 *
 */
public class ActivationMail {
	
	/**
	 * 发送邮件到安全邮箱进行验证
	 */
	public void sendCode(String con,String mail) throws Exception{
		MailBean mailBean =new MailBean();
		mailBean.setUsername("wanggang1@cdjj.com");
		mailBean.setPassword("227227");
		mailBean.setContent("请点击激活邮箱:"+con);
		mailBean.setFrom("wanggang1@ddjj.com");
		mailBean.setTo(mail);
		mailBean.initSmtpAuth();
		SendMail sendMail=new SendMail(mailBean);
		sendMail.sendMail();		;
	}
	
	
	/**
	 * 生成验证的超链接
	 * @return
	 */
	public String identifyingCode(String str){
	    String con="http://localhost:8080/Demo1/"+"action"+"?"+"str="+str;
	    return con;
	}
	
	/**
	 * 随机生成验证码
	 */
	public String makeCode(){
		Random ra=new Random();
		int number1 = ra.nextInt(10);
		int number2 = ra.nextInt(100);
		int number3 = ra.nextInt(10);
		int number4 = ra.nextInt(100);	
	    String str="W"+number1+"S"+number2+"EDR"+number3+"LK"+number4;
		return str;
	}

}
