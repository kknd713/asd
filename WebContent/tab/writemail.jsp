﻿<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>写信</title>




<link type="text/css" rel="stylesheet" href="../js/ext-3.3.1/resources/css/ext-all.css"/>
<script type="text/jscript" src="../js/ext-3.3.1/adapter/ext/ext-base.js"></script>
<script type="text/javascript" src="../js/ext-3.3.1/ext-all.js"></script>
<script type="text/javascript" src="../js/jquery-1.5.1.min.js"></script>
<script type="text/javascript" src="../js/ajaxfileupload.js"></script>


<style type="text/css">
.body1{ width:auto; height:auto;}
.shousuo{ width:160px;height:20px; margin:0; padding:0;}
input1{ width:160px;height:20px; margin:0; padding:0;}
.userlist{width:160px;height:300px; margin:0; padding:0;overflow:scroll;}
li{ text-align:center; cursor:pointer;}
ol{list-style-type:none; margin:0; padding:0;}
#hello{ float:right; margin:2px; padding-right:20px; padding-bottom:20px}
#xie{ float:left; margin:2px; padding:4px; width:80%}


a{text-decoration:none; }
a:hover { text-decoration:underline}
#content1{width:70%; height:80%; overflow:scroll;resize: none;};
td{ margin:0; padding:0}
#title1{width:70%;heigh:25px}
#title2{width:70%;heigh:25px}
#title3{width:70%;heigh:25px}
#title4{width:70%;heigh:25px}
#title6{width:70%;heigh:25px}
tr{ margin-bottom:4px;}
</style>



<script type="text/jscript">
<!--上传附件-->
function ajaxFileUpload(){
	 $("#loading").ajaxStart(function(){ $(this).show(); });//开始上传文件时显示一个图片
	 $("#loading").ajaxComplete(function(){$(this).hide();});//文件上传完成将图片隐藏起来 
	 $.ajaxFileUpload({
	 url:'EmailUploadAction.action',//用于文件上传的服务器端请求地址 
	 secureuri:false,//一般设置为false 
     fileElementId:'file',//文件上传空间的id属性 <input type="file" id="file" name="file" /> 
	 dataType: 'json',//返回值类型 一般设置为json 
	 success: function (data, status)  //服务器成功响应处理函数
		{
	   alert(data.message);//从服务器返回的json中取出message中的数据,其中message为在struts2中定义的成员变量
	   $("#loading")
			if(typeof(data.error) != 'undefined')
			{
				if(data.error != '')
				{
					alert(data.error);
				}else
				{	
					alert(data.message);
				}
			}
	     //隐藏添加按钮
	     $("td[name='upload']").hide();
	     $("#main").html(data.fileFileName);
	     $("input[name='upload']").attr("value",data.fileFileName)
		},
		error: function (data, status, e)//服务器响应失败处理函数
		{
           alert(e);
		}
	    })
         return false;
}





$(document).ready(function(){
	   $("input[name='upload']").hide();
		<!--添加抄送功能--!>
		$("tr[id='caosong']").hide();
		$("tr[id='tianjia']").hide();
		$("tr[id='fenbie']").hide();
	 $("input[id='caosong']").live("click",function(){
		 if($("input[id='caosong']").attr("value")=="抄送"){
		  $("input[id='caosong']").attr("value", "取消抄送")
          $("tr[id='caosong']").show();
		 }else{
		  $("input[id='caosong']").attr("value", "抄送")
          $("tr[id='caosong']").hide();			 
			 }		  
	 })
	  <!--添加密送--!>
	 $("input[id='tianjia']").live("click",function(){
		 if($("input[id='tianjia']").attr("value")=="添加密送"){
		  $("input[id='tianjia']").attr("value", "取消添加密送")
          $("tr[id='tianjia']").show();
		 }else{
		  $("input[id='tianjia']").attr("value", "添加密送")
          $("tr[id='tianjia']").hide();			 
			 }		  
	 })

	 <!--设置用户列表--!> 
       $("li").live("mouseover",function(){
	        this.style.background="#CCC";
	      })
       $("li").live("mouseout",function(){
            this.style.background="none";
	     })
	     
        $("li[id='username']").live("click",function(){
			 var io =this.title;
		   $("input[id='title1']").attr("value",io);
			})
   })
					
<!--实现发送功能--!>	
function sendemail(){
		var recipients=document.getElementById("title1").value;
		if(recipients == null||recipients=="" ){			
			alert("收件人不能为空！");
			return false;
		}else{
			return true;
		}
}



Ext.onReady(function(){
var dateBirthday=new Ext.form.DateField({
	    DateLabel:"日期",
		name:"dateBirthday",
		editable:false,
		width:100,
		format:"Y-m-d",
		value:new Date(),
	});
var timeWork=new Ext.form.TimeField({
	    TimeLabel:"时间",
		name:"timeWork",
		editable:false,
		width:100,
		fieldLabel:"定时发送",
		increment:01,
		format:"H:i"	
	});
	
var win=new Ext.Window({
	   
	    layout:'table',
		layoutConfig: {columns:4},
		title:"定时发送(请选择日期及时间)",
		resizable:false,
		width:236,
		modal:true,
		height:88,
		items:[dateBirthday,{html:" ",width:20},timeWork],		
		submit:[{text:"确定"}]
		})	
		
$("input[id='save2']").live("click",function(){
	    var recipients=document.getElementById("title1").value;
		if(recipients == null||recipients=="" ){
			alert("收件人不能为空！");
		}else{
			 win.show();
		}
	
	})
	
})
    <!--存草稿--!>
	function savedraft(){
	   var recipients=document.getElementById("title1").value
	   if(recipients == null||recipients=="" ){
		  alert("收件人没有写,不能存为草稿！");
	   }else{
	   document.getElementById("myForm").action="savedraft";
	   document.forms[0].submit();
	   }
      }		
</script>
</head>

<body>

<div id="xie" style="overflow:scroll;height:500px;">

<form id="myForm" name="myForm" action="writemail" method="post" enctype="multipart/form-data">      

		<div class="pages">
			<table width="90%" border="0" cellspacing="0" cellpadding="0">
				<tr id="shoujian">
				  <td  width="5%" height="33" align="right" name="biao">收件人：</td>
                  <td align="left" colspan="2" name="bao"><input type="text" name="mailBean.to" id="title1"/></td>    
                </tr>   
                <tr id="caosong">
                    <td align="right"  width="5%" name="biao">抄送人：</td>
                    <td align="left" colspan="2" name="bao"><input type="text" name="mailBean.cc" id="title2"/> </td>
                </tr>
                <tr id="tianjia">
                    <td  width="5%" height="31" align="right" name="biao">添加密送：</td>
                    <td align="left" colspan="2" name="bao"><input type="text" name="mailBean.bcc" id="title3"/></td>
                </tr>               				
                <tr>
                    <td align="left" colspan="2" style=" padding-left:16%">
                       <span><input type="button"  id="caosong" name="caosong" value="抄送"  /></span>
                       <span><input type="button"  id="tianjia"  name="tianjia"  value="添加密送"  /></span>                                    
                    </td>
				</tr>                
				<tr>
					<td width="8%" height="29" align="right">主题：</td>
                  <td align="left" colspan="2"><input type="text" name="mailBean.subject" id="title6"/></td>
				</tr>
				
                <tr>
					<td align="right" width="15%">添加附件：</td>
                    <td align="right" colspan="2" style="float:left"  name="upload">                                	
                    	<input type="file" name="file" id="file" /> 
                    	<input type="text" name="upload"/>                   	                    	
                    	<img src="../images/loading.gif" height="30px" width="30px" id="loading" style="display: none;"> 
                    	<input type="button"  value="上传" onclick="return ajaxFileUpload();" />                 	
                    </td>
                    <!-- 添加成功,显示文件 -->
                    <td align="right" colspan="2" style="float:left"><font id="main" color="#000000"></font></td>
			   </tr>

			   <tr>
			        <td align="right" width="10%"></td>
			        <td align="right" colspan="2" style="float:left" >
			            <font id="main"></font>  
			            <s:property value="fileFileName"/>
			        </td>			   	
			   </tr>			                      		   
				<tr >
					<td align="right" style=" float:right; padding-top:30px">正文：</td>
                    <td align="left" colspan="2"><textarea cols="60" rows="20" name="mailBean.content" id="content1"></textarea></td>
				</tr>
				<tr>
					<td align="left" colspan="2" style=" padding-left:16%"> 
                        <span><input type="submit"  id="save1" value="发送" onclick="return sendemail();" /></span>
                        <span><input type="button"  id="save2" value="定时发送"   /></span>
                        <span><input type="button"  id="save3" value="存草稿" onclick="savedraft()"/></span>               
				    </td>
                </tr>
                <tr>
  
                </tr>
                
                
			</table>         			
		</div>
 </form>  
 </div>    
 

<div id="hello">
<fieldset>
  <div class="userlist">
    <ol>
      <br/>
      <s:iterator var="users1" value="#session.user.relational" status="status">
      <li id="username"  title="<s:property value="friend.username" />@cdjj.com"><s:property value="friend.zsname" /></li>
      </s:iterator>
    </ol>
  </div>
</fieldset>  
  </div>
</body>
</html>
