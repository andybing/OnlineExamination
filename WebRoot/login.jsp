<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>考生登陆界面</title>
	<style>
		*{padding:0px;margin:0px;}
		.choose{width:400px;height:35px;margin:0px auto;margin-top:100px;}
		.choose ul li{display:block;width:80px;height:35px;background:#ebebeb;float:left;line-height:35px;
			text-align:center;border-radius:10px;cursor:pointer;}
		.student_login{width:400px;height:280px;border:1px solid #eaeaea;margin:0px auto;background:#ebebeb;}
		.student_login .form{margin:30px;}
		.student_login .sub ul li{margin-left:30px;line-height:35px;text-align:center;list-style:none;float:left;}
		.student_login .sub ul li a{display:block;text-decoration:none;color:#000;border-radius:30px;width:120px;height:35px;background:#bcbcbc;}
		.teacher_login{width:400px;height:280px;border:1px solid #eaeaea;margin:0px auto;background:#ebebeb;display:none;}
		.teacher_login .form{margin:30px;}
		.teacher_login .sub ul li{margin-left:120px;line-height:35px;text-align:center;list-style:none;float:left;}
		.teacher_login .sub ul li a{display:block;text-decoration:none;color:#000;width:120px;height:35px;background:#bcbcbc;border-radius:30px;}
		.manager_login{width:400px;height:280px;border:1px solid #eaeaea;margin:0px auto;background:#ebebeb;display:none;}
		.manager_login .form{margin:30px;}
		.manager_login .sub ul li{margin-left:120px;line-height:35px;text-align:center;list-style:none;float:left;}
		.manager_login .sub ul li a{display:block;text-decoration:none;color:#000;width:120px;height:35px;background:#bcbcbc;border-radius:30px;}
	</style>
  </head>
  
  <body>
  	<div class="choose">
  		<ul>
  			<li id="stu" onclick="stu_login()" style="background:#bcbcbc">学生登录</li>
  			<li id="tea" onclick="tea_login()">老师登录</li>
  			<li id="manager" onclick="man_login()">管理员登录</li>
  		</ul>
  	</div>
    <div class="student_login" id="student_login">
    	<div class="form">
    	<form action="" method="post">
    		<table border="0" cellspacing="0" cellpadding="0">
    			<tr><td>学生学号:</td><td><input type="text" name="id" id="id"/></td></tr><tr><td><br></td></tr>
    			<tr><td>姓 &nbsp; 名:</td><td><input type="text" name="name" id="name"/></td></tr><tr><td><br></td></tr>
    			<tr><td>密  &nbsp; 码:</td><td><input type="password" name="password" id="password" /></td></tr><tr><td><br></td></tr>
    			<tr><td>验 证 码:</td><td><input type="text" name="code" id="code" /></td><td><a href="javascript:void(0)" onclick="getCode()"><img src="ImageResponseAction.action" id="code_img"/></a></td></tr>
    		</table>
    	</form>
    	</div>
    	<div class="sub">
    		<ul>
    			<li><a href="javascript:void(0)" onclick="return student_login()">考生登陆</a></li>
    			<li><a href="javascript:void(0)">考生注册</a></li>
    		</ul>
    	</div>
    </div>
    
    <div class="teacher_login" id="teacher_login">
    	<div class="form">
    	<form action="" method="post">
    		<table border="0" cellspacing="0" cellpadding="0">
    			<tr><td>教师编号:</td><td><input type="text" name="tid" id="tid"/></td></tr><tr><td><br></td></tr>
    			<tr><td>姓 &nbsp; 名:</td><td><input type="text" name="tname" id="tname"/></td></tr><tr><td><br></td></tr>
    			<tr><td>密  &nbsp; 码:</td><td><input type="password" name="tpassword" id="tpassword" /></td></tr><tr><td><br></td></tr>
    			<tr><td>验 证 码:</td><td><input type="text" name="tcode" id="tcode" /></td><td><a href="javascript:void(0)" onclick="getCode2()"><img src="ImageResponseAction.action" id="code_img2"/></a></td></tr>
    		</table>
    	</form>
    	</div>
    	<div class="sub">
    		<ul>
    			<li><a href="javascript:void(0)" onclick="return teacher_login()">教师登陆</a></li>
    		</ul>
    	</div>
    </div>
    
     <div class="manager_login" id="manager_login">
    	<div class="form">
    	<form action="" method="post">
    		<table border="0" cellspacing="0" cellpadding="0">
    			<tr><td>管理编号:</td><td><input type="text" name="mid" id="mid"/></td></tr><tr><td><br></td></tr>
    			<tr><td>姓 &nbsp; 名:</td><td><input type="text" name="mname" id="mname"/></td></tr><tr><td><br></td></tr>
    			<tr><td>密  &nbsp; 码:</td><td><input type="password" name="mpassword" id="mpassword" /></td></tr><tr><td><br></td></tr>
    			<tr><td>验 证 码:</td><td><input type="text" name="mcode" id="mcode" /></td><td><a href="javascript:void(0)" onclick="getCode3()"><img src="ImageResponseAction.action" id="code_img3"/></a></td></tr>
    		</table>
    	</form>
    	</div>
    	<div class="sub">
    		<ul>
    			<li><a href="javascript:void(0)" onclick="return manager_login()">管理员登陆</a></li>
    		</ul>
    	</div>
    </div>
    <script>
    	function stu_login(){
    		var stu_login = document.getElementById("stu");
        	var tea_login = document.getElementById("tea");
        	var man_login = document.getElementById("manager");
        	var student_login = document.getElementById("student_login");
        	var teacher_login = document.getElementById("teacher_login");
        	var manager_login = document.getElementById("manager_login");
        	student_login.style.display="block";
        	teacher_login.style.display="none";
        	manager_login.style.display="none";
        	stu_login.style.background="#bcbcbc";
        	tea_login.style.background="#ebebeb";
        	man_login.style.background="#ebebeb";
    	}
    	function tea_login(){
    		var stu_login = document.getElementById("stu");
        	var tea_login = document.getElementById("tea");
        	var man_login = document.getElementById("manager");
        	var student_login = document.getElementById("student_login");
        	var teacher_login = document.getElementById("teacher_login");
        	var manager_login = document.getElementById("manager_login");
        	student_login.style.display="none";
        	teacher_login.style.display="block";
        	manager_login.style.display="none";
        	stu_login.style.background="#ebebeb";
        	tea_login.style.background="#bcbcbc";
        	man_login.style.background="#ebebeb";
    	}
    	function man_login(){
    		var stu_login = document.getElementById("stu");
        	var tea_login = document.getElementById("tea");
        	var man_login = document.getElementById("manager");
        	var student_login = document.getElementById("student_login");
        	var teacher_login = document.getElementById("teacher_login");
        	var manager_login = document.getElementById("manager_login");
        	student_login.style.display="none";
        	teacher_login.style.display="none";
        	manager_login.style.display="block";
        	stu_login.style.background="#ebebeb";
        	tea_login.style.background="#ebebeb";
        	man_login.style.background="#bcbcbc";
    	}
    	var xmlHttp = null;
    	var code = document.getElementById("code");
    	function student_login(){
	   		var id = document.getElementById("id");
	   		if(id.value.length == 0){
				alert("号码不能为空");
				id.value="";
				id.focus();
				return false;
	   		}
	   		var name = document.getElementById("name");
	   		if(name.value.length == 0){
				alert("姓名不能为空");
				name.value="";
				name.focus();
				return false;
	   		}
	   		var password = document.getElementById("password");
	   		if(password.value.length==0){
				alert("密码不能为空");
				password.value="";
				password.focus();
				return false;
	   		}
	   		
	   		if(code.value.length==0){
	   			alert("验证码不能为空");
	   			code.focus();
	   			return false;
	   		}
	   		//window.location.href="StudentLoginAction.action?id="+id.value+"&name="+name.value+"&password="+password.value;
	   		
	   		if(window.XMLHttpRequest){
	   			xmlHttp = new XMLHttpRequest();
	   		}else if(window.ActiveXObject){
	   			xmlHttp = new ActiveXObject("Microsoft.XMLHttp");
	   		}
	   		xmlHttp.open("post","StudentLoginAction.action",true);
	   		xmlHttp.onreadystatechange = callback;
	   		xmlHttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	   		xmlHttp.send("id="+id.value+"&name="+name.value+"&password="+password.value+"&code="+code.value);
    	}
    	function callback(){
    		if(xmlHttp.readyState == 4){
    			if(xmlHttp.status == 200){
    				var text = xmlHttp.responseText;
    				if(text == "yes"){
    					document.location.href="welcome_stu.jsp";
    				}else if(text == "no"){
    					alert("用户名密码不正确");
    				}else if(text == "codeError"){
    					alert("验证码不正确");
    					code.value="";
    					code.focus();
    				}
    			}
    		}
    	}
    	function callback2(){
    		if(xmlHttp.readyState == 4){
    			if(xmlHttp.status == 200){
    				var text = xmlHttp.responseText;
    				if(text == "yes"){
    					document.location.href="welcome_tea.jsp";
    				}else if(text == "no"){
    					alert("用户名密码不正确");
    				}else if(text == "codeError"){
    					alert("验证码不正确");
    					code.value="";
    					code.focus();
    				}
    			}
    		}
    	}
    	function callback3(){
    		if(xmlHttp.readyState == 4){
    			if(xmlHttp.status == 200){
    				var text = xmlHttp.responseText;
    				if(text == "yes"){
    					document.location.href="welcome_manager.jsp";
    				}else if(text == "no"){
    					alert("用户名密码不正确");
    				}else if(text == "codeError"){
    					alert("验证码不正确");
    					code.value="";
    					code.focus();
    				}
    			}
    		}
    	}
    	function getCode(){
			document.getElementById("code_img").src="ImageResponseAction.action?"+Math.random();
        }
    	function getCode2(){
			document.getElementById("code_img2").src="ImageResponseAction.action?"+Math.random();
        }
    	function getCode3(){
			document.getElementById("code_img3").src="ImageResponseAction.action?"+Math.random();
        }
    	
    	function teacher_login(){
	   		var tid = document.getElementById("tid");
	   		if(tid.value.length == 0){
				alert("号码不能为空");
				tid.value="";
				tid.focus();
				return false;
	   		}
	   		var tname = document.getElementById("tname");
	   		if(tname.value.length == 0){
				alert("姓名不能为空");
				tname.value="";
				tname.focus();
				return false;
	   		}
	   		var tpassword = document.getElementById("tpassword");
	   		if(tpassword.value.length==0){
				alert("密码不能为空");
				tpassword.value="";
				tpassword.focus();
				return false;
	   		}
	   		var tcode = document.getElementById("tcode");
	   		if(tcode.value.length==0){
	   			alert("验证码不能为空");
	   			tcode.focus();
	   			return false;
	   		}
	   		//window.location.href="StudentLoginAction.action?id="+id.value+"&name="+name.value+"&password="+password.value;
	   		
	   		if(window.XMLHttpRequest){
	   			xmlHttp = new XMLHttpRequest();
	   		}else if(window.ActiveXObject){
	   			xmlHttp = new ActiveXObject("Microsoft.XMLHttp");
	   		}
	   		xmlHttp.open("post","TeacherLoginAction.action",true);
	   		xmlHttp.onreadystatechange = callback2;
	   		xmlHttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	   		xmlHttp.send("tid="+tid.value+"&tname="+tname.value+"&tpassword="+tpassword.value+"&tcode="+tcode.value);
    	}
    	
    	function manager_login(){
	   		var mid = document.getElementById("mid");
	   		if(mid.value.length == 0){
				alert("号码不能为空");
				mid.value="";
				mid.focus();
				return false;
	   		}
	   		var mname = document.getElementById("mname");
	   		if(mname.value.length == 0){
				alert("姓名不能为空");
				mname.value="";
				mname.focus();
				return false;
	   		}
	   		var mpassword = document.getElementById("mpassword");
	   		if(mpassword.value.length==0){
				alert("密码不能为空");
				mpassword.value="";
				mpassword.focus();
				return false;
	   		}
	   		var mcode = document.getElementById("mcode");
	   		if(mcode.value.length==0){
	   			alert("验证码不能为空");
	   			mcode.focus();
	   			return false;
	   		}
	   		//window.location.href="StudentLoginAction.action?id="+id.value+"&name="+name.value+"&password="+password.value;
	   		
	   		if(window.XMLHttpRequest){
	   			xmlHttp = new XMLHttpRequest();
	   		}else if(window.ActiveXObject){
	   			xmlHttp = new ActiveXObject("Microsoft.XMLHttp");
	   		}
	   		xmlHttp.open("post","ManagerLoginAction.action",true);
	   		xmlHttp.onreadystatechange = callback3;
	   		xmlHttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	   		xmlHttp.send("mid="+mid.value+"&mname="+mname.value+"&mpassword="+mpassword.value+"&mcode="+mcode.value);
    	}
   	</script>
  </body>
</html>
