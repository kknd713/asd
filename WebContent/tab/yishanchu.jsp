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
<title>收信箱</title>
<script type="text/javascript" src="<%=basePath %>js/jquery-1.5.1.min.js" ></script>
<style type="text/css">
#YSS{ cursor:pointer;}
</style>

<script type="text/javascript">
<!--彻底删除-->
function deleteMail(){
	$(":checkbox[name='messageUID']").each(function(){
		if(this.checked){
			document.getElementById("my").action ="thoroughDeleteY";
			document.forms[0].submit(); 
	}
	})
}
	
<!--标记为已读-->	
function allmark1(){
	$(":checkbox[name='messageUID']").each(function(){
		if(this.checked){
	document.getElementById("my").action ="badgeAlreadyY";
	document.forms[0].submit();
	}
	})
}
</script>



<script type="text/jscript">
$(document).ready(function(){
    $("input[name='love1']").live("click",function(){
	    if($("input[name='love1']").attr("checked")==true){ 
	    $("input[name='messageUID']").attr("checked",true)
	  }else{
	    $("input[name='messageUID']").attr("checked",false )
	  }
		  })
		  
	//设置鼠标移动效果	  
	$("tr[id='YSS']").live("mouseover",function(){
	        this.style.background="#CCC";
	      })
   $("tr[id='YSS']").live("mouseout",function(){
           this.style.background="none";
	     })	  
	     
		 $("td[id='RM']").live("click", function(){
			var e=$(this);
	 		var ip=e.find('input')	 		
		    var messageuid=ip.val()
		    $("input[id='message']").val(messageuid)
		    document.forms[1].submit();
	})     
	     
	     
		 
  }) 
   
</script>

</head>
<body id="read">
<form id="my" name="my" action="" method="post">
                    <p style="font-size:14px">
                    已删除:(共<span><s:property value="mailInfo.messageCount"/></span>封，其中:未读邮件&nbsp;<span><s:property value="mailInfo.unreadMessageCount"/></span>封) 
                    </p>                   
                      <span>
                        <input type="button" id="delete2" value="彻底删除" onclick="deleteMail()"/>
                        </span>
                      
                      <span>
                       <input type="button" id="allmark" value="标记为已读" onclick="allmark1()"/>
                        </span>

                         <span style="margin-left:30%">
                        <s:property value="index"/>/<s:property value="totalPageCount"/>页                    
                         <s:if test="index>1"> 
                         <a href="deletedEmail.action?index=1">首页</a>
                        </s:if>                     
                        <s:else>
                        <font color='#666666'>首页</font>
                        </s:else>
                        <s:if test="index>1"> 
                         <a href="deletedEmail.action?index=<s:property value='index-1'/>">上一页</a>
                        </s:if>                     
                        <s:else>
                        <font color='#666666'>上一页</font>
                        </s:else>
                        <s:if test="index<totalPageCount">
                         <a href="deletedEmail.action?index=<s:property value='index+1'/>">下一页</a>
                        </s:if>
                        <s:else>
                        <font color='#666666'>下一页</font>
                        </s:else>
                        <s:if test="totalPageCount > 0 && index != totalPageCount">                      
                         <a href="deletedEmail.action?index=<s:property value='totalPageCount'/>">末页</a> 
                        </s:if>
                        <s:else>
                        <font color='#666666'>末页</font>
                        </s:else>                   
                        </span>                                          
                    </p>
                <table width="100%" border="1" cellspacing="0" cellpadding="0">               
				<tr>
                   <td align="center" colspan="2"       border ="0" width="5%"><input type="checkbox" name="love1" value="new" /></td>
                   <td align="center" colspan="2"     border ="0" width="5%"><img  width="50%"src="<%=basePath %>images/youjian.gif"/></td>
                   <td align="center" colspan="2"     border ="0" width="40%">发件人</td>
                   <td align="center" colspan="2"     border ="0" width="40%"><nobr>主题</nobr></td>
                   <td align="center" colspan="2"     border ="0" width="10%">时间</td>
                   
			   </tr>
			   </table>
			   <table width="100%" border="0" cellspacing="0" cellpadding="0" > 
		       <s:iterator var="mail" value="mailInfo.mailBeanList" status="status">
				<tr id="YSS">                   
                   <td align="center" colspan="2"     border ="0" width="5%"><input type="checkbox" name="messageUID" value='<s:property value='#mail.messageUID' />' /></td>
                   <s:if test="#mail.read==false">
                   <td align="center" colspan="2"   border ="0" width="5%"><img  name="biao" width="30%"src="<%=basePath %>images/weidu.gif"/></td>
                   </s:if>                 
                    <s:else>
                    <td align="center" colspan="2"   border ="0" width="5%"><img  name="biao" width="30%" src="<%=basePath %>images/yidu.gif"/></td>
                    </s:else>
                   <td  id="RM"  align="left" colspan="2"     border ="0" width="40%">&nbsp;&nbsp;&nbsp;<s:property value="#mail.from" /><input type="hidden" value='<s:property value='#mail.messageUID' />' /></td>
                   <td  id="RM"  align="left" colspan="2"     border ="0" width="40%">&nbsp;&nbsp;&nbsp;<s:property value="#mail.subject"/><input type="hidden" value='<s:property value='#mail.messageUID' />' /></td>
                   <td  id="RM"   align="center" colspan="2"   border ="0" width="10%"><s:date name="#mail.date" format="yyyy-MM-dd"/><input type="hidden" value='<s:property value='#mail.messageUID' />' /></td>			   
			   </tr>
               </s:iterator>
                          
		</table>
			
</form>

<form action="getmailBeanY" method="post">
<input type="hidden" id="message" name="messageUID" value="" />
</form>

</body>
</html>
