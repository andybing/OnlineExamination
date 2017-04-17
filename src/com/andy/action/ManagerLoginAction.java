package com.andy.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.andy.entity.Manager;
import com.andy.entity.Student;
import com.andy.service.ManagerService;
import com.andy.service.ManagerServiceImpl;
import com.opensymphony.xwork2.ActionSupport;

public class ManagerLoginAction extends ActionSupport{
	private ManagerService managerService = new ManagerServiceImpl();
	private String mid;
	private String mname;
	private String mpassword;
	private String mcode;
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getMpassword() {
		return mpassword;
	}
	public void setMpassword(String mpassword) {
		this.mpassword = mpassword;
	}
	public String getMcode() {
		return mcode;
	}
	public void setMcode(String mcode) {
		this.mcode = mcode;
	}
	public void login() throws IOException{
		
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		PrintWriter out = ServletActionContext.getResponse().getWriter();
		String code_session = (String) session.getAttribute("code_session");
		if(mcode.equalsIgnoreCase(code_session)){
			if(managerService.login(new Manager(mid,mname,mpassword))){
				session.setAttribute("mname", mname);
				session.setAttribute("mid", mid);
				out.print("yes");
			}else{
				out.print("no");
			}
		}else{
			out.print("codeError");
		}
	}
}
