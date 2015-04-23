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
<br/><br/><br/><br/><br/>

<table align="center">
<tr>
<td>欢迎使用优越邮箱系统.<s:if test="#session.user.condition1==0">你的邮箱处于未激活状态.</s:if></td>
</tr>
<tr>
<s:if test="#session.user.condition1==0">
<form action="activation" method="post">
<td>请输入安全邮箱:<input name="users.temporaryemail" type="text"/><input type="submit" value="确定"/></td>
</from>
</s:if>
</tr>
</table>


</body>
</html>
