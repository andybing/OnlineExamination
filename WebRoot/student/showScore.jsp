<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>My JSP 'showScore.jsp' starting page</title>
   	<style>
   		*{margin:0px;padding:0px;}
   		.show{width:800px;height:40px;background: #eaeaea;margin:40px auto;line-height:40px;text-align:center;}
   		.jige{width:800px;height:30px;background:#eaeaea;margin:0px auto;cursor:pointer;line-height:30px;}
   		.jigeshow{width:800px;height:400px;border:1px solid #eaeaea;margin:0px auto;display:none;}
   		.bujige{width:800px;height:30px;background:#eaeaea;margin-top:20px;margin:20px auto;cursor:pointer;line-height:30px;}
   		.bujigeshow{width:800px;height:400px;border:1px solid #eaeaea;margin:0px auto;margin-top:-20px;display:none;}
   		td{height:30px;}
   	</style>
  </head>
  
  <body>
   	<div class="show">
   		个人成绩查询
   	</div>
   	
   	<div class="jige" onclick="showjige()">
   		及格成绩查询(<span style="color:red">下拉展开</span>)
   	</div>
   	<div class="jigeshow" id="jigeshow">
   		<table border="1" cellspacing="0" cellpadding="0" style="margin:20px auto;width:90%">
   			<tr>
   				<td>学号</td>
   				<td>姓名</td>
   				<td>科目</td>
   				<td>成绩</td>
   				<td>通过情况</td>
   				<td>任课教师</td>
   			</tr>
   			<c:forEach items="${requestScope.passedScore }" var="score">
   				<tr>
   					<td><c:out value="${score.studentId }"></c:out></td>
   					<td><c:out value="${sessionScope.name }"></c:out></td>
   					<td><c:out value="${score.courseName}"></c:out></td>
   					<td><c:out value="${score.score }"></c:out></td>
   					<td><c:out value="${score.state }"></c:out></td>
   					<td><c:out value="${score.teacherName }"></c:out></td>
   				</tr>
   			</c:forEach>
   		</table>
   	</div>
   	
   	<div class="bujige" onclick="showbujige()">
   		不及格成绩查询(<span style="color:red">下拉展开</span>)
   	</div>
   	
   	<div class="bujigeshow" id="bujigeshow">
   		<table border="1" cellspacing="0" cellpadding="0" style="margin:20px auto;width:90%">
   			<tr>
   				<td>学号</td>
   				<td>姓名</td>
   				<td>科目</td>
   				<td>成绩</td>
   				<td>通过情况</td>
   				<td>任课教师</td>
   			</tr>
   			<c:forEach items="${requestScope.unPassedScore }" var="score">
   				<tr>
   					<td><c:out value="${score.studentId }"></c:out></td>
   					<td><c:out value="${sessionScope.name }"></c:out></td>
   					<td><c:out value="${score.courseName}"></c:out></td>
   					<td><c:out value="${score.score }"></c:out></td>
   					<td><c:out value="${score.state }"></c:out></td>
   					<td><c:out value="${score.teacherName }"></c:out></td>
   				</tr>
   			</c:forEach>
   		</table>
   	</div>
   	
   	<script>
   		function showjige(){
   			var jigeshow = document.getElementById("jigeshow");
   			if(jigeshow.style.display==""){
   				jigeshow.style.display="block";
   			}else if(jigeshow.style.display=="block"){
   				jigeshow.style.display="";
   			}
   		}
   		
   		function showbujige(){
   			var jigeshow = document.getElementById("bujigeshow");
   			if(jigeshow.style.display==""){
   				jigeshow.style.display="block";
   			}else if(jigeshow.style.display=="block"){
   				jigeshow.style.display="";
   			}
   		}
   	</script>
  </body>
</html>
