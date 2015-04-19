<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
.STYLE1 {
	font-size: 12px;
	color: #FFFFFF;
}
.STYLE3 {
	font-size: 12px;
	color: #033d61;
}
-->
</style>
<style type="text/css">
.menu_title SPAN {
	FONT-WEIGHT: bold; LEFT: 3px; COLOR: #ffffff; POSITION: relative; TOP: 2px 
}
.menu_title2 SPAN {
	FONT-WEIGHT: bold; LEFT: 3px; COLOR: #FFCC00; POSITION: relative; TOP: 2px
}

a:link {
	color: #036;
	text-decoration: none;
}
a:visited {
	text-decoration: none;
	color: #036;
}
a:hover {
	text-decoration: none;
}
a:active {
	text-decoration: none;
}
</style>

<script type="text/jscript">
		<!--添加用户-->	
		function management7(){
				document.getElementById("wang").src = "../tab/tab_add_user.jsp";
			}
		<!--修改用户-->	
		function management8(){
				document.getElementById("wang").src = "../tab/tab_update_user.jsp";
			}
		<!--查看用户-->	
		function management9(){
				document.getElementById("wang").src = "selectusers.action";
			}	
		<!--修改资料-->	
		function management10(){
				document.getElementById("wang").src = "../tab/tab_update_user_yh.jsp";
			}
		<!--修改密码-->	
		function management11(){
				document.getElementById("wang").src = "../tab/tab_password_user.jsp";
			}
</script>
</head>
<body>
<div style="float:left; margin-left:6px; padding:0">
<td >
<table height="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td height="28" background="../images/main_40.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="19%">&nbsp;</td>
        <td width="81%" height="20"><span class="STYLE1">管理菜单</span></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td valign="top"><table width="151" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="23" background="../images/main_47.gif" id="imgmenu1" class="menu_title" onMouseOver="this.className='menu_title2';" onClick="showsubmenu(1)" onMouseOut="this.className='menu_title';" style="cursor:hand"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="18%">&nbsp;</td>
                <td width="82%" class="STYLE1">用户管理模块<br></td>
              </tr>
            </table></td>
          </tr>
          <tr> 
            <td background="../images/main_51.gif" id="submenu1" >
			 <div class="sec_menu" >  
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td><table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
                  <tr>
                    <td width="16%" height="25"><div align="center"><img src="../images/left.gif" width="10" height="10" /></div></td>
                    <td width="84%" height="23"><table width="95%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td height="20" style="cursor:hand" onmouseover="this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#7bc4d3'; "onmouseout="this.style.borderStyle='none'"><span class="STYLE3"><a href="http://localhost:8080/Demo1/tab/writemail.jsp" target="mainFrame">写信</a></span></td>
                        </tr>
                    </table></td>
                  </tr>
                  <tr>
                    <td height="23"><div align="center"><img src="../images/left.gif" width="10" height="10" /></div></td>
                    <td height="23"><table width="95%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td height="20" style="cursor:hand" onmouseover="this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#7bc4d3'; "onmouseout="this.style.borderStyle='none'"><span class="STYLE3"><a href="http://localhost:8080/Demo1/receiveMail.action" target="mainFrame">收信</a></span></td>
                        </tr>
                    </table></td>
                  </tr>
                  <tr>
                    <td height="23"><div align="center"><img src="../images/left.gif" width="10" height="10" /></div></td>
                    <td height="23"><table width="95%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td height="20" style="cursor:hand" onmouseover="this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#7bc4d3'; "onmouseout="this.style.borderStyle='none'"><span class="STYLE3"><a href="http://localhost:8080/Demo1/receiveMail.action" target="mainFrame">收信箱</a></span></td>
                        </tr>
                    </table></td>
                  </tr>
                  <tr>
                    <td height="23"><div align="center"><img src="../images/left.gif" width="10" height="10" /></div></td>
                    <td height="23"><table width="105" border="0" cellspacing="0" cellpadding="0" height="22">
                        <tr>
                          <td height="20" style="cursor:hand" onmouseover="this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#7bc4d3'; "onmouseout="this.style.borderStyle='none'"><span class="STYLE3"><a href="http://localhost:8080/Demo1/tab/draftMail.action" target="mainFrame">草稿箱</a></span></td>
                        </tr>
                    </table></td>
                  </tr>
                   <tr>
                    <td height="23"><div align="center"><img src="../images/left.gif" width="10" height="10" /></div></td>
                    <td height="23"><table width="105" border="0" cellspacing="0" cellpadding="0" height="22">
                        <tr>
                          <td height="20" style="cursor:hand" onmouseover="this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#7bc4d3'; "onmouseout="this.style.borderStyle='none'"><span class="STYLE3"><a href="http://localhost:8080/Demo1/tab/transmittedMail.action" target="mainFrame">已发送</a></span></td>
                        </tr>
                    </table></td>
                  </tr>
                </table></td>
              </tr>
            </table></div></td>
          </tr>
          
        </table></td>
      </tr>

          
          <tr>
            <td background="../images/main_51.gif" id="submenu2" ><div class="sec_menu" >
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td><table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
                        <tr>
                          <td width="16%" height="25"><div align="center"><img src="../images/left.gif" width="10" height="10" /></div></td>
                          <td width="84%" height="23"><table width="95%" border="0" cellspacing="0" cellpadding="0">
                              <tr>
                                <td height="20" style="cursor:hand" onmouseover="this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#7bc4d3'; "onmouseout="this.style.borderStyle='none'"><span class="STYLE3"><a  href="http://localhost:8080/Demo1/deletedEmail.action" target="mainFrame">已删除</a></span></td>
                              </tr>
                          </table></td>
                        </tr>
                        <tr>
                          <td height="23"><div align="center"><img src="../images/left.gif" width="10" height="10" /></div></td>
                          <td height="23"><table width="95%" border="0" cellspacing="0" cellpadding="0">
                              <tr>
                                <td height="20" style="cursor:hand" onmouseover="this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#7bc4d3'; "onmouseout="this.style.borderStyle='none'"><span class="STYLE3"><a href="http://localhost:8080/Demo1/rubbishMail.action" target="mainFrame">垃圾箱</a></span></td>
                              </tr>
                          </table></td>
                        </tr>                   
                    </table></td>
                  </tr>
                  <tr>
                    <td height="5"><img src="../images/main_52.gif" width="151" height="5" /></td>
                  </tr>
                </table>
            </div></td>
          </tr>
        </table></td>
      </tr>        
    <!--判断用户权限-->
    <s:if test="#session.user.permission=='管理员'">
      <jsp:include page="left-admin.jsp"/>
    </s:if>
    <s:else>
      <jsp:include page="left-user.jsp"/>
    </s:else>
</table>
</div>

</body>
