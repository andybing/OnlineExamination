package com.andy.service;

import java.util.List;

import com.andy.entity.Question;

public interface QuestionService {
	public List<Question> getAllQuestions();
	public List<Question> getQuestionsByCourseId(String courseId);
	public String getAllAnwser();
	public String getAnwserByQuestionId(String questionId);
	public boolean addQuestion(Question question);
	public boolean updateQuestion(Question question);
	public boolean deleteQuestion(int id);
}
