<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>



</head>
<body>

<h1 align="center">用户信息列表</h1>

<table   align="center" width="90%" border="1" cellpadding="0" cellspacing="0" style="border:thin solid #666; margin-top:20px">
<tr >
		<td align="center">姓名</td>
		<td align="center">用户名</td>
		<td align="center">密码</td>
		<td align="center">性别</td>
		<td align="center">所属校区</td>
		<td align="center">所属部门</td>
		<td align="center">所在职位</td>
		<td align="center">邮箱状态</td>
	</tr>
	
	
	
	<s:iterator var="users" value="list" status="status">
            <tr>
				<td align="center"><s:property value="#users.zsname" /></td>
				<td align="center"><s:property value="#users.username"/></td>
				<td align="center"><s:property value="#users.userpassword"/></td>
				<s:if test="#users.sex==1">
				<td align="center">男</td>
				</s:if>
				<s:elseif test="#users.sex==2">
				<td align="center">女</td>
				</s:elseif>
				<s:else>
				<td align="center">保密</td>
				</s:else>
				<td align="center"><s:property value="#users.position.department.school.schoolname"/></td>
				<td align="center"><s:property value="#users.position.department.departmentname"/></td>
				<td align="center"><s:property value="#users.position.positionname"/></td>
				<s:if test="#users.condition1==1">
				<td align="center">已激活</td>
				</s:if>
				<s:else>
				<td align="center">未激活</td>
				</s:else>						
			</tr>
	</s:iterator>
</table>


</body>
</html>