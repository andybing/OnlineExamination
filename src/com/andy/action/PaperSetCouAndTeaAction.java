package com.andy.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

public class PaperSetCouAndTeaAction extends ActionSupport{
	private String courseName;
	private String teacherName;
	private String studentName;
	
	public String getStudentName() {
		return studentName;
	}
	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}
	public String getCourseName() {
		return courseName;
	}
	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}
	public String getTeacherName() {
		return teacherName;
	}
	public void setTeacherName(String teacherName) {
		this.teacherName = teacherName;
	}
	public void saveCouAndTea() throws IOException{
		//System.out.println(courseName+" "+teacherName);
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		request.getSession().setAttribute("courseName", courseName);
		request.getSession().setAttribute("teacherName", teacherName);
		request.getSession().setAttribute("studentName", studentName);
		String studentId =(String) request.getSession().getAttribute("studentId");
		
		response.getWriter().print("yes");
	}
}
