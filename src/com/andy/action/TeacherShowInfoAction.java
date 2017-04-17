package com.andy.action;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.andy.entity.Student;
import com.andy.entity.Teacher;
import com.andy.service.StudentService;
import com.andy.service.StudentServiceImpl;
import com.andy.service.TeacherService;
import com.andy.service.TeacherServiceImpl;
import com.opensymphony.xwork2.ActionSupport;

public class TeacherShowInfoAction extends ActionSupport{
	private Teacher teacher ;
	
	public Teacher getTeacher() {
		return teacher;
	}
	public void setStudent(Teacher teacher) {
		this.teacher = teacher;
	}
	private TeacherService teacherService = new TeacherServiceImpl();
	@Override
	public String execute() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		String id =(String) request.getSession().getAttribute("id");
		teacher = teacherService.getTeacherById(id);
		return "teacherInfo";
	}
}
