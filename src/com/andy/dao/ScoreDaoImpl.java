package com.andy.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.andy.entity.Course;
import com.andy.entity.Score;
import com.andy.util.HibernateSessionUtil;

public class ScoreDaoImpl implements ScoreDao{
	Session session = HibernateSessionUtil.getCurrentSession();
	@Override
	public boolean saveScore(Score score) {
		Transaction t = session.beginTransaction();
		if(isAnswered(score)){
			return false;
		}
		session.save(score);
		t.commit();
		return true;
	}
	@Override
	public boolean isAnswered(Score score) {
		Query query = session.createQuery("from Score where courseId=?");
		query.setString(0, score.getCourseId());
		if(query.list().size()>0){
			return true;
		}
		return false;
	}
	public static void main(String[] args) {
		//new ScoreDaoImpl().isAnswered(new Score("201207031","于明启","001","吴老师","c001","JAVA",100,"及格"));
		//new ScoreDaoImpl().saveScore(new Score("201207031","于明启","001","吴老师","c002","JAVA",100,"及格"));
	}
	@Override
	public List<Score> getPassedScore(String studentId) {
		List<Score> passedScore = new ArrayList<Score>();
		Query query = session.createQuery("from Score where studentId=? and score>=60");
		query.setString(0, studentId);
		passedScore = query.list();
		return passedScore;
	}
	@Override
	public List<Score> getUnPassedScore(String studentId) {
		List<Score> unpassedScore = new ArrayList<Score>();
		Query query = session.createQuery("from Score where studentId=? and score<60");
		query.setString(0, studentId);
		unpassedScore = query.list();
		return unpassedScore;
	}
	@Override
	public List<Score> getAllScore(String courseName, String teacherName,String studentName) {
		List<Score> allScore = new ArrayList<Score>();
		Query query = null;
		if(studentName.equals("- - - - -")){
			query = session.createQuery("from Score where courseName=? and teacherName=? order by score desc");
			query.setString(0, courseName);
			query.setString(1, teacherName);
		}else{
			query = session.createQuery("from Score where courseName=? and teacherName=? and studentName=? order by score desc");
			query.setString(0, courseName);
			query.setString(1, teacherName);
			query.setString(2, studentName);
		}
		allScore = query.list();
		return allScore;
	}
	@Override
	public List<Score> getUnpassedScore(String courseName, String teacherName,String studentName) {
		List<Score> unpassedScore = new ArrayList<Score>();
		Query query = null;
		if(studentName.equals("- - - - -")){
			query = session.createQuery("from Score where courseName=? and teacherName=? and score<60");
			query.setString(0, courseName);
			query.setString(1, teacherName);
		}else{
			query = session.createQuery("from Score where courseName=? and teacherName=? and studentName=? and  score<60");
			query.setString(0, courseName);
			query.setString(1, teacherName);
			query.setString(2, studentName);
		}
		unpassedScore = query.list();
		return unpassedScore;
	}
	@Override
	public List<Score> getPassedScore(String courseName, String teacherName,String studentName) {
		List<Score> passedScore = new ArrayList<Score>();
		Query query = null;
		if(studentName.equals("- - - - -")){
			query = session.createQuery("from Score where courseName=? and teacherName=? and score>=60");
			query.setString(0, courseName);
			query.setString(1, teacherName);
		}else{
			query = session.createQuery("from Score where courseName=? and teacherName=? and studentName=? and score>=60");
			query.setString(0, courseName);
			query.setString(1, teacherName);
			query.setString(2, studentName);
		}
		passedScore = query.list();
		return passedScore;
	}
}
