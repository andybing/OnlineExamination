<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'showAllScore.jsp' starting page</title>
    <style>
    	*{margin:0px;padding:0px;}
    	.title{width:80%;height:40px;background:#eaeaea;margin:40px auto;text-align:center;line-height:40px;}
    	.allScore{width:80%;hight:30px;background:#eaeaea;margin:0px auto;text-align:center;line-height:30px;cursor:pointer;}
    	.allScoreShow{width:80%;height:400px;border:1px solid #eaeaea;margin:0px auto;display:none;}
    	.jigeScore{width:80%;hight:30px;background:#eaeaea;margin:20px auto;text-align:center;line-height:30px;cursor:pointer;}
    	.jigeScoreShow{width:80%;height:400px;border:1px solid #eaeaea;margin:0px auto;margin-top:-20px;display:none;}
    	.bujigeScore{width:80%;hight:30px;background:#eaeaea;margin:20px auto;text-align:center;line-height:30px;cursor:pointer;}
    	.bujigeScoreShow{width:80%;height:400px;border:1px solid #eaeaea;margin:0px auto;margin-top:-20px;display:none;}
    </style>
  </head>
  
  <body>
    <div class="title">课程成绩查询</div>
    <div class="allScore" onclick="showAllScore()">总体成绩排名(<span style="color:red">下拉展开</span>)</div>
    <div class="allScoreShow" id="allScoreShow">
    	<table border="1" cellspacing="0" cellpadding="0" style="margin:20px auto;width:90%">
   			<tr>
   				<td>学号</td>
   				<td>姓名</td>
   				<td>科目</td>
   				<td>成绩</td>
   				<td>通过情况</td>
   				<td>任课教师</td>
   			</tr>
   			<c:forEach items="${allScore }" var="score">
   				<tr>
   					<td><c:out value="${score.studentId }"></c:out></td>
   					<td><c:out value="${score.studentName }"></c:out></td>
   					<td><c:out value="${score.courseName}"></c:out></td>
   					<td><c:out value="${score.score }"></c:out></td>
   					<td><c:out value="${score.state }"></c:out></td>
   					<td><c:out value="${score.teacherName }"></c:out></td>
   				</tr>
   			</c:forEach>
   		</table>
    </div>
    
    <div class="jigeScore" onclick="showJigeScore()">及格成绩查询(<span style="color:red">下拉展开</span>)</div>
    <div class="jigeScoreShow" id="jigeScoreShow">
    	<table border="1" cellspacing="0" cellpadding="0" style="margin:20px auto;width:90%">
   			<tr>
   				<td>学号</td>
   				<td>姓名</td>
   				<td>科目</td>
   				<td>成绩</td>
   				<td>通过情况</td>
   				<td>任课教师</td>
   			</tr>
   			<c:forEach items="${jigeScore }" var="score">
   				<tr>
   					<td><c:out value="${score.studentId }"></c:out></td>
   					<td><c:out value="${score.studentName }"></c:out></td>
   					<td><c:out value="${score.courseName}"></c:out></td>
   					<td><c:out value="${score.score }"></c:out></td>
   					<td><c:out value="${score.state }"></c:out></td>
   					<td><c:out value="${score.teacherName }"></c:out></td>
   				</tr>
   			</c:forEach>
   		</table>
    </div>
    
    <div class="bujigeScore" onclick="showBujigeScore()">不及格成绩查询(<span style="color:red">下拉展开</span>)</div>
    <div class="bujigeScoreShow" id="bujigeScoreShow">
    	<table border="1" cellspacing="0" cellpadding="0" style="margin:20px auto;width:90%">
   			<tr>
   				<td>学号</td>
   				<td>姓名</td>
   				<td>科目</td>
   				<td>成绩</td>
   				<td>通过情况</td>
   				<td>任课教师</td>
   			</tr>
   			<c:forEach items="${bujigeScore }" var="score">
   				<tr>
   					<td><c:out value="${score.studentId }"></c:out></td>
   					<td><c:out value="${score.studentName }"></c:out></td>
   					<td><c:out value="${score.courseName}"></c:out></td>
   					<td><c:out value="${score.score }"></c:out></td>
   					<td><c:out value="${score.state }"></c:out></td>
   					<td><c:out value="${score.teacherName }"></c:out></td>
   				</tr>
   			</c:forEach>
   		</table>
    </div>
    
    <script>
    	function showAllScore(){
    		var allScoreShow = document.getElementById("allScoreShow");
    		if(allScoreShow.style.display==""){
    			allScoreShow.style.display="block";
   			}else if(allScoreShow.style.display=="block"){
   				allScoreShow.style.display="";
   			}
    	}
    	
    	function showJigeScore(){
    		var jigeScoreShow = document.getElementById("jigeScoreShow");
    		if(jigeScoreShow.style.display==""){
    			jigeScoreShow.style.display="block";
   			}else if(jigeScoreShow.style.display=="block"){
   				jigeScoreShow.style.display="";
   			}
    	}
    	
    	function showBujigeScore(){
    		var bujigeScoreShow = document.getElementById("bujigeScoreShow");
    		if(bujigeScoreShow.style.display==""){
    			bujigeScoreShow.style.display="block";
   			}else if(bujigeScoreShow.style.display=="block"){
   				bujigeScoreShow.style.display="";
   			}
    	}
    </script>
  </body>
</html>
