package com.andy.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.andy.entity.Student;
import com.andy.service.StudentService;
import com.andy.service.StudentServiceImpl;
import com.opensymphony.xwork2.ActionSupport;

public class StudentUpdateAction extends ActionSupport{
	private StudentService studentService = new StudentServiceImpl();
	private String id;
	private String name;
	private String sex;
	private String clas;
	private String location;
	private String grade;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getClas() {
		return clas;
	}
	public void setClas(String clas) {
		this.clas = clas;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public void update() throws IOException{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		id = (String)request.getSession().getAttribute("studentId");
		if(studentService.updateStudent(id, new Student(name,sex,clas,location,grade))){
			out.print("yes");
		}else{
			out.print("no");
		}
	}
}
