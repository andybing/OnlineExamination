package com.andy.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.andy.entity.Student;
import com.andy.service.StudentService;
import com.andy.service.StudentServiceImpl;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class StudentLoginAction extends ActionSupport{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private StudentService studentService = new StudentServiceImpl();
	private String id;
	private String name;
	private String password;
	private String code;
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
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public void login() throws IOException{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		PrintWriter out = ServletActionContext.getResponse().getWriter();
		String code_session = (String) session.getAttribute("code_session");
		if(code.equalsIgnoreCase(code_session)){
			if(studentService.login(new Student(id,name,password))){
				session.setAttribute("studentName", name);
				session.setAttribute("studentId", id);
				session.setAttribute("name", name);
				session.setAttribute("id", id);
				out.print("yes");
			}else{
				out.print("no");
			}
		}else{
			out.print("codeError");
		}
	}
}
