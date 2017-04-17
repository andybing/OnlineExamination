<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>修改试卷界面</title>
	<style>
		*{margin:0px;padding:0px;}
		body{font-size:12px;font-family:"微软雅黑";}
		.modify{width:60%;height:100%;border:1px solid #eaeaea;margin:0px auto;}
		.modify .menu{width:80%;height:30px;margin:0px auto;margin-top:30px;}
		.modify .menu ul li{list-style:none;display:block;width:70px;height:30px;background:#eaeaea;float:left;
			text-align:center;line-height:30px;cursor:pointer;margin-left:1px;border-radius:5px;}
		.modify .operation{width:80%;height:100%;margin:0px auto;}
		.modify .operation .add{width:60%;height:60%;margin:0 0 0 1px;border:1px solid #eaeaea;padding:10px;}
		.modify .operation .update{width:80%;height:50%;margin:0 0 0 1px;border:1px solid #eaeaea;padding:10px;display:none;}
		.modify .operation .delete{width:80%;height:50%;margin:0 0 0 1px;border:1px solid #eaeaea;padding:10px;display:none;}
		.modify .operation .add a{text-decoration:none;display:block;width:70px;height:30px;background:#eaeaea;color:#000;
			text-align:center;line-height:30px;float:left;margin-left:10px;border-radius:5px;}
		.modify .operation .update a{text-decoration:none;display:block;width:70px;height:30px;background:#eaeaea;color:#000;
			text-align:center;line-height:30px;float:left;margin-left:10px;border-radius:5px;}
		.modify .operation .delete a{text-decoration:none;display:block;width:70px;height:30px;background:#eaeaea;color:#000;
			text-align:center;line-height:30px;float:left;margin-left:10px;border-radius:5px;}
	</style>
  </head>
  
  <body onload="getAllCourses()">
    <div class="modify">
    	<div class="menu">
    		<ul>
    			<li onclick="addQuestion(this)" style="background:#b7b7b7">新增问题</li>
    			<li onclick="updateQuestion(this)">修改问题</li>
    			<li onclick="deleteQuestion(this)">删除问题</li>
    		</ul>
    	</div>
    	<div class="operation">
    		<div class="add" id="add"><br>
    			新增问题题号:<input type="text" name="id" size="5" id="id"/>(题号不重复)<br/></br>
    			键入新增问题:<input type="text" name="ques" id="ques"/><br/></br>
    			键入问题选项:<br><br>
    			A.<input type="text" name="A" id="A"/><br><br>
    			B.<input type="text" name="B" id="B"/><br><br>
    			C.<input type="text" name="C" id="C"/><br><br>
    			D.<input type="text" name="D" id="D"/><br><br>
  				问题答案:<input type="text" name="anwser" id="anwser"/><br><br>
  				问题所属课程:
  				<select name="courses" id="courses">
  					
  				</select><br><br>
    			<a href="javascript:void(0)" onclick="addQues()">添加问题</a>
    			<a href="welcome_tea.jsp">返回主界面</a>
    		</div>
    		<div class="update" id="update"><br/>
    			要修改的问题题号:<input type="text" name="id2" size="5" id="id2"/><br/></br>
    			键入新问题:<input type="text" name="ques2" id="ques2"/><br/></br>
    			键入新问题选项:<br><br>
    			A.<input type="text" name="A2" id="A2"/><br><br>
    			B.<input type="text" name="B2" id="B2"/><br><br>
    			C.<input type="text" name="C2" id="C2"/><br><br>
    			D.<input type="text" name="D2" id="D2"/><br><br>
  				新问题答案:<input type="text" name="anwser2" id="anwser2"/><br><br>
  				问题所属课程:
  				<select name="courses" id="coursess">
  					
  				</select><br><br>
    			<a href="javascript:void(0)" onclick="updateQues()">修改问题</a>
    			<a href="welcome_tea.jsp">返回主界面</a>
    		</div>
    		<div class="delete" id="delete"><br/>
    			要删除的问题题号:<input type="text" name="id3" size="5" id="id3"/><br/></br>
    			<a href="javascript:void(0)" onclick="deleteQues()">删除问题</a>
    			<a href="welcome_tea.jsp">返回主界面</a>
    		</div>
    	</div>
    </div>
    <script>
    	var xmlHttp;
    	var add = document.getElementById("add");
    	var update = document.getElementById("update");
    	var del = document.getElementById("delete");
    	function addQuestion(arg){
    		var lis = document.getElementsByTagName("li");
        	for(var i = 0;i<lis.length;i++){
				lis[i].style.background="#eaeaea";
        	}
        	arg.style.background="#b7b7b7";
        	update.style.display="none";
        	del.style.display="none";
        	add.style.display="block";
    	}
    	function updateQuestion(arg){
    		var lis = document.getElementsByTagName("li");
        	for(var i = 0;i<lis.length;i++){
				lis[i].style.background="#eaeaea";
        	}
    		arg.style.background="#b7b7b7";
    		add.style.display="none";
    		del.style.display="none";
    		update.style.display = "block";
    	}
    	function deleteQuestion(arg){
    		var lis = document.getElementsByTagName("li");
        	for(var i = 0;i<lis.length;i++){
				lis[i].style.background="#eaeaea";
        	}
    		arg.style.background="#b7b7b7";
    		add.style.display="none";
    		update.style.display="none";
    		del.style.display="block";
    	}

    	function addQues(){
			var id = document.getElementById("id").value;
			var ques = document.getElementById("ques").value;
			var choose1 = document.getElementById("A").value;
			var choose2 = document.getElementById("B").value;
			var choose3 = document.getElementById("C").value;
			var choose4 = document.getElementById("D").value;
			var anwser = document.getElementById("anwser").value;
			var courseName = document.getElementById("courses").value;
			if(id.length==0 || ques.length==0 || choose1.length==0 || choose2.length==0 || choose3.length==0 || choose4.length==0 || anwser.length==0 || courseName.length==0){
				alert("信息不完整");
				return false;
			}
			//alert(id+ques+choose1+choose2+choose3+choose4);
			if(window.XMLHttpRequest){
				xmlHttp = new XMLHttpRequest();
			}else if(window.ActiveXObject){
				xmlHttp = new ActiveXObject("Microsoft.XMLHttp");
			}
			xmlHttp.open("post", "AddQuestionAction.action", true);
			xmlHttp.onreadystatechange = callback;
			xmlHttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
			xmlHttp.send("id="+id+"&ques="+ques+"&choose1="+choose1+"&choose2="
					+choose2+"&choose3="+choose3+"&choose4="+choose4+"&anwser="+anwser+"&courseName="+courseName);
        }
        function callback(){
			if(xmlHttp.readyState == 4){
				if(xmlHttp.status == 200){
					var text = xmlHttp.responseText;
					if(text == "yes"){
						alert("操作问题成功");
					}else if(text == "no"){
						alert("操作问题失败");
					}
				}
			}
        }
        function updateQues(){
        	var id2 = document.getElementById("id2").value;
			var ques2 = document.getElementById("ques2").value;
			var choose12 = document.getElementById("A2").value;
			var choose22 = document.getElementById("B2").value;
			var choose32 = document.getElementById("C2").value;
			var choose42 = document.getElementById("D2").value;
			var anwser2 = document.getElementById("anwser2").value;
			if(id2.length==0 || ques2.length==0 || choose12.length==0 || choose22.length==0 || choose32.length==0 || choose42.length==0 || anwser2.length==0){
				alert("信息不完整");
				return false;
			}
			//alert(id+ques+choose1+choose2+choose3+choose4);
			if(window.XMLHttpRequest){
				xmlHttp = new XMLHttpRequest();
			}else if(window.ActiveXObject){
				xmlHttp = new ActiveXObject("Microsoft.XMLHttp");
			}
			xmlHttp.open("post", "UpdateQuestionAction.action", true);
			xmlHttp.onreadystatechange = callback;
			xmlHttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
			xmlHttp.send("id2="+id2+"&ques2="+ques2+"&choose12="+choose12+"&choose22="
					+choose22+"&choose32="+choose32+"&choose42="+choose42+"&anwser2="+anwser2);
        }
        function deleteQues(){
        	var id3 = document.getElementById("id3").value;
        	if(window.XMLHttpRequest){
				xmlHttp = new XMLHttpRequest();
			}else if(window.ActiveXObject){
				xmlHttp = new ActiveXObject("Microsoft.XMLHttp");
			}
			xmlHttp.open("post", "DeleteQuestionAction.action", true);
			xmlHttp.onreadystatechange = callback;
			xmlHttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
			xmlHttp.send("id3="+id3);
        }
        
        function getAllCourses(){
    		if(window.XMLHttpRequest){
    			xmlHttp = new XMLHttpRequest();
    		}else if(window.ActiveXObject){
    			xmlHttp = new ActiveXObject("Microsoft.XMLHttp");
    		}
    		xmlHttp.open("get","CourseGetAllNamesAction.action",true);
	   		xmlHttp.onreadystatechange = callback_courses;
	   		xmlHttp.send(null);
    	}
  		
  		function callback_courses(){
    		if(xmlHttp.readyState == 4){
    			if(xmlHttp.status == 200){
    				var text = xmlHttp.responseText;
    				var courseNames = text.trim().split(' ');
    				var courses = document.getElementById("courses");
    				courses.options.length=0;
    				for(var i = 0;i<courseNames.length;i++){
    					courses.options[i] = new Option(courseNames[i]);
					}
    				
    				var coursess = document.getElementById("coursess");
    				coursess.options.length=0;
    				for(var i = 0;i<courseNames.length;i++){
    					coursess.options[i] = new Option(courseNames[i]);
					}
    			}
    		}
    	}
    </script>
  </body>
</html>
