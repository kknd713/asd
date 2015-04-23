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
<title>垃圾箱</title>

<style type="text/css">
#RM{ cursor:pointer;}
</style>

<script type="text/javascript" src="<%=basePath %>js/jquery-1.5.1.min.js" ></script>
<script type="text/javascript">
<!--彻底删除-->
function deleteMail(){
	$(":checkbox[name='messageUID']").each(function(){
		if(this.checked){
 	document.getElementById("my").action ="thoroughDeleteR";
	document.forms[0].submit(); 
		}
	})
	}
	
<!--标记为已读-->
function allmark1(){
	$(":checkbox[name='messageUID']").each(function(){
		if(this.checked){
 	document.getElementById("my").action ="badgeAlreadyL";
	document.forms[0].submit(); 
		}
	})
	}
<!--移动邮件到收件箱-->
function moveEmail(){
	$(":checkbox[name='messageUID']").each(function(){
		if(this.checked){
		document.getElementById("my").action ="moveMailR";
		document.forms[0].submit(); 
		}
	})
	}
	
	

</script>
<!--表格样式 --> 
<script type="text/jscript">
  $(document).ready(function(){
     $("input[name='love']").live("click",function(){
	    if($("input[name='love']").attr("checked")==true){ 
	    $("input[name='messageUID']").attr("checked",true)
	  }else{
	    $("input[name='messageUID']").attr("checked",false )
	  }
		  })
	$("tr[id='RM']").live("mouseover",function(){
	        this.style.background="#CCC";
	      })
    $("tr[id='RM']").live("mouseout",function(){
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
<div style="overflow:scroll;height:500px;">
<form id="my" name="myForm" action="" method="post">
                    <p style="font-size:14px">
                    垃圾箱:(共<span><s:property value="mailInfo.messageCount"/></span>封)
                    </p>
                    <span>
                        <input type="button" name="delete" value="彻底删除" onclick="deleteMail()"/>
                        </span>
                       <span>
                         <input type="button" name="move" value="这不是垃圾邮件" onclick="moveEmail()"/>
                        </span>
                       <span>
                         <input type="button" name="allmark" value="标记为已读" onclick="allmark1()"/>
                        </span>                      

                         <span style="margin-left:30%">
                        <s:property value="index"/>/
                        <s:if test="totalPageCount==0">1</s:if>
                        <s:else><s:property value="totalPageCount"/></s:else>页     
                                       
                         <s:if test="index>1"> 
                         <a href="rubbishMail.action?index=1">首页</a>
                        </s:if>                     
                        <s:else>
                        <font color='#666666'>首页</font>
                        </s:else>
                        <s:if test="index>1"> 
                         <a href="rubbishMail.action?index=<s:property value='index-1'/>">上一页</a>
                        </s:if>                     
                        <s:else>
                        <font color='#666666'>上一页</font>
                        </s:else>
                        <s:if test="index<totalPageCount">
                         <a href="rubbishMail.action?index=<s:property value='index+1'/>">下一页</a>
                        </s:if>
                        <s:else>
                        <font color='#666666'>下一页</font>
                        </s:else>
                        <s:if test="totalPageCount > 0 && index != totalPageCount">                      
                         <a href="rubbishMail.action?index=<s:property value='totalPageCount'/>">末页</a> 
                        </s:if>
                        <s:else>
                        <font color='#666666'>末页</font>
                        </s:else>                   
                        </span>                                      
                    </p>
                <table width="100%" border="1" cellspacing="0" cellpadding="0">               
				<tr>
                   <td align="center" colspan="2"       border ="0" width="5%"><input type="checkbox" name="love" value="new" /></td>
                   <td align="center" colspan="2"     border ="0" width="5%"><img  width="50%"src="<%=basePath %>images/youjian.gif"/></td>
                   <td align="center" colspan="2"     border ="0" width="40%">发件人</td>
                   <td align="center" colspan="2"     border ="0" width="40%"><nobr>主题</nobr></td>
                   <td align="center" colspan="2"     border ="0" width="10%">时间</td>
			   </tr>
			   </table>
			  <table width="100%" border="0" cellspacing="0" cellpadding="0" > 
			   <s:iterator var="mail" value="mailInfo.mailBeanList" status="status">
				<tr id="RM">                   
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
<form action="getmailBeanL" method="post">
<input type="hidden" id="message" name="messageUID" value="" />
</form>
</div>
</body>
</html>
