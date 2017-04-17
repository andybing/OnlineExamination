package com.andy.action;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.andy.entity.Student;
import com.andy.service.StudentService;
import com.andy.service.StudentServiceImpl;
import com.opensymphony.xwork2.ActionSupport;

public class StudentShowInfoAction extends ActionSupport{
	private Student student ;
	
	public Student getStudent() {
		return student;
	}
	public void setStudent(Student student) {
		this.student = student;
	}
	private StudentService studentService = new StudentServiceImpl();
	@Override
	public String execute() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		String id =(String) request.getSession().getAttribute("id");
		student = studentService.getStudentById(id);
		return "studentInfo";
	}
}
