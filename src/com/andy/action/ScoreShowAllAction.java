package com.andy.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.andy.entity.Score;
import com.andy.service.ScoreService;
import com.andy.service.ScoreServiceImpl;
import com.opensymphony.xwork2.ActionSupport;

public class ScoreShowAllAction extends ActionSupport{
	private ScoreService scoreService = new ScoreServiceImpl();
	private List<Score> allScore = new ArrayList<Score>();
	private List<Score> jigeScore = new ArrayList<Score>();
	private List<Score> bujigeScore = new ArrayList<Score>();
	public List<Score> getAllScore() {
		return allScore;
	}
	public void setAllScore(List<Score> allScore) {
		this.allScore = allScore;
	}
	public List<Score> getJigeScore() {
		return jigeScore;
	}
	public void setJigeScore(List<Score> jigeScore) {
		this.jigeScore = jigeScore;
	}
	public List<Score> getBujigeScore() {
		return bujigeScore;
	}
	public void setBujigeScore(List<Score> bujigeScore) {
		this.bujigeScore = bujigeScore;
	}
	@Override
	public String execute() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		String courseName =(String) request.getSession().getAttribute("courseName");
		String teacherName = (String) request.getSession().getAttribute("teacherName");
		String studentName = (String) request.getSession().getAttribute("studentName");
		allScore = scoreService.getAllScore(courseName, teacherName,studentName);
		jigeScore = scoreService.getPassedScore(courseName, teacherName,studentName);
		bujigeScore = scoreService.getUnpassedScore(courseName, teacherName,studentName);
		return "showAllScore";
	}
}
