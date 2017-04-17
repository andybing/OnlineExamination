package com.andy.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.andy.dao.QuestionDao;
import com.andy.dao.QuestionDaoImpl;
import com.andy.entity.Course;
import com.andy.entity.Question;
import com.andy.service.CourseService;
import com.andy.service.CourseServiceImpl;
import com.opensymphony.xwork2.ActionSupport;

public class AddQuestionAction extends ActionSupport{
	private QuestionDao questionDao = new QuestionDaoImpl();
	private CourseService courseService = new CourseServiceImpl();
	private String id;
	private String ques;
	private String choose1;
	private String choose2;
	private String choose3;
	private String choose4;
	private String anwser;
	private String courseName;
	
	public String getCourseName() {
		return courseName;
	}
	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getQues() {
		return ques;
	}
	public void setQues(String ques) {
		this.ques = ques;
	}
	public String getChoose1() {
		return choose1;
	}
	public void setChoose1(String choose1) {
		this.choose1 = choose1;
	}
	public String getChoose2() {
		return choose2;
	}
	public void setChoose2(String choose2) {
		this.choose2 = choose2;
	}
	public String getChoose3() {
		return choose3;
	}
	public void setChoose3(String choose3) {
		this.choose3 = choose3;
	}
	public String getChoose4() {
		return choose4;
	}
	public void setChoose4(String choose4) {
		this.choose4 = choose4;
	}
	
	public String getAnwser() {
		return anwser;
	}
	public void setAnwser(String anwser) {
		this.anwser = anwser;
	}
	public void add() throws IOException{
		//System.out.println(id+"-"+ques+"-"+choose1+"-"+choose2+"-"+choose3+"-"+choose4+"-"+anwser+"-"+courseName);
		Question question = new Question(id,ques,choose1,choose2,choose3,choose4,anwser);
		Course c = courseService.getCourseByName(courseName);
		question.setCourse(c);
		HttpServletResponse response = ServletActionContext.getResponse();
		PrintWriter out = response.getWriter();
		if(questionDao.addQuestion(question)){
			out.print("yes");
		}else{
			out.print("no");
		}
	}
}
