package com.andy.action;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.andy.service.CourseService;
import com.andy.service.CourseServiceImpl;
import com.opensymphony.xwork2.ActionSupport;

public class CourseGetAllNamesAction extends ActionSupport{
	private CourseService courseService = new CourseServiceImpl();
	
	public void getNames() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		List<String> names = courseService.getAllNames();
		StringBuffer sb = new StringBuffer();
		for(String s : names){
			sb.append(s+" ");
		}
		out.print(sb.toString());
	}
}
