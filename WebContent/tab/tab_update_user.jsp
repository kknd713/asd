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
<script type="text/javascript" src="<%=basePath %>js/jquery-1.5.1.min.js"></script>
<script type="text/javascript" src="<%=basePath %>js/jQuery.Hz2Py-min.js"></script>
<script type="text/javascript">			
	function setit(){
		var zsname=document.getElementById("zsname").value;
		var username=document.getElementById("username").value;
		var password=document.getElementById("password").value;
		var sex=document.getElementById("sex").value;
		var school=document.getElementById("school").value;
		var department=document.getElementById("department").value;
		var position=document.getElementById("position").value;
		var safemail=document.getElementById("safemail").value;
		if(zsname == null||zsname=="" ){
			alert("姓名不能为空！");
			return false;
		}else if(username == null||username=="" ){
			alert("用户名不能为空！");
			return false;
		}else if(password == null||password=="" ){
			alert("密码不能为空！");
			return false;
		}else if(sex == null||sex=="" ){
			alert("性别不能为空！");
			return false;
		}else if(school == null||school==""){
			alert("所属校区不能为空！");
			return false;
		}else if(department == null||department==""){
			alert("所在部门不能为空！");
			return false;
		}else if(position == null||position==""){
			alert("所在职位不能为空！");
			return false;
		}else if(safemail == null||safemails==""){
			alert("安全邮箱不能为空！");
			return false;
		}else if(confirm("您确定要保存数据吗（y/n）？")){
			return true;
		}
	}
	function fan(){
		confirm("确定不注册了吗？（y/n）？")
		}

</script>
</head>
<body >
<form id="myForm" name="myForm" action="SignatureAndMail" method="post">
<p align="center" style="font-size:36px; font-family:Tahoma, Geneva, sans-serif">修改用户信息</p>
		<div class="pages">
		  <table  width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
            	<tr>
					<td align="right" width="30%">用户名：</td>
                    <td align="left" ><input type="username" name="users.username" id="username"/></td>
				</tr>		  
            	<tr>
					<td align="right" width="30%">真实姓名：</td>
                    <td align="left"><input type="text" name="users.zsname" id="zsname"/></td>
				</tr>
                <tr>
					<td align="right" width="30%">密码：</td>
                    <td align="left"><input type="password" name="users.userpassword" id="password"/></td>
				</tr>

				<tr>
					<td align="right" width="30%">性别：</td>
                    <td align="left">
                    	<select id="sex" name="users.sex">
    						<option value="">请选择</option>
    						<option value="1" >男</option>
    						<option value="2" >女</option>
   						</select>
                    </td>
                </tr>
                
                
                <tr>
					<td align="right" width="30%">所属校区：</td>
                    <td align="left" >            
                       <select name="" id="school">
                          <option>请选择校区</option>
                          <option value="1">成都锦江校区</option>
                          <option value="2">成都青羊校区</option>
                       </select>
                    </td>
				</tr>
				
				
				
                <tr>
					<td align="right" width="30%">所属部门：</td>
                    <td align="left" >            
                      <select id="department"  name="" > 
                        <option value="">请选择部门</option>
                        <option value="1">总经办</option>
                      </select>
                    </td>
				</tr>                
				<tr>
					<td align="right" width="30%">职位：</td>
                    <td align="left"> 
                        <select name="users.position.positionid"  id="position">
    						<option value="">请选择职位</option> 
    						<option value="1">校长</option>  						
   						</select>
                   </td>
				</tr>
				<tr>
					<td align="right" width="30%">安全邮箱：</td>
                    <td align="left"><input type="text" name="users.safemail" id="safemail"/></td>
				</tr> 
				<tr >
                    	<td align="right" width="30%"><input type="submit"  id="save" value="确定"  onclick="return setit();"/></td>
                   		<td><input type="reset"  id="reset1" value="返回" onclick="fan();"/></td>
				</tr>
				<tr>
                    	<td align="right" width="30%"></td>
                   		<td><font color="red"><s:property value="#request.Tip"/></font></td>
				</tr>
		  </table>			
		</div>
  </div>
</form>
</body>
</html>
