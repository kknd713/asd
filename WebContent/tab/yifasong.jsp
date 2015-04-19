<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>已发送</title>



<script type="text/javascript" src="../js/jquery-1.5.1.min.js" ></script>
<script type="text/javascript">
<!--彻底删除-->
function deleteMail(){
 	document.getElementById("my").action ="thoroughDeleteS";
	document.forms[0].submit(); 
	}
function allmark1(){
 	document.getElementById("my").action ="badgeAlready";
	document.forms[0].submit(); 
}
</script>

<script type="text/jscript">
  $(document).ready(function(){
     $("input[name='love']").live("click",function(){
	    if($("input[name='love']").attr("checked")==true){ 
	    $("input[name='love1']").attr("checked",true)
	  }else{
	    $("input[name='love1']").attr("checked",false )
	  }
		  })

    <!--全部标记为已读-->
		$("input[name='allmark']").live("click",function(){	  
		 $("img[name='biao']").attr("src","../images/已读.gif")
		  })	
		  
		  
  <!--删除邮件(移动邮件到已删除邮箱)-->  
		$('#delete1').click(function(){
	            $("input[name='love1']").each(function(){
	        	   if($(this).attr('checked')!=true){
	        		   $(this).closest('tr').remove();
	        	   }	        	   
	             })        
		 })        
   }) 
   
  
		  

</script>

</head>



<body id="read">


<div style="overflow:scroll;height:500px;">
<form id="my" name="my" action="deleteMail" method="post">
                    <p style="font-size:14px">
                    已发送:(共<span><s:property value="mailInfo.messageCount"/></span>封) 
                    </p>
                     <span>
                      <input  type="submit" id="delete1" name="delete1" value="删除"  />
                      </span>
                      <span>
                        <input type="button" id="delete2" value="彻底删除" onclick="deleteMail()"/>
                        </span>


                        <span style="margin-left:30%">
                         1/1页
                         <a href="">首页</a>
                         <a href="">上一页</a>
                         <a href="">下一页</a>
                         <a href="">末页</a>
                        </span>                                           
                    </p>
                <table width="100%" border="1" cellspacing="0" cellpadding="0">               
				<tr>
                   <td align="left" colspan="2"       border ="0" width="5%"><input type="checkbox" name="love" value="new" /></td>
                   <td align="center" colspan="2"     border ="0" width="40%">发件人</td>
                   <td align="center" colspan="2"     border ="0" width="40%"><nobr>主题</nobr></td>
                   <td align="center" colspan="2"     border ="0" width="10%">时间</td>
                   <td></td>
			   </tr>
			   <s:iterator var="mail" value="mailInfo.mailBeanList" status="status">
				<tr >
                   <td align="left" colspan="2"     border ="0" width="5%"><input type="checkbox" name="love1" value="new" /></td>
                   <td align="left" colspan="2"     border ="0" width="40%"><s:property value="#mail.from" /></td>
                   <td align="left" colspan="2"     border ="0" width="40%"><nobr><s:property value="#mail.subject"/></nobr></td>
                   <td align="center" colspan="2"   border ="0" width="10%"><s:date name="#mail.date" format="yyyy-MM-dd"/></td>			   
			       <!-- 获取邮件UID -->
			       <td><input type="hidden" name="messageUID" value='<s:property value='#mail.messageUID' />'/></td> 
			   </tr>
               </s:iterator>
                          
		</table>
			
</form>
</div>
</body>
</html>
