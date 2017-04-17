package com.andy.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.andy.dao.StudentDao;
import com.andy.dao.StudentDaoImpl;
import com.andy.entity.Student;
import com.andy.service.StudentService;
import com.andy.service.StudentServiceImpl;
import com.opensymphony.xwork2.ActionSupport;

public class StudentModifyPasswordAction extends ActionSupport{
	private StudentService studentService = new StudentServiceImpl();
	private String id;
	private String name;
	private String password1;
	private String password2;
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
	public String getPassword1() {
		return password1;
	}
	public void setPassword1(String password1) {
		this.password1 = password1;
	}
	public String getPassword2() {
		return password2;
	}
	public void setPassword2(String password2) {
		this.password2 = password2;
	}
	public void modify() throws IOException{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		PrintWriter out = response.getWriter();
		if(studentService.modifyPassword(id,password1, password2)){
			out.print("yes");
		}else{
			out.print("no");
		}
	}
}
