<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>help</title>
	<style type="text/css">
		*{margin:0px;height:0px;}
		.help{width:400px;height:400px;border:1px solid #eaeaea;margin:40px auto;padding:10px;}
		.help .content{width:100%;height:50%;}
		.help .back{text-align:center;line-height:40px;}
		.help .back a{width:100px;height:40px;display:block;background-color:#eaeaea;margin:30px auto;text-decoration:none;color:#000;
			font-size:14px;
		}
	</style>
  </head>
  
  <body>
  	<div class="help">
	    <div class="content">
	    	1)考生登录需要准考生、姓名、密码验证。<br/><br/>
	    	2)考生点击随机分配试卷开始本次考试,考卷按照系统随机分配。<br/><br/>
	    	3)请大家避免作弊情况发生。<br/><br/>
	    	4)考试系统管理人员可以对试卷进行修改。考生不得对试卷做任何修改。<br/><br/>
	    </div>
	    <div class="back">
	    	<a href="welcome_stu.jsp">跑去答题</a> <a href="welcome_stu.jsp">返回主页</a>
	    </div>
    </div>
  </body>
</html>
