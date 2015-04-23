<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@taglib uri="/struts-tags" prefix="s" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
</head>

<body>
<form id="myForm" name="myForm" action="SignatureAndMail" method="post">      
	<div class="action">
		<div class="pages">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td align="left"  width="8%">安全邮箱：</td>
                    <td align="left" colspan="2"><input type="text" name="users.safemail" id="title"/> <font color="#FF0000">*</font></td>
				</tr>                
				<tr>
					<td align="left" >签名档：</td>
                    <td align="left" colspan="2"><textarea cols="60" rows="10" name="users.signature" id="signature"></textarea></td>
				</tr>				
                  <tr>
                    <td><div style="margin-left:30%"></div></td>
                    <td class="STYLE1"><div style="margin-left:30%"><input type="submit" name="tijiao" value="提交"/></div></td>
                  </tr>
			</table>			
		</div>
	</div>
</form>
</body>
</html>
