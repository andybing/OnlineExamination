package com.andy.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.andy.entity.Teacher;
import com.andy.service.TeacherService;
import com.andy.service.TeacherServiceImpl;
import com.opensymphony.xwork2.ActionSupport;

public class TeacherGetInfoByIdAction extends ActionSupport{
	private TeacherService teacherService = new TeacherServiceImpl();
	private String tsid;
	private Teacher teacher = null;
	
	public Teacher getTeacher() {
		return teacher;
	}

	public void setTeacher(Teacher teacher) {
		this.teacher = teacher;
	}

	public String getTsid() {
		return tsid;
	}

	public void setTsid(String tsid) {
		this.tsid = tsid;
	}

	@Override
	public String execute() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		request.getSession().setAttribute("teacherId", tsid);
		teacher = teacherService.getTeacherById(tsid);
		return "showTeacherInfo";
	}
	public void juage() throws IOException{
		HttpServletResponse response = ServletActionContext.getResponse();
		PrintWriter out = response.getWriter();
		Teacher t = teacherService.getTeacherById(tsid);
		if(t!=null){
			out.print("alreadyExist");
		}else{
			out.print("noExist");
		}
	}
//	public static void main(String[] args) throws IOException {
//		new TeacherGetInfoByIdAction().juage();
//	}
}
