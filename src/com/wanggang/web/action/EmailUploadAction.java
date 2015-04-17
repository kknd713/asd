package com.wanggang.web.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;



import org.apache.commons.io.IOUtils;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
/**
 * 上传文件到服务器
 * @author Administrator
 *
 */
@SuppressWarnings("serial")
public class EmailUploadAction extends ActionSupport {

	private File file;
	private String fileFileName;
	private String fileFileContentType;
	private String message = "你已成功上传文件";
	private String test[];
	
	public String[] getTest() {
		return test;
	}

	public void setTest(String[] test) {
		this.test = test;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public File getFile() {
		return file;
	}

	public void setFile(File file) {
		this.file = file;
	}

	public String getFileFileName() {
		return fileFileName;
	}

	public void setFileFileName(String fileFileName) {
		this.fileFileName = fileFileName;
	}

	public String getFileFileContentType() {
		return fileFileContentType;
	}

	public void setFileFileContentType(String fileFileContentType) {
		this.fileFileContentType = fileFileContentType;
	}

	@SuppressWarnings("deprecation")
	@Override
	public String execute() throws Exception {
		
		String path = ServletActionContext.getServletContext().getRealPath("/upload");

		
		try {
			File f = this.getFile();
			if(this.getFileFileName().endsWith(".exe")){								  				
				message="文件格式不允许!";
				return ERROR;
			}
			FileInputStream inputStream = new FileInputStream(f);
			FileOutputStream outputStream = new FileOutputStream(path + "/"+ this.getFileFileName());
		    IOUtils.copy(inputStream, outputStream);
		    outputStream.flush();
			inputStream.close();
			outputStream.close();
		} catch (Exception e) {
			e.printStackTrace();
			message = "对不起,文件上传失败了!!!!";
		}
		 //获取服务器接收的文件名
			  
       System.out.println(path);
		return SUCCESS;
	}

	
	

}
