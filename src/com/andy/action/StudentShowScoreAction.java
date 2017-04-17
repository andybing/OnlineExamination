package com.andy.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.andy.entity.Score;
import com.andy.service.ScoreService;
import com.andy.service.ScoreServiceImpl;
import com.opensymphony.xwork2.ActionSupport;

public class StudentShowScoreAction extends ActionSupport{
	private ScoreService scoreService = new ScoreServiceImpl();
	private List<Score> passedScore = new ArrayList<Score>();
	private List<Score> unPassedScore = new ArrayList<Score>();
	public List<Score> getPassedScore() {
		return passedScore;
	}

	public void setPassedScore(List<Score> passedScore) {
		this.passedScore = passedScore;
	}
	
	public ScoreService getScoreService() {
		return scoreService;
	}

	public void setScoreService(ScoreService scoreService) {
		this.scoreService = scoreService;
	}

	public List<Score> getUnPassedScore() {
		return unPassedScore;
	}

	public void setUnPassedScore(List<Score> unPassedScore) {
		this.unPassedScore = unPassedScore;
	}

	@Override
	public String execute() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		String studentId = (String) request.getSession().getAttribute("id");
		passedScore = scoreService.getPassedScore(studentId);
		unPassedScore = scoreService.getUnPassedScore(studentId);
		request.setAttribute("passedScore", passedScore);
		request.setAttribute("unPassedScore", unPassedScore);
		return "showScore";
	}
//	public static void main(String[] args) throws Exception {
//		new StudentShowScoreAction().execute();
//	}
}
