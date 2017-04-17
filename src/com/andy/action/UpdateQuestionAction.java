package com.andy.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.andy.dao.QuestionDao;
import com.andy.dao.QuestionDaoImpl;
import com.andy.entity.Question;
import com.opensymphony.xwork2.ActionSupport;

public class UpdateQuestionAction extends ActionSupport{
	private QuestionDao questionDao = new QuestionDaoImpl();
	private String id2;
	private String ques2;
	private String choose12;
	private String choose22;
	private String choose32;
	private String choose42;
	private String anwser2;
	public QuestionDao getQuestionDao() {
		return questionDao;
	}
	public void setQuestionDao(QuestionDao questionDao) {
		this.questionDao = questionDao;
	}
	public String getId2() {
		return id2;
	}
	public void setId2(String id2) {
		this.id2 = id2;
	}
	public String getQues2() {
		return ques2;
	}
	public void setQues2(String ques2) {
		this.ques2 = ques2;
	}
	public String getChoose12() {
		return choose12;
	}
	public void setChoose12(String choose12) {
		this.choose12 = choose12;
	}
	public String getChoose22() {
		return choose22;
	}
	public void setChoose22(String choose22) {
		this.choose22 = choose22;
	}
	public String getChoose32() {
		return choose32;
	}
	public void setChoose32(String choose32) {
		this.choose32 = choose32;
	}
	public String getChoose42() {
		return choose42;
	}
	public void setChoose42(String choose42) {
		this.choose42 = choose42;
	}
	public String getAnwser2() {
		return anwser2;
	}
	public void setAnwser2(String anwser2) {
		this.anwser2 = anwser2;
	}
	public void update() throws IOException{
		Question question2 = new Question(id2,ques2,choose12,choose22,choose32,choose42,anwser2);
		HttpServletResponse response = ServletActionContext.getResponse();
		PrintWriter out = response.getWriter();
		//System.out.println(id2+ques2+choose12+choose22+choose32+choose42+anwser2);
		if(questionDao.updateQuestion(question2)){
			out.print("yes");
		}else{
			out.print("no");
		}
		
	}
}
