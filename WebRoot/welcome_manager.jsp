<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Welcome Manager</title>
	<style type="text/css">
		*{margin:0px;padding:0px;}
		.choose{width:60%;height:30px;margin:0px auto;margin-top:40px;}
		.choose ul li{list-style:none;display:block;width:120px;height:30px;background:#ebebeb;float:left;border-radius:10px;
			line-height:30px;text-align:center;cursor:pointer;}
		.student_manage{width:60%;height:400px;border:1px solid #eaeaea;margin:0px auto;}
		.teacher_manage{width:60%;height:400px;margin:0px auto;display:none;border:1px solid #eaeaea;}
		.course_manage{width:60%;height:400px;margin:0px auto;display:none;border:1px solid #eaeaea;}
		.student_manage .add{width:20%;height:100%;border:1px solid #eaeaea;}
		.student_manage .add ul li{display:block;width:70%;height:40px;list-style:none;background:#eaeaea;margin:20px auto;
			cursor:pointer;line-height:40px;text-align:center;border-radius:5px;}
		.student_manage .showAdd{float:right;width:400px;height:250px;border:1px solid #eaeaea;padding-top:30px;
			padding-left:30px;margin:-350 200 -100 -100;display:display;}
		.student_manage .showDelete{float:right;width:400px;height:300px;margin:-350 200 -100 -100;
			display:none;}
		.student_manage .showUpdate{float:right;width:400px;height:300px;margin:-350 200 -100 -100;
			display:none;}
		.student_manage .showInfo{float:right;width:400px;height:300px;margin:-350 200 -100 -100;
			display:none;}
			
		.teacher_manage .add{width:20%;height:100%;border:1px solid #eaeaea;}
		.teacher_manage .add ul li{display:block;width:70%;height:40px;list-style:none;background:#eaeaea;margin:20px auto;
			cursor:pointer;line-height:40px;text-align:center;border-radius:5px;}
		.teacher_manage .showAdd{float:right;width:400px;height:250px;border:1px solid #eaeaea;padding-top:30px;
			padding-left:30px;margin:-350 200 -100 -100;display:display;}
		.teacher_manage .showDelete{float:right;width:400px;height:300px;margin:-350 200 -100 -100;
			display:none;}
		.teacher_manage .showUpdate{float:right;width:400px;height:300px;margin:-350 200 -100 -100;
			display:none;}
		.teacher_manage .showInfo{float:right;width:400px;height:300px;margin:-350 200 -100 -100;
			display:none;}
			
		.course_manage .add{width:20%;height:100%;border:1px solid #eaeaea;}
		.course_manage .add ul li{display:block;width:70%;height:40px;list-style:none;background:#eaeaea;margin:20px auto;
			cursor:pointer;line-height:40px;text-align:center;border-radius:5px;}
		.course_manage .showAdd{float:right;width:400px;height:250px;border:1px solid #eaeaea;padding-top:30px;
			padding-left:30px;margin:-350 200 -100 -100;display:block;}
		.course_manage .showSet{float:right;width:400px;height:250px;border:1px solid #eaeaea;padding-top:30px;
			padding-left:30px;margin:-350 200 -100 -100;display:none;}
		.course_manage .showDelete{float:right;width:400px;height:300px;margin:-350 200 -100 -100;
			display:none;}
		.course_manage .showUpdate{float:right;width:400px;height:300px;margin:-350 200 -100 -100;
			display:none;}
		.course_manage .showInfo{float:right;width:400px;height:300px;margin:-350 200 -100 -100;
			display:none;}
	</style>
  </head>
  
  <body onload="getAllTeachers()">
  	<div class="choose">
  		<ul>
  			<li onclick="showStuManage()" id="stuManage" style="background:#bcbcbc">学生信息管理</li>
  			<li onclick="showTeaManage()" id="teaManage">教师信息管理</li>
  			<li onclick="showCouManage()" id="couManage">课程信息管理</li>
  			<li id="manageLogout" style="float:right;border-radius:0px;"><a href="javascript:void(0)" onclick="logout()" style="text-decoration:none;color:#000;">安全退出</a></li>
  		</ul>
  	</div>
  	<div class="student_manage" id="student_manage">
  		<div class="add">
  			<ul>
  				<li onclick="addStu()" style="background:#bcbcbc;" id="add">学生信息添加</li>
  				<li onclick="updateStu()" id="update">学生信息删除</li>
  				<li>学生信息修改</li>
  				<li onclick="showStu()" id="show">学生信息查看</li>
  			</ul>
  		</div>
  		<div class="showAdd" id="showAdd">
  			<form action="" method="post">
	  			<table border="0">
	  				<tr>
	  					<td>学生学号:</td>
	  					<td><input type="text" name="id" id="id"/></td>
	  				</tr>
	  				<tr>
	  					<td>学生姓名:</td>
	  					<td><input type="text" name="name" id="name"/></td>
	  				</tr>
	  				<tr>
	  					<td>学生性别:</td>
	  					<td>
	  						<input type="radio" name="sex" id="sex1" value="男"/>男
	  						<input type="radio" name="sex" id="sex2" value="女"/>女
	  					</td>
	  				</tr>
	  				<tr>
	  					<td>学生班级:</td>
	  					<td><input type="text" name="clas" id="clas"/></td>
	  				</tr>
	  				<tr>
	  					<td>学生地址:</td>
	  					<td>
	  						<select name="location" id="location">
	  							<option value="青岛" >青岛</option>
	  							<option value="北京" >北京</option>
	  							<option value="上海" >上海</option>
	  							<option value="广州" >广州</option>
	  							<option value="深圳" >深圳</option>
	  						</select>
	  					</td>
	  				</tr>
	  				<tr>
	  					<td>学生年级:</td>
	  					<td><input type="text" name="grade" id="grade"/></td>
	  				</tr>
	  				<tr>
	  					<td>学生密码:</td>
	  					<td><input type="password" name="password" id="password"/></td>
	  				</tr>
	  			</table>
	  			<input type="reset" value="重置"  style="margin:30px 0 0 60px;width:60px;height:30px;border:0px;cursor:pointer;"/>
	  			<input type="button" value="增加" onclick="addStuToDB()" style="margin:30px 0 0 60px;width:60px;height:30px;border:0px;cursor:pointer;"/>
  			</form>
  		</div>
  		<div class="showDelete" id="showDelete">
  			请输入要删除的学生学号:<br><br>
  			<input type="text" name="id" id="cid"/><br><br>
  			<input type="button" onclick="deleteStu()" value="删除" style="width:60px;height:30px;border:0px;margin-left:30px;"/>
  		</div>
  		<div class="showUpdate" id="showUpdate">
  			
  		</div>
  		<div class="showInfo" id="showInfo">
  			请输入要查看的学生学号:<br><br>
  			<input type="text" name="id" id="sid"/><br><br>
  			<input type="button" onclick="lookStu()" value="查看" style="width:60px;height:30px;border:0px;margin-left:30px;"/>
  		</div>
  	</div>
  	<div class="teacher_manage" id="teacher_manage">
  		<div class="add">
  			<ul>
  				<li onclick="addTea()" style="background:#bcbcbc;" id="add1">教师信息添加</li>
  				<li onclick="updateTea()" id="update1">教师信息删除</li>
  				<li>教师信息修改</li>
  				<li onclick="showTea()" id="show1">教师信息查看</li>
  			</ul>
  		</div>
  		<div class="showAdd" id="showAdd1">
  			<form action="" method="post">
	  			<table border="0">
	  				<tr>
	  					<td>教师编号:</td>
	  					<td><input type="text" name="tid" id="tid"/></td>
	  				</tr>
	  				<tr>
	  					<td>教师姓名:</td>
	  					<td><input type="text" name="tname" id="tname"/></td>
	  				</tr>
	  				<tr>
	  					<td>教师性别:</td>
	  					<td>
	  						<input type="radio" name="tsex" id="tsex1" value="男"/>男
	  						<input type="radio" name="tsex" id="tsex2" value="女"/>女
	  					</td>
	  				</tr>
	  				<tr>
	  					<td>教师地址:</td>
	  					<td>
	  						<select name="tlocation" id="tlocation">
	  							<option value="青岛" >青岛</option>
	  							<option value="北京" >北京</option>
	  							<option value="上海" >上海</option>
	  							<option value="广州" >广州</option>
	  							<option value="深圳" >深圳</option>
	  						</select>
	  					</td>
	  				</tr>
	  				<tr>
	  					<td>教师密码:</td>
	  					<td><input type="password" name="tpassword" id="tpassword"/></td>
	  				</tr>
	  			</table>
	  			<input type="reset" value="重置"  style="margin:30px 0 0 60px;width:60px;height:30px;border:0px;cursor:pointer;"/>
	  			<input type="button" value="增加" onclick="addTeaToDB()" style="margin:30px 0 0 60px;width:60px;height:30px;border:0px;cursor:pointer;"/>
  			</form>
  		</div>
  		<div class="showDelete" id="showDelete1">
  			请输入要删除的教师编号:<br><br>
  			<input type="text" name="id" id="tcid"/><br><br>
  			<input type="button" onclick="deleteTea()" value="删除" style="width:60px;height:30px;border:0px;margin-left:30px;"/>
  		</div>
  		<div class="showUpdate" id="showUpdate1">
  			
  		</div>
  		<div class="showInfo" id="showInfo1">
  			请输入要查看的教师编号:<br><br>
  			<input type="text" name="id" id="tsid"/><br><br>
  			<input type="button" onclick="lookTea()" value="查看" style="width:60px;height:30px;border:0px;margin-left:30px;"/>
  		</div>
  	</div>
  	<div class="course_manage" id="course_manage">
  		<div class="add">
  			<ul>
  				<li onclick="addCou()" style="background:#bcbcbc;" id="add_cou">课程信息添加</li>
  				<li onclick="courseSetTeacher()" id="setTeacher">课程设置教师</li>
  			</ul>
  		</div>
  		<div class="showAdd" id="showAdd2">
  			<form action="" method="post">
	  			<table border="0">
	  				<tr>
	  					<td>课程编号:</td>
	  					<td><input type="text" name="ccid" id="ccid"/></td>
	  				</tr>
	  				<tr>
	  					<td>课程姓名:</td>
	  					<td><input type="text" name="ccname" id="ccname"/></td>
	  				</tr>
	  				<tr>
	  					<td>任课教师:</td>
	  					<td>
	  						<select id="teachers" name="teacherName">
    							<!--
    							<option value="wu">吴老师</option>
    							<option value="ma">马老师</option>
    							-->
    						</select>
	  					</td>
	  				</tr>
	  			</table>
	  			<input type="reset" value="重置"  style="margin:30px 0 0 60px;width:60px;height:30px;border:0px;cursor:pointer;"/>
	  			<input type="button" value="增加" onclick="addCouToDB()" style="margin:30px 0 0 60px;width:60px;height:30px;border:0px;cursor:pointer;"/>
  			</form>
  		</div>
  		
  		<div class="showSet" id="showSet">
  			<form action="" method="post">
	  			<table border="0">
	  				<tr>
	  					<td>课程名称:</td>
	  					<td>
	  						<select id="courses" name="courseNames">
    							<!--
    							<option value="wu">吴老师</option>
    							<option value="ma">马老师</option>
    							-->
    						</select>
	  					</td>
	  				</tr>
	  				<tr>
	  					<td>任课教师:</td>
	  					<td>
	  						<select id="teacherss" name="teacherNames">
    							<!--
    							<option value="wu">吴老师</option>
    							<option value="ma">马老师</option>
    							-->
    						</select>
	  					</td>
	  				</tr>
	  			</table>
	  			<input type="reset" value="重置"  style="margin:30px 0 0 60px;width:60px;height:30px;border:0px;cursor:pointer;"/>
	  			<input type="button" value="设置" onclick="courseSetTeachers()" style="margin:30px 0 0 60px;width:60px;height:30px;border:0px;cursor:pointer;"/>
  			</form>
  		</div>
  	</div>
  	
  	<script type="text/javascript">
  		var stuManage = document.getElementById("stuManage");
  		var teaManage = document.getElementById("teaManage");
  		var couManage = document.getElementById("couManage");
  		var student_manage = document.getElementById("student_manage");
  		var teacher_manage = document.getElementById("teacher_manage");
  		var course_manage = document.getElementById("course_manage");
  		function showStuManage(){
  			student_manage.style.display = "block";
  			teacher_manage.style.display = "none";
  			course_manage.style.display="none";
  			stuManage.style.background="#bcbcbc";
  			teaManage.style.background="#eaeaea";
  			couManage.style.background="#eaeaea";
  		}
  		
  		function showTeaManage(){
  			student_manage.style.display = "none";
  			teacher_manage.style.display = "block";
  			course_manage.style.display="none";
  			stuManage.style.background="#eaeaea";
  			teaManage.style.background="#bcbcbc";
  			couManage.style.background="#eaeaea";
  		}
  		
  		function showCouManage(){
  			student_manage.style.display = "none";
  			teacher_manage.style.display = "none";
  			course_manage.style.display="block";
  			stuManage.style.background="#eaeaea";
  			teaManage.style.background="#eaeaea";
  			couManage.style.background="#bcbcbc";
  		}
  		var add = document.getElementById("add");
  		var update = document.getElementById("update");
  		var show = document.getElementById("show");
  		var showAdd = document.getElementById("showAdd");
  		var showDelete = document.getElementById("showDelete");
  		var showInfo = document.getElementById("showInfo");
  		function addStu(){
  			showAdd.style.display="block";
  			showDelete.style.display="none";
  			showInfo.style.display="none";
  			add.style.background="#bcbcbc";
  			update.style.background="#eaeaea";
  			show.style.background="#eaeaea";
  		}
  		
  		function updateStu(){
  			showAdd.style.display="none";
  			showDelete.style.display="block";
  			showInfo.style.display="none";
  			add.style.background="#eaeaea";
  			update.style.background="#bcbcbc";
  			show.style.background="#eaeaea";
  		}
  		
  		function showStu(){
  			showAdd.style.display="none";
  			showDelete.style.display="none";
  			showInfo.style.display="block";
  			add.style.background="#eaeaea";
  			update.style.background="#eaeaea";
  			show.style.background="#bcbcbc";
  		}
  		var xmlHttp;
  		if(window.XMLHttpRequest){
			xmlHttp = new XMLHttpRequest();
		}else if(window.ActionXObject){
			xmlHttp = new ActiveXObject("Microsoft.XMLHttp");
		}
  		function addStuToDB(){
  			var id = document.getElementById("id");
  			if(id.value.length==0){
  				alert("学号不能为空!");
  				id.focus();
  				return false;
  			}
  			var name = document.getElementById("name");
  			if(name.value.length==0){
  				alert("姓名不能为空!");
  				name.focus();
  				return false;
  			}
  			var sex1 = document.getElementById("sex1");var sex2 = document.getElementById("sex2");
  			var sex=null;
			if(!sex1.checked && !sex2.checked){
				alert("请选择性别!");
				return false;
			}else if(sex1.checked){
				sex = sex1.value;
			}else if(sex2.checked){
				sex = sex2.value;
			}
			var clas = document.getElementById("clas");
			if(clas.value.length==0){
				alert("请输入班级");
				clas.focus();
				return false;
			}
			var location = document.getElementById("location");
			var grade = document.getElementById("grade");
			if(grade.value.length == 0){
				alert("年级不能为空!");
				grade.focus();
				return false;
			}
			var password = document.getElementById("password");
			if(password.value.length==0){
				alert("请输入密码!");
				password.focus();
				return false;
			}
			xmlHttp.open("post","StudentAddAction",true);
			xmlHttp.onreadystatechange = callback;
			xmlHttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
			xmlHttp.send("id="+id.value+"&name="+name.value+"&sex="+sex+"&clas="+clas.value+
					"&location="+location.value+"&grade="+grade.value+"&password="+password.value);
  		}
  		function callback(){
  			if(xmlHttp.readyState == 4){
    			if(xmlHttp.status == 200){
    				var text = xmlHttp.responseText;
    				if(text == "yes"){
    					alert("学生添加成功");
    				}else if(text == "no"){
    					alert("该学号已经存在");
    				}else if(text=="deleteok"){
    					alert("学生删除成功");
    				}else if(text=="deletefail"){
    					alert("该学生已经不存在");
    				}
    			}
    		}
  		}
  		
  		function deleteStu(){
  			var cid = document.getElementById("cid");
  			if(cid.value.length==0){
  				alert("请输入您要删除的学生学号");
  				cid.focus();
  				return false;
  			}
  			xmlHttp.open("post","StudentDeleteAction",true);
			xmlHttp.onreadystatechange = callback;
			xmlHttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
			xmlHttp.send("cid="+cid.value);
  		}
  		
  		function lookStu(){
  			var sid = document.getElementById("sid");
  			if(sid.value.length==0){
  				alert("请输入您要查看的学生学号");
  				sid.focus();
  				return false;
  			}
  			window.open("StudentGetInfoByIdAction.action?sid="+sid.value,"查看学生信息","width=600,height=400,left=360,top=100");
  		}
  		
		//////////////////////////////////............................................................................
  		var add1 = document.getElementById("add1");
  		var update1 = document.getElementById("update1");
  		var show1 = document.getElementById("show1");
  		var showAdd1 = document.getElementById("showAdd1");
  		var showDelete1 = document.getElementById("showDelete1");
  		var showInfo1 = document.getElementById("showInfo1");
  		function addTea(){
  			showAdd1.style.display="block";
  			showDelete1.style.display="none";
  			showInfo1.style.display="none";
  			add1.style.background="#bcbcbc";
  			update1.style.background="#eaeaea";
  			show1.style.background="#eaeaea";
  		}
  		
  		function updateTea(){
  			showAdd1.style.display="none";
  			showDelete1.style.display="block";
  			showInfo1.style.display="none";
  			add1.style.background="#eaeaea";
  			update1.style.background="#bcbcbc";
  			show1.style.background="#eaeaea";
  		}
  		
  		function showTea(){
  			showAdd1.style.display="none";
  			showDelete1.style.display="none";
  			showInfo1.style.display="block";
  			add1.style.background="#eaeaea";
  			update1.style.background="#eaeaea";
  			show1.style.background="#bcbcbc";
  		}
  		var xmlHttp;
  		if(window.XMLHttpRequest){
			xmlHttp = new XMLHttpRequest();
		}else if(window.ActionXObject){
			xmlHttp = new ActiveXObject("Microsoft.XMLHttp");
		}
  		function addTeaToDB(){
  			var tid = document.getElementById("tid");
  			if(tid.value.length==0){
  				alert("教师编号不能为空!");
  				tid.focus();
  				return false;
  			}
  			var tname = document.getElementById("tname");
  			if(tname.value.length==0){
  				alert("教师姓名不能为空!");
  				tname.focus();
  				return false;
  			}
  			var tsex1 = document.getElementById("tsex1");var sex2 = document.getElementById("tsex2");
  			var tsex=null;
			if(!tsex1.checked && !tsex2.checked){
				alert("请选择性别!");
				return false;
			}else if(tsex1.checked){
				tsex = tsex1.value;
			}else if(tsex2.checked){
				tsex = tsex2.value;
			}
			var tlocation = document.getElementById("tlocation");
			var tpassword = document.getElementById("tpassword");
			if(tpassword.value.length==0){
				alert("请输入密码!");
				tpassword.focus();
				return false;
			}
			xmlHttp.open("post","TeacherAddAction",true);
			xmlHttp.onreadystatechange = callback2;
			xmlHttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
			xmlHttp.send("tid="+tid.value+"&tname="+tname.value+"&tsex="+tsex+
					"&tlocation="+tlocation.value+"&tpassword="+tpassword.value);
  		}
  		function callback2(){
  			if(xmlHttp.readyState == 4){
    			if(xmlHttp.status == 200){
    				var text = xmlHttp.responseText;
    				if(text == "yes"){
    					alert("教师添加成功");
    				}else if(text == "no"){
    					alert("该教师已经存在");
    				}else if(text=="deleteok"){
    					alert("教师删除成功");
    				}else if(text=="deletefail"){
    					alert("该教师已经不存在");
    				}else if(text == "noExist"){
    					alert("教师信息不存在");
    				}else if(text == "alreadyExist"){
    					window.open("TeacherGetInfoByIdAction.action?tsid="+tsid.value,"查看学生信息","width=600,height=400,left=360,top=100");
    				}
    			}
    		}
  		}
  		
  		function deleteTea(){
  			var tcid = document.getElementById("tcid");
  			if(tcid.value.length==0){
  				alert("请输入您要删除的教师编号");
  				tcid.focus();
  				return false;
  			}
  			xmlHttp.open("post","TeacherDeleteAction",true);
			xmlHttp.onreadystatechange = callback2;
			xmlHttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
			xmlHttp.send("tcid="+tcid.value);
  		}
  		
  		function lookTea(){
  			var tsid = document.getElementById("tsid");
  			if(tsid.value.length==0){
  				alert("请输入您要查看的教师编号");
  				tsid.focus();
  				return false;
  			}
  			xmlHttp.open("post","TeacherGetInfoByIdAction!juage.action",true);
			xmlHttp.onreadystatechange = callback2;
			xmlHttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
			xmlHttp.send("tsid="+tsid.value);
  			//window.open("TeacherGetInfoByIdAction.action?tsid="+tsid.value,"查看学生信息","width=600,height=400,left=360,top=100");
  		}
  		//************************************************************************
  		function addCouToDB(){
  			var ccid = document.getElementById("ccid");
  			if(ccid.value.length==0){
  				alert("课程编号不能为空!");
  				ccid.focus();
  				return false;
  			}
  			var ccname = document.getElementById("ccname");
  			if(ccname.value.length==0){
  				alert("课程姓名不能为空!");
  				ccname.focus();
  				return false;
  			}
  			var teacherName = document.getElementById("teachers");
			xmlHttp.open("post","CourseAddAction",true);
			xmlHttp.onreadystatechange = callback3;
			xmlHttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
			xmlHttp.send("ccid="+ccid.value+"&ccname="+ccname.value+"&teacherName="+teacherName.value);
  		}
  		function callback3(){
  			if(xmlHttp.readyState == 4){
    			if(xmlHttp.status == 200){
    				var text = xmlHttp.responseText;
    				if(text == "yes"){
    					alert("课程添加成功");
    				}else if(text == "no"){
    					alert("该课程已经存在");
    				}else if(text=="deleteok"){
    					alert("课程删除成功");
    				}else if(text=="deletefail"){
    					alert("该课程已经不存在");
    				}
    			}
    		}
  		}
  		
  		
  		function getAllTeachers(){
    		if(window.XMLHttpRequest){
    			xmlHttp = new XMLHttpRequest();
    		}else if(window.ActiveXObject){
    			xmlHttp = new ActiveXObject("Microsoft.XMLHttp");
    		}
    		xmlHttp.open("get","TeacherGetAllNamesAction.action",true);
	   		xmlHttp.onreadystatechange = callback_teachers;
	   		xmlHttp.send(null);
    	}
  		
  		function callback_teachers(){
    		if(xmlHttp.readyState == 4){
    			if(xmlHttp.status == 200){
    				var text = xmlHttp.responseText;
    				var teacherNames = text.trim().split(' ');
    				var teachers = document.getElementById("teachers");
    				var teacherss = document.getElementById("teacherss");
    				teachers.options.length=0;
    				teacherss.options.length=0;
    				for(var i = 0;i<teacherNames.length;i++){
    					teachers.options[i] = new Option(teacherNames[i]);
					}
    				for(var i = 0;i<teacherNames.length;i++){
    					teacherss.options[i] = new Option(teacherNames[i]);
					}
    				getAllCourseNames();
    			}
    		}
    	}
  		function logout(){
  			if(confirm("确定要退出吗?")){
  				window.location.href="ManagerLogoutAction.action";
  			}
  		}
  		var add_cou = document.getElementById("add_cou");
  		var setTeacher = document.getElementById("setTeacher");
  		var showAdd2 = document.getElementById("showAdd2");
  		var showSet = document.getElementById("showSet");
  		function addCou(){
  			add_cou.style.background="#bcbcbc";
  			setTeacher.style.background="#eaeaea";
  			showAdd2.style.display="block";
  			showSet.style.display="none";
  		}
  		function courseSetTeacher(){
  			add_cou.style.background="#eaeaea";
  			setTeacher.style.background="#bcbcbc";
  			showAdd2.style.display="none";
  			showSet.style.display="block";
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
  		function callback_names(){
    		if(xmlHttp.readyState == 4){
    			if(xmlHttp.status == 200){
    				var text = xmlHttp.responseText;
    				var names = text.trim().split(' ');
    				var courses = document.getElementById("courses");
    				for(var i = 0;i<names.length;i++){
						courses.options[i] = new Option(names[i]);
    				}
    			}
    		}
    	}
  		function courseSetTeachers(){
  			var courseName = document.getElementById("courses").value;
  			var teacherName = document.getElementById("teacherss").value;
  			xmlHttp.open("post","CourseAddTeacherAction.action",true);
			xmlHttp.onreadystatechange = callback_ct;
			xmlHttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
			xmlHttp.send("courseName="+courseName+"&teacherName="+teacherName);
  		}
  		function callback_ct(){
  			if(xmlHttp.readyState == 4){
    			if(xmlHttp.status == 200){
    				var text = xmlHttp.responseText;
    				if(text == "yes"){
    					alert("设置成功");
    				}else if(text == "no"){
    					alert("设置失败");
    				}
    			}
  			}
  		}
  	</script>
  </body>
</html>
