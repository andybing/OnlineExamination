package com.andy.action;

import java.io.IOException;
import java.io.PrintWriter;
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

public class CourseAddTeacherAction extends ActionSupport{
	private CourseService courseService = new CourseServiceImpl();
	private TeacherService teacherService = new TeacherServiceImpl();
	private String courseName;
	private String teacherName;
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
	public void set() throws IOException{
		HttpServletResponse response = ServletActionContext.getResponse();
		PrintWriter out = response.getWriter();
		Course course = courseService.getCourseByName(courseName);
		Teacher teacher = teacherService.getTeacherByName(teacherName);
		if(courseService.setTeacher(course, teacher)){
			out.print("yes");
		}else{
			out.print("no");
		}
	}
}
