<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>答题界面</title>
    <style>
    	*{margin:0px;padding:0px;}
    	body{font-family:"微软雅黑";}
    	.exam{width:80%;height:200%;margin:0px auto;border:1px solid #000;}
    	.exam .title{width:100%;height:10%;border:1px solid #000;}
    	.exam .time{width:100%;height:30px;border:1px solid #000;text-align:center;line-height:30px;}
    	.exam .time .seconds{margin-left:10px;width:60px;height:30px;background:#eaeaea;}
    	.exam .questions{width:100%;height:100%;margin:10px 0 0 10px;}
    	.exam .questions .anwser{width:100%;height:30px;margin-top:10px;}
    	.exam .questions .anwser .a_submit a{text-decoration:none;display:block;width:100px;height:30px;margin-left:400px;border-radius:5px;
    		text-align:center;line-height:30px;background-color:#eaeaea;color:#000;font-size:14px;font-family:"微软雅黑";font-weight:bold;
    		float:left;}
    	.exam .questions .anwser .a_modify a{text-decoration:none;display:block;width:100px;height:30px;margin-left:10px;;border-radius:5px;
    		text-align:center;line-height:30px;background-color:#eaeaea;color:#000;font-size:14px;font-family:"微软雅黑";font-weight:bold;
    		float:left;}
    	.exam .questions .anwser .a_back a{text-decoration:none;display:block;width:100px;height:30px;margin-left:10px;;border-radius:5px;
    		text-align:center;line-height:30px;background-color:#eaeaea;color:#000;font-size:14px;font-family:"微软雅黑";font-weight:bold;
    		float:left;}
    	.exam .questions .anwser a:hover{background-color:#fff;}
    </style>
  </head>
  
  <body onload="showSeconds()">
    <div class="exam">
    	<div class="title"><br>
    		一.做好考前准备<br><br>
    		①.老师必备物品:准考证、身份证、学生证、2B铅笔、橡皮、圆珠笔或者钢笔、手表、小刀、直尺等。<br>
    		②.看一下考试当天天气预报。<br>
    		③.考试前记得吃清淡一些，以清爽可口，易消化为主。四级考试前早饭一定要吃。<br>
    	</div>
    	<div class="time">
    		【${name}】 您好...您的答题时间:<%=new Date() %> <span class="seconds" id="seconds"></span>
    	</div>
    	<% int num = 1; %>
    	<div class="questions">
    		<table border="0" cellpadding="0" cellspacing="0">
    			<s:if test="%{size == 0}">暂时没有考试题库</s:if>
    			<s:else>
	    			<s:iterator id="question" value="questions">
	    				<tr bgcolor="#eaeaea"><td><c:out value="<%=num %>"></c:out>.<s:property value="ques"></s:property></td></tr>
	    				<tr>
	    					<td>
	    						<input type="hidden" value="${size }" id="size"/>
	    						<input type="radio" name="<%=num %>" id="A"/>A.<s:property value="choose1"></s:property>
	    					</td>
	    				</tr>
	    				<tr>
	    					<td><input type="radio" name="<%=num %>" id="B" />B.<s:property value="choose2"></s:property></td>
	    				</tr>
	    				<tr>
	    					<td><input type="radio" name="<%=num %>" id="C" />C.<s:property value="choose3"></s:property></td>
	    				</tr>
	    				<tr>
	    					<td><input type="radio" name="<%=num++ %>" id="D" />D.<s:property value="choose4"></s:property></td>
	    				</tr>
	    				<tr><td><br></td></tr>
	    			</s:iterator>
    			</s:else>
    		</table>
    		<div class="anwser">
    			<div class="a_submit"><a href="javascript:void(0)" onclick="showChoose()">提交试卷</a></div>
    			<div class="a_back"><a href="welcome_stu.jsp">返回主界面</a></div>
    		</div>
    	</div>
    </div>
    <script>
    	var xmlHttp;
    	var size;
    	function showChoose(){
        	var anwser = "";
			size = document.getElementById("size").value;
			for(var i = 1;i<=size;i++){
				var chooses = document.getElementsByName(i);
				for(var j = 0;j<chooses.length;j++){
					if(chooses[j].checked){
						anwser+=chooses[j].id+" ";
					}
				}
			}
			if(anwser.length<size*2){
				alert("答题不完整");
				return false;
			}
			if(window.XMLHttpRequest){
				xmlHttp = new XMLHttpRequest();
			}else if(window.ActiveXObject){
				xmlHttp = new ActiveXObject(Microsoft.XMLHTTP);
			}
			xmlHttp.open("post", "JuageAnwserAction.action", true);
			xmlHttp.onreadystatechange = callback;
			xmlHttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
			xmlHttp.send("anwser="+anwser);
    	}
    	function callback(){
			if(xmlHttp.readyState == 4){
				if(xmlHttp.status == 200){
					var right = xmlHttp.responseText;
					if(right == "again"){
						alert("您已经考试过本科目！不能重复考试！");
						window.location.href="welcome_stu.jsp";
					}else{
						alert("您的成绩为:对"+right+"个,错"+(size-right)+"个,"+"您的成绩已经成功保存!");
						window.location.href="welcome_stu.jsp";
					}
				}
			}
    	}
    	var maxtime = 10*60;
    	var seconds = document.getElementById("seconds");
    	function showSeconds(){
			if(maxtime >= 0){
				minutes = Math.floor(maxtime/60);
				second = Math.floor(maxtime%60);
				var msg = "距离结束还有"+minutes+"分"+second+"秒";
				seconds.innerHTML = msg;
				if(maxtime == 5*60){
					alert("注意!还有5分钟!");
				}
				maxtime--;
			}else{
				alert("结束!时间到,未提交,考试作废!");
				clearInterval(timer);
				window.location.href="welcome_stu.jsp";
			}
    	}
    	var timer = setInterval("showSeconds()", 1000);
    </script>
  </body>
</html>
