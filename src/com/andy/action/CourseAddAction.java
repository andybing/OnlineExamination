package com.andy.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.andy.entity.Course;
import com.andy.entity.Teacher;
import com.andy.service.CourseService;
import com.andy.service.CourseServiceImpl;
import com.andy.service.TeacherService;
import com.andy.service.TeacherServiceImpl;
import com.opensymphony.xwork2.ActionSupport;

public class CourseAddAction extends ActionSupport{
	private CourseService courseService = new CourseServiceImpl();
	private TeacherService teacherService = new TeacherServiceImpl();
	private String ccid;
	private String ccname;
	private String teacherName;
	
	public String getTeacherName() {
		return teacherName;
	}
	public void setTeacherName(String teacherName) {
		this.teacherName = teacherName;
	}
	public String getCcid() {
		return ccid;
	}
	public void setCcid(String ccid) {
		this.ccid = ccid;
	}
	public String getCcname() {
		return ccname;
	}
	public void setCcname(String ccname) {
		this.ccname = ccname;
	}
	public void add() throws IOException{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		Course c = new Course(ccid,ccname);
		Teacher t = teacherService.getTeacherByName(teacherName);
		Set<Teacher> teachers = new HashSet<Teacher>();
		teachers.add(t);
		c.setTeachers(teachers);
		if(courseService.addCourse(c)){
			out.print("yes");
		}else{
			out.print("no");
		}
	}
}
