package com.andy.service;

import java.util.List;

import com.andy.dao.QuestionDao;
import com.andy.dao.QuestionDaoImpl;
import com.andy.entity.Question;

public class QuestionServiceImpl implements QuestionService{
	private QuestionDao questionDao = new QuestionDaoImpl();
	@Override
	public List<Question> getAllQuestions() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getAllAnwser() {
		return questionDao.getAllAnwser();
	}

	@Override
	public boolean addQuestion(Question question) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean updateQuestion(Question question) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean deleteQuestion(int id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<Question> getQuestionsByCourseId(String courseId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getAnwserByQuestionId(String questionId) {
		return questionDao.getAnwserByQuestionId(questionId);
	}
	
}
