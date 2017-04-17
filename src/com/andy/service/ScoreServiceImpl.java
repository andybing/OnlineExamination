package com.andy.service;

import java.util.List;

import com.andy.dao.ScoreDao;
import com.andy.dao.ScoreDaoImpl;
import com.andy.entity.Score;

public class ScoreServiceImpl implements ScoreService{
	private ScoreDao scoreDao = new ScoreDaoImpl();
	@Override
	public boolean saveScore(Score score) {
		return scoreDao.saveScore(score);
		
	}
	@Override
	public List<Score> getPassedScore(String studentId) {
		return scoreDao.getPassedScore(studentId);
	}
	@Override
	public List<Score> getUnPassedScore(String studentId) {
		return scoreDao.getUnPassedScore(studentId);
	}
	@Override
	public List<Score> getAllScore(String courseName, String teacherName,String studentName) {
		return scoreDao.getAllScore(courseName, teacherName,studentName);
	}
	@Override
	public List<Score> getPassedScore(String courseName, String teacherName,String studentName) {
		return scoreDao.getPassedScore(courseName, teacherName,studentName);
	}
	@Override
	public List<Score> getUnpassedScore(String courseName, String teacherName,String studentName) {
		return scoreDao.getUnpassedScore(courseName, teacherName,studentName);
	}
	
}
