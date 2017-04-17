package com.andy.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.andy.dao.QuestionDao;
import com.andy.dao.QuestionDaoImpl;
import com.opensymphony.xwork2.ActionSupport;

public class DeleteQuestionAction extends ActionSupport{
	private QuestionDao questionDao = new QuestionDaoImpl();
	private String id3 ;

	public String getId3() {
		return id3;
	}

	public void setId3(String id3) {
		this.id3 = id3;
	}
	public void delete() throws IOException{
		HttpServletResponse response = ServletActionContext.getResponse();
		PrintWriter out = response.getWriter();
		if(questionDao.deleteQuestion(Integer.parseInt(id3))){
			out.print("yes");
		}else{
			out.print("no");
		}
		//System.out.println("123");
	}
}
