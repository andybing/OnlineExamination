package com.andy.dao;

import java.util.List;

import com.andy.entity.Score;

public interface ScoreDao {
	public boolean saveScore(Score score);
	public boolean isAnswered(Score score);
	public List<Score> getPassedScore(String studentId);
	public List<Score> getUnPassedScore(String studentId);
	public List<Score> getAllScore(String courseName,String teacherName,String studentName);
	public List<Score> getPassedScore(String courseName,String teacherName,String studentName);
	public List<Score> getUnpassedScore(String courseName,String teacherName,String studentName);
}
