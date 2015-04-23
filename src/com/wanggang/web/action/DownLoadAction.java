package com.wanggang.web.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
			
	/**
     * 
     * 下载邮件
     */
@SuppressWarnings("serial")
public class DownLoadAction extends ActionSupport {
	    //文件名字
	    private String fileName ;
	    private String file;
		public String getFileName() {
			return fileName;
		}

		public void setFileName(String fileName) {
			this.fileName = fileName;
		}	
		public String getFile() {
			return file;
		}

		public void setFile(String file) {
			this.file = file;
		}

	public InputStream getInputStream(){
	    	try {
	    		String path = ServletActionContext.getServletContext().getRealPath("/upload");
				String filePath=path + "/"+file;	
				this.fileName=file;
				return new FileInputStream(new File(filePath));
			} catch (Exception e) {
				e.printStackTrace();
			}
			return null;
	    }
		
		   public String execute() throws Exception {	 			   
		        return SUCCESS;
		    }
	
	
	
	
	

}
