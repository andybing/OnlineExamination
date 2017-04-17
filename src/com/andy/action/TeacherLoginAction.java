package com.andy.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.andy.entity.Student;
import com.andy.entity.Teacher;
import com.andy.service.TeacherService;
import com.andy.service.TeacherServiceImpl;
import com.opensymphony.xwork2.ActionSupport;

public class TeacherLoginAction extends ActionSupport{
	private TeacherService teacherService = new TeacherServiceImpl();
	private String tid;
	private String tname;
	private String tpassword;
	private String tcode;
	public String getTid() {
		return tid;
	}
	public void setTid(String tid) {
		this.tid = tid;
	}
	public String getTname() {
		return tname;
	}
	public void setTname(String tname) {
		this.tname = tname;
	}
	public String getTpassword() {
		return tpassword;
	}
	public void setTpassword(String tpassword) {
		this.tpassword = tpassword;
	}
	public String getTcode() {
		return tcode;
	}
	public void setTcode(String tcode) {
		this.tcode = tcode;
	}
	public void login() throws IOException{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		PrintWriter out = ServletActionContext.getResponse().getWriter();
		String code_session = (String) session.getAttribute("code_session");
		if(tcode.equalsIgnoreCase(code_session)){
			if(teacherService.login(new Teacher(tid,tname,null,null,tpassword))){
				session.setAttribute("name", tname);
				session.setAttribute("id", tid);
				out.print("yes");
			}else{
				out.print("no");
			}
		}else{
			out.print("codeError");
		}
	}
}
