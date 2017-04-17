package com.andy.service;

import java.util.List;

import com.andy.entity.Score;

public interface ScoreService {
	public boolean saveScore(Score score);
	public List<Score> getPassedScore(String studentId);
	public List<Score> getUnPassedScore(String studentId);
	public List<Score> getAllScore(String courseName,String teacherName,String studentName);
	public List<Score> getPassedScore(String courseName,String teacherName,String studentName);
	public List<Score> getUnpassedScore(String courseName,String teacherName,String studentName);
}
