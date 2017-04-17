<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>TeacherPasswordModify</title>
    <style>
    	*{margin:0px;padding:0px;}
    	.modify{width:350px;height:200px;border:1px solid #eaeaea;margin:20px auto;}
    	.modify .title{display:block;width:350px;height:30px;background:#eaeaea;line-height:30px;text-align:center;}
    	.modify .form{width:100%;height:170px;padding:10px;}
    </style>
  </head>
  
  <body>
  	<div class="modify">
  		<font class="title">修改密码</font>
  		<div class="form">
  			<form action="" method="post">
  				<table border="0">
  					<tr>
  						<td>编 &nbsp;&nbsp; 号:</td>
  						<td><input type="text" name="id" value="${id }" id="id" /></td>
  					</tr>
  					<tr>
  						<td>姓 &nbsp;&nbsp; 名:</td>
  						<td><input type="text" name="name" value="${name }" id="name" /></td>
  					</tr>
  					<tr>
  						<td>旧&nbsp;密&nbsp;码:</td>
  						<td><input type="password" name="password1" id="password1" /></td>
  					</tr>
  					<tr>
  						<td>新&nbsp;密&nbsp;码:</td>
  						<td><input type="password" name="password2" id="password2" /></td>
  					</tr>
  					<tr>
  						<td>确认新密码:</td>
  						<td><input type="password" name="password3" id="password3" /></td>
  					</tr>  					
  				</table>
  				<input type="reset" value="重置" style="width:50px;height:30px;margin:20 0 0 80;border:0px;cursor:pointer;" />
  				<input type="button" value="修改密码" style="width:100px;height:30px;border:0px;cursor:pointer;" onclick="modify()"/>
  			</form>
  		</div>
  	</div>
  	
  	<script>
  		var xmlHttp;
  		function modify(){
  			var id = document.getElementById("id").value;
  			var name = document.getElementById("name").value;
  			var password1 = document.getElementById("password1");
  			if(password1.value.length==0){
  				alert("请输入旧密码");
  				password1.focus();
  				return false;
  			}
  			var password2 = document.getElementById("password2");
  			if(password2.value.length==0){
  				alert("请输入新密码");
  				password2.focus();
  				return false;
  			}
  			var password3 = document.getElementById("password3");
  			if(password2.value != password3.value){
  				alert("确认密码不正确");
  				return false;
  			}
  			if(window.XMLHttpRequest){
    			xmlHttp = new XMLHttpRequest();
    		}else if(window.ActiveXObject){
    			xmlHttp = new ActiveXObject("Microsoft.XMLHttp");
    		}
    		xmlHttp.open("post","TeacherModifyPasswordAction.action",true);
	   		xmlHttp.onreadystatechange = callback;
	   		xmlHttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	   		xmlHttp.send("id="+id+"&name="+name+"&password1="+password1.value+"&password2="+password2.value);
  		}
  		function callback(){
    		if(xmlHttp.readyState == 4){
    			if(xmlHttp.status == 200){
    				var text = xmlHttp.responseText;
    				if(text=="no"){
    					alert("旧密码不正确");
    				}else if(text=="yes"){
    					alert("密码修改成功");
    					window.close();
    				}
    			}
    		}
    	}
  	</script>
  </body>
</html>
