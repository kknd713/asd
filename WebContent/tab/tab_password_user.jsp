<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>修改密码</title>


</head>

<body>
<br/>
<form id="myForm" name="myForm" action="" method="post">
<table width="95%" align="center" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="30" background="images/tab_05.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="12" height="30">&nbsp;</td>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="46%" valign="middle"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="3%"><div align="center"></div></td>
                <td width="97%" class="STYLE1">&nbsp;</td>
              </tr>
            </table></td>
           
          </tr>
        </table></td>
        <td width="16">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td><table width="100%" align="center" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="8" background="images/tab_12.gif">&nbsp;</td>
        <td><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="b5d6e6" onmouseover="changeto()"  onmouseout="changeback()" style="">
          <tr>
            <td width="100%" height="22" colspan="2" background="images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE3">修改密码</span></div></td>
          </tr>
          <tr>
            <td width="20%"  height="25" bgcolor="#FFFFFF"><div align="center" class="STYLE1">原密码：
            </div></td>
            <td height="20" bgcolor="#FFFFFF"><div align="center" class="STYLE1">
              <div align="left">&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="text"  name="textfield1"  class="calinput"/>
              </div>
            </div></td>
          </tr>
          <tr>
            <td height="25" bgcolor="#FFFFFF"><div align="center" class="STYLE1">新密码：
              <br/>
            </div></td>
            <td height="20" bgcolor="#FFFFFF"><div align="center" class="STYLE1">
             <div align="left">&nbsp;&nbsp;&nbsp;&nbsp;
               <input type="text"  name="textfield2"  class="calinput"/>
             </div>
            </div></td>
          </tr>
          <tr>
            <td height="25" bgcolor="#FFFFFF"><div align="center" class="STYLE1">确认密码：
              <br/>
            </div></td>
            <td height="20" bgcolor="#FFFFFF"><div align="center" class="STYLE1">
              <div align="left">&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="text"  name="textfield3"  class="calinput"/>
              </div>
            </div></td>
          </tr>
          
        </table></td>
        <td width="8" background="images/tab_15.gif">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
   <tr>
    <td height="35" background="images/tab_19.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="32%" height="35">&nbsp;</td>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
        </table></td>
        <td width="60"><table width="55" border="0" cellpadding="0" cellspacing="0" height="34">
                  <tr>
                    <td class="STYLE1"><div align="center"></div></td>
                    <td class="STYLE1"><div align="center"><a href="#">提交</a></div></td>
                  </tr>
                </table></td>
                
                <td width="60"><table width="55" border="0" cellpadding="0" cellspacing="0" height="34">
                  <tr>
                    <td class="STYLE1"><div align="center"></div></td>
                    <td class="STYLE1"><br/></td>
                  </tr>
                </table></td>
        <td width="1%"  height="35">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
</table>
</form>
<br/><br/>
</body>
</html>
