package com.andy.action;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.andy.entity.Teacher;
import com.andy.service.TeacherService;
import com.andy.service.TeacherServiceImpl;
import com.opensymphony.xwork2.ActionSupport;

public class TeacherGetAllNamesAction extends ActionSupport{
	private TeacherService teacherService = new TeacherServiceImpl();
	public void getAllNames() throws Exception {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		List<Teacher> teachers = teacherService.getAllTeachers();
		StringBuffer sb = new StringBuffer();
		for(Teacher t : teachers){
			sb.append(t.getName()+" ");
		}
		out.print(sb.toString());
	}
}
