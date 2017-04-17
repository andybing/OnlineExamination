package com.andy.action;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Random;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.andy.dao.QuestionDao;
import com.andy.dao.QuestionDaoImpl;
import com.andy.entity.Course;
import com.andy.entity.Question;
import com.andy.service.CourseService;
import com.andy.service.CourseServiceImpl;
import com.opensymphony.xwork2.ActionSupport;

public class QuestionMainAction extends ActionSupport{
	private CourseService courseService = new CourseServiceImpl();
	private Set<Question> questions = new HashSet<Question>();
	private int size ;
	
	public void setSize(int size) {
		this.size = size;
	}
	public int getSize() {
		return questions.size();
	}
	public Set<Question> getQuestions() {
		return questions;
	}
	public void setQuestions(Set<Question> questions) {
		this.questions = questions;
	}
	private QuestionDao questionDao = new QuestionDaoImpl();
	@Override
	public String execute() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		String courseName =(String) request.getSession().getAttribute("courseName");
		if(courseName.length() ==3 && courseName.endsWith("  ")){
			courseName = "C++";
		}
		Course course = courseService.getCourseByName(courseName);
		List<Question> qs = new ArrayList<Question>();
		qs = questionDao.getQuestionsByCourseId(course.getId());
		if(qs.size()>=5){
			for(int i = 0;i<qs.size()*2;i++){
				questions.add(qs.get(Integer.parseInt(Math.round(Math.random()*9)+"")));
				if(questions.size() == 5){
					break;
				}
			}
		}
		size = questions.size();
		request.getSession().setAttribute("questions", questions);
		return "questionmain";
	}
}
