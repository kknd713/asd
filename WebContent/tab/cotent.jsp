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
<title>邮件内容</title>
<script type="text/javascript" charset="utf-8" src="<%=basePath %>js/BD/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=basePath %>js/BD/ueditor.all.min.js"> </script>
<script type="text/javascript" charset="utf-8" src="<%=basePath %>js/BD/lang/zh-cn/zh-cn.js"></script>


<script type="text/javascript" src="<%=basePath %>js/jquery-1.5.1.min.js" ></script>


<script type="text/jscript">
$(document).ready(function(){
	$("input[id='ZF']").live("click",function(){
    if($("input[id='mailflag']").val()==1){
    	document.getElementById("my").action ="<%=basePath %>transmitMailR.action";
		document.forms[0].submit();
	}else if($("input[id='mailflag']").val()==2){
		document.getElementById("my").action ="<%=basePath %>transmitMailD";
		document.forms[0].submit();
	}else if($("input[id='mailflag']").val()==3){
		document.getElementById("my").action ="<%=basePath %>transmitMailS";
		document.forms[0].submit();
	}else if($("input[id='mailflag']").val()==4){
		document.getElementById("my").action ="<%=basePath %>transmitMailY";
		document.forms[0].submit();
	}else{	
		document.getElementById("my").action ="<%=basePath %>transmitMailL";
		document.forms[0].submit();
	} 
	});
	
	//转义邮件字符
	var i=UE.utils.html($("#content").html())
	$("#content").html(i)


})
</script>

</head>

<body>
<fieldset>
    <form id="my" action="" method="post">
      <div>    
          <input type="hidden" id="mailflag" value="<s:property value='mailBean.folderType' />"/>
          <table width="90%" border="0" cellspacing="0" cellpadding="0">
                <input type="hidden" name="messageUID" value='<s:property value='mailBean.messageUID' />' />
                <tr>
				  <td width="10%" height="33" align="right" name="biao"> <input type="button"  id="ZF" value="转发"/></td>
                </tr> 
				<tr>
				  <td width="10%" height="33" align="right" name="biao">发件人:</td>
                  <td align="left" colspan="2" name="bao"><font color="#FF0000"><s:property value="mailBean.from"/></font></td>    
                </tr>   
                <tr>
                    <td align="right" >时间:</td> 
                    <td align="left" colspan="2" name="bao"><font color="#FF0000"><s:date name="mailBean.date" format="yyyy-MM-dd HH:mm:ss"/></font></td>
                </tr>
                <tr>
                    <td align="right" >主题:</td> 
                    <td align="left" colspan="2" name="bao"><font color="#FF0000"><s:property value="mailBean.subject" /></font></td>
                </tr>
                <tr>
                    <td height="31" align="right" >收件人:</td>  
                    <td align="left" colspan="2" name="bao"><font color="#FF0000"><s:property value="mailBean.to"/></font></td>
                </tr>              
                <tr>
                    <td height="31" align="right" >附件:</td>  
                    <td align="left" colspan="2" name="bao">
                    <s:if test="mailBean.file==null">
                      <font color="#FF0000">无附件</font>
                    </s:if>
                    <s:elseif test="mailBean.folderType==4">
                      <font color="#FF0000"><s:property value="mailBean.file"/></font>
                    </s:elseif>                   
                    <s:else>
                    <font color="#FF0000"><a href="<%=basePath %>DownLoadAction.action?file=${mailBean.file}">${mailBean.file}</a></font>
                    </s:else>
                    </td>
                </tr> 				
			</table> 					
</div>  
<div style="padding-left:80px; padding-right:80px;" id="content">
<s:property value="mailBean.content"/>
</div>
</form>
</fieldset>
</body>
</html>
