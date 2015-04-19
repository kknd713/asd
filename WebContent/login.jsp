<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@taglib uri="/struts-tags" prefix="s" %>



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>邮箱登录页面</title>


<style type="text/css">
#ding{width: 100%;height:300px; margin:0; padding:0; background:url(images/denglujiemian.gif) repeat-x  center;}
#xia{width: 100%;height:330px; margin:0; padding:0; background: url(images/xia.gif) repeat center;}
body{ margin:0; padding:0;}
#zhong { color:#000; background-image:url(images/zhong.gif)}

#check1{ margin:0;}
</style>


<script type="text/javascript" src="js/jquery-1.5.1.min.js" ></script>
<script type="text/javascript">
	 	function logincheck(){
  			 var uname =document.getElementById("loginname").value;
			 var pword =document.getElementById("loginpassword").value;
			if(uname == null||uname=="" ){
				document.getElementById("check1").innerHTML = "用户名不能为空！";
				return false;
			}else if(pword == null ||pword==""){
				document.getElementById("check1").innerHTML = "密码不能为空！";
				return false;
			}else{
				return true;
			}
		}
</script>
</head>

<body>
<div id="ding"></div>
<div id="zhong">
<form action="userlogin" method="post" id="loginfrom">
    <table width="39%" border="0" cellspacing="0" cellpadding="0" align="center">
      <tr>
        <td height="32" colspan="2" align="right" id="STYLE1">邮箱名：</td>
        <td width="66%"><input type="text" name="users.username"  id="loginname"/>
        </td>
    </tr>
    <tr>
        <td height="32" colspan="2" align="right">密码：</td>
        <td><input type="password" name="users.userpassword"  id="loginpassword"/><br/></td>
    </tr>
    <tr>
        <td height="32" colspan="2" align="right"></td>
        <td ><input id="login" type="submit" value="登录" onclick="return logincheck();"/>&nbsp;<input type="reset" value="重置" /></td>
    </tr>

   </table>
         
</form>
</div>
<div id="xia">
  <table width="39%" border="0" cellspacing="0" cellpadding="0" align="center">
    <tr>
        <td align="center"><font color="red" id="check1"><s:actionerror /></font></td>
    </tr>
  </table>  
</div>
</body>
</html>
