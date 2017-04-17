package com.andy.action;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.andy.entity.Student;
import com.andy.service.StudentService;
import com.andy.service.StudentServiceImpl;
import com.opensymphony.xwork2.ActionSupport;

public class StudentGetInfoByIdAction extends ActionSupport{
	private StudentService studentService = new StudentServiceImpl();
	private String sid;
	private Student student;

	public Student getStudent() {
		return student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}

	public String getSid() {
		return sid;
	}

	public void setSid(String sid) {
		this.sid = sid;
	}
	@Override
	public String execute() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		request.getSession().setAttribute("studentId", sid);
		student = studentService.getStudentById(sid);
		return "showStudentInfo";
	}
}
