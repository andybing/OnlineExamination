package com.andy.dao;

import java.util.List;
import java.util.Set;


import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.andy.entity.Question;
import com.andy.util.HibernateSessionUtil;

public class QuestionDaoImpl implements QuestionDao{
	private Session session = HibernateSessionUtil.getCurrentSession();
	@Override
	public List<Question> getAllQuestions() {
		Query query = session.createQuery("from Question order by Id");
		List<Question> questions = query.list();
		return questions;
	}
	@Override
	public String getAllAnwser() {
		String anwser = "";
		Query query = session.createQuery("from Question order by Id");
		List<Question> anwsers = query.list();
		for(Question q : anwsers){
			anwser+=q.getAnwser()+" ";
		}
		return anwser;
	}
	@Override
	public boolean addQuestion(Question question) {
		Transaction transaction = session.beginTransaction();
		try {
			Query query = session.createQuery("from Question where id = '"+question.getId()+"'");
			if(query.list().size()>0){
				return false;
			}
			session.save(question);
			transaction.commit();
			return true;
		} catch (Exception e) {
			//e.printStackTrace();
			transaction.rollback();
			return false;
		}
	}
	@Override
	public boolean updateQuestion(Question question) {
		Transaction transaction = session.beginTransaction();
		try {
			Query query = session.createQuery("from Question where id = '"+question.getId()+"'");
			if(query.list().size()>0){
				session.merge(question);
				transaction.commit();
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
			transaction.rollback();
		}
		return false;
	}
	@Override
	public boolean deleteQuestion(int id) {
		Transaction transaction = session.beginTransaction();
		try {
			Query query = session.createQuery("from Question where id = '"+id+"'");
			if(query.list().size()>0){
				Question question = (Question) session.load(Question.class, id);
				session.delete(question);
				transaction.commit();
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
			transaction.rollback();
		}
		return false;
	}
	@Override
	public List<Question> getQuestionsByCourseId(String courseId) {
		Query query = session.createQuery("from Question where courseId=?");
		query.setString(0, courseId);
		List<Question> questions = query.list();
		return questions;
	}
	@Override
	public String getAnwserByQuestionId(String questionId) {
		Question q = (Question) session.get(Question.class, questionId);
		return q.getAnwser();
	}
	public static void main(String[] args) {
		new QuestionDaoImpl().getQuestionsByCourseId("c003");
	}
}
