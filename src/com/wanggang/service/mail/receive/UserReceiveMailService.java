package com.wanggang.service.mail.receive;



import javax.mail.Folder;
import javax.mail.MessagingException;
import javax.mail.search.FlagTerm;
import javax.mail.search.SearchTerm;

import org.springframework.stereotype.Service;







import com.sun.mail.imap.IMAPFolder;
import com.wanggang.service.mail.MailBean;
import com.wanggang.service.mail.MailConstant;

/**
 * 类说明：接收邮件服务层
 * 
 */
@Service
public class UserReceiveMailService {

	// 根据邮件夹名称返回邮件夹类型
	public static int folderType(String folderName) {
		if (folderName.equals(MailConstant.FOLDER_INBOX)) {
			return MailConstant.INBOX;
		} else if (folderName.equals(MailConstant.FOLDER_DRAFT)) {
			return MailConstant.DRAFT;
		} else if (folderName.equals(MailConstant.FOLDER_DELETE)) {
			return MailConstant.DELETE;
		} else if (folderName.equals(MailConstant.FOLDER_SENDED)) {
			return MailConstant.SENDED;
		} else if (folderName.equals(MailConstant.FOLDER_SPAM)) {
			return MailConstant.SPAM;
		}
		return MailConstant.INBOX;
	}

}
