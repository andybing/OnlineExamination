package com.andy.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.andy.entity.Teacher;
import com.andy.service.CourseService;
import com.andy.service.CourseServiceImpl;
import com.opensymphony.xwork2.ActionSupport;

public class CourseGetAllTeachersAction extends ActionSupport{
	private CourseService courseService = new CourseServiceImpl();
	private String courseName;

	public String getCourseName() {
		return courseName;
	}

	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}
	
	public void getTeachers() throws IOException{
		if(courseName.length()==3 && courseName.endsWith("  ")){
			courseName = "C++";
		}
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		Set<Teacher> teachers = courseService.getAllTeachers(courseName);
		StringBuffer sb = new StringBuffer();
		for(Teacher t : teachers){
			sb.append(t.getName()+" ");
		}
		out.print(sb.toString());
	}
}
