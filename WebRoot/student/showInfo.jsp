<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>StudentInfo</title>
    <style>
    	*{margin:0px;padding:0px;}
    	.info{width:400px;height:300px;border:1px solid #eaeaea;margin:10px auto;}
    	.info .title{display:block;width:100%;heigth:40px;background:#eaeaea;line-height:40px;text-align:center;}
    	.info .content{width:80%;height:260px;margin:0px auto;padding:20px;}
    </style>
  </head>
  
  <body>
    <div class="info">
    	<span class="title">个人信息</span>
    	<div class="content">
    		<table border="0">
    			<tr><td>编&nbsp;号:</td><td>${student.id }</td></tr>
    			<tr><td>姓&nbsp;名:</td><td>${student.name }</td></tr>
    			<tr><td>性&nbsp;别:</td><td>${student.sex }</td></tr>
    			<tr><td>班&nbsp;级:</td><td>${student.clas }</td></tr>
    			<tr><td>生源地:</td><td>${student.location }</td></tr>
    			<tr><td>年&nbsp;级:</td><td>${student.grade }</td></tr>
    		</table>
    		<input type="button" onclick="window.close()" style="width:80px;height:30px;border:0px;margin:10 0 0 20" value="关闭窗口"/>
    	</div>
    </div>
  </body>
</html>
