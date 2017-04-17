<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Welcome</title>
	<style type="text/css">
		*{margin:0px;padding:0px;}
		.welcome{width:600px;height:300px;border:1px solid #eaeaea;margin:60px auto;}
		.welcome .title{display:block;width:100%;height:30px;background:#eaeaea;text-align:center;line-height:30px;}
		.welcome .menu2{height:80px;margin-top:30px;}
		.welcome .menu2 ul li{list-style:none;float:left;display:block;background:#eaeaea;margin:30px 0 0 60px;}
		.welcome .menu2 ul li a{font-size:14px;text-decoration:none;color:#000;display:block;width:100px;height:30px;
			text-align:center;line-height:30px;}
		.welcome .menu1{width:80px;float:right;display:none;}
		.welcome .menu1 ul li{display:block;list-style:none;background:#eaeaea;height:30px;width:80px;
			text-align:center;line-height:30px;}
		.welcome .menu1 ul li a{text-decoration:none;display:block;color:#000;}
		.welcome .menu1 ul li a:hover{background:#737373;}
		.welcome .examInfo{width:400px;height:100px;border:1px solid #eaeaea;margin:10px auto;padding:10px;}
	</style>
  </head>
  
  <body onload="getAllCourseNames()">
    <div class="welcome">
    	<span class="title">Welcome to Online-Examination System
    	<a href="javascript:void(0)" onclick="window.open('StudentShowInfoAction.action','修改密码','width=600,height=400,left=360,top=100')" style="color:#000;text-decoration:none;float:right;" onmouseover="showMenu1()" onmouseout="hideMenu1()">【${name}】</a></span>
    	<div id="menu1" class="menu1" onmouseover="showMenu1()" onmouseout="hideMenu1()">
    		<ul>
    			<li><a href="javascript:void(0)"
    				onclick="window.open('student/passwordModify.jsp','修改密码','width=400,height=300,left=500,top=150')">修改密码</a></li>
    			<li><a href="StudentLogoutAction.action">退出登录</a></li>
    		</ul>
    	</div>
    	<div class="examInfo">
    		<form action="">
    			请选择考试科目:
    			<select id="courses" name="courseName" onchange="getAllTeachers()">
    				<!--
    					<option value="java">java</option>
    					<option value="c++">c++</option>
    				 -->
    			</select><br><br>
    			请选择任课教师:
    			<select id="teachers" name="teacherName">
    				<!--
    					<option value="wu">吴老师</option>
    					<option value="ma">马老师</option>
    				 -->
    			</select><br><br>
    			<input onclick="showGoExam()" type="button" value="选择确定" style="width:60px;height:25px;margin-left:250px;border:0px;cursor:pointer">
    		</form>
    	</div>
    	<div id="menu2" class="menu2">
    		<ul>
    			<li><a href="help.jsp">查看帮助文档</a></li>
    			<li><a href="javascript:void(0)" onclick="window.open('StudentShowScoreAction.action')">查看自己成绩</a></li>
    			<li id="goExam" style="display:none;"><a href="QuestionMainAction.action">随机分发试卷</a></li>
    		</ul>
    	</div>
    </div>
    <script>
    	function showMenu1(){
    		var menu1 = document.getElementById("menu1");
    		menu1.style.display="block";
    	}
    	function hideMenu1(){
    		var menu1 = document.getElementById("menu1");
    		menu1.style.display="none";
    	}
    	var xmlHttp;
    	function showGoExam(){
    		var goExam = document.getElementById("goExam");
    		var courseName = document.getElementById("courses").value;
    		var teacherName = document.getElementById("teachers").value;
    		if(teacherName==""){
    			alert("该课程未分配老师,无法进行考试");
    			goExam.style.display="none";
    			return false;
    		}
    		if(window.XMLHttpRequest){
    			xmlHttp = new XMLHttpRequest();
    		}else if(window.ActiveXObject){
    			xmlHttp = new ActiveXObject("Microsoft.XMLHttp");
    		}
    		xmlHttp.open("post","PaperSetCouAndTeaAction.action",true);
	   		xmlHttp.onreadystatechange = callback;
	   		xmlHttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	   		xmlHttp.send("courseName="+courseName+"&teacherName="+teacherName);
    		var goExam = document.getElementById("goExam");
    		goExam.style.display="block";
    	}
    	function callback(){
    		if(xmlHttp.readyState == 4){
    			if(xmlHttp.status == 200){
    				var text = xmlHttp.responseText;
    			}
    		}
    	}
    	function callback_names(){
    		if(xmlHttp.readyState == 4){
    			if(xmlHttp.status == 200){
    				var text = xmlHttp.responseText;
    				var names = text.trim().split(' ');
    				var courses = document.getElementById("courses");
    				for(var i = 0;i<names.length;i++){
						courses.options[i] = new Option(names[i]);
					}
    				getAllTeachers();
    			}
    		}
    	}
    	function callback_teachers(){
    		if(xmlHttp.readyState == 4){
    			if(xmlHttp.status == 200){
    				var text = xmlHttp.responseText;
    				var teacherNames = text.trim().split(' ');
    				var teachers = document.getElementById("teachers");
    				teachers.options.length=0;
    				for(var i = 0;i<teacherNames.length;i++){
    					teachers.options[i] = new Option(teacherNames[i]);
					}
    			}
    		}
    	}
    	function getAllCourseNames(){
    		if(window.XMLHttpRequest){
    			xmlHttp = new XMLHttpRequest();
    		}else if(window.ActiveXObject){
    			xmlHttp = new ActiveXObject("Microsoft.XMLHttp");
    		}
    		xmlHttp.open("get","CourseGetAllNamesAction.action",true);
	   		xmlHttp.onreadystatechange = callback_names;
	   		xmlHttp.send(null);
    	}
    	function getAllTeachers(){
    		if(window.XMLHttpRequest){
    			xmlHttp = new XMLHttpRequest();
    		}else if(window.ActiveXObject){
    			xmlHttp = new ActiveXObject("Microsoft.XMLHttp");
    		}
    		var courses = document.getElementById("courses").options;
    		var courseName="";
    		for(var i = 0;i<courses.length;i++){
    			if(courses[i].selected){
    				courseName = courses[i].value;
    			}
    		}
    		xmlHttp.open("post","CourseGetAllTeachersAction.action",true);
	   		xmlHttp.onreadystatechange = callback_teachers;
	   		xmlHttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	   		xmlHttp.send("courseName="+courseName);
    	}
    </script>
  </body>
</html>
