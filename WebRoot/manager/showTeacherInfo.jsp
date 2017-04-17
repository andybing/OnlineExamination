<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>showStudentInfo page</title>
    <style>
    	*{margin:0px;padding:0px;}
    	.show{width:400px;height:300px;border:1px solid #eaeaea;margin:20px auto;}
    	.show .title{width:100%;height:30px;background:#eaeaea;text-align:center;line-height:30px;}
    	.show .content{width:80%;height:200px;margin:20px auto;}
    </style>
  </head>
  
  <body>
    <div class="show">
    	<div class="title">教师信息查询</div>
    	<div class="content">
    		姓名:<input type="text" value="${teacher.name }" id="name"/><br><br>
    		性别:<input type="text" value="${teacher.sex }" id="sex"/><br><br>
    		地址:<input type="text" value="${teacher.location }" id="location"/><br><br>
    		<input type="button" value="关闭" onclick="window.close()" style="width:50px;height:30px;border:0px;margin-left:30px;"/>
    		<input type="button" value="修改" onclick="update()" style="width:50px;height:30px;border:0px;"/>
    	</div>
    </div>
    
    <script>
    	var xmlHttp;
    	function update(){
    		var name = document.getElementById("name");
    		if(name.value.length==0){
  				alert("姓名不能为空!");
  				name.focus();
  				return false;
  			}
    		var sex = document.getElementById("sex");
    		if(sex.value.length==0){
  				alert("性别不能为空!");
  				sex.focus();
  				return false;
    		}
    		var location = document.getElementById("location");
    		if(location.value.length==0){
  				alert("地址不能为空!");
  				location.focus();
  				return false;
  			}
    		if(window.XMLHttpRequest){
	   			xmlHttp = new XMLHttpRequest();
	   		}else if(window.ActiveXObject){
	   			xmlHttp = new ActiveXObject("Microsoft.XMLHttp");
	   		}
	   		xmlHttp.open("post","TeacherUpdateAction.action",true);
	   		xmlHttp.onreadystatechange = callback;
	   		xmlHttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	   		xmlHttp.send("name="+name.value+"&sex="+sex.value+"&location="+location.value);
    	}
    	function callback(){
    		if(xmlHttp.readyState == 4){
    			if(xmlHttp.status == 200){
    				var text = xmlHttp.responseText;
    				if(text == "yes"){
    					alert("教师信息修改成功");
    					window.close();
    				}else if(text == "no"){
    					alert("教师修改失败");
    				}
    			}
    		}
    	}    	
    </script>
  </body>
</html>
