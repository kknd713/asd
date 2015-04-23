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
<title>修改密码</title>

<script type="text/javascript">
function dom(){
    var ia=document.getElementById("ee").value;
    var ip=document.getElementById("pp").value;
	if(ia!=ip){
		alert("密码不一致,请重新输入!")
	}else{
		if(ia.length>10){
		  alert("密码长度请不要超过10位数")
		}else{
			document.forms[0].submit();
		}
	}
	
}

</script>

</head>

<body>
<form action="SignatureAndMail" method="post">
<input type="hidden" name="users.username" value="<s:property value='#session.user.username'/>"/> 
<fieldset>
</br></br></br></br></br>
<table width="60%" align="center" border="0" cellspacing="2" cellpadding="3">
<tr>
<td align="right">新密码:</td>
<td><input type="password" id="ee" width="30%" name="users.userpassword"/></td>
</tr>
<tr>
<td align="right">确认密码:</td>
<td><input type="password" id="pp" width="30%" /></td>
</tr>
</table>
<table width="60%" align="center" border="0" cellspacing="0" cellpadding="0">
<tr>
<td  width="45%"></td>
<td><input type="button" name="news3" value="提交" onclick="dom()"/></td>
</tr>
</table>
</fieldset>
</form>
</body>
</html>
