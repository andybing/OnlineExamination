package com.andy.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.andy.entity.Course;
import com.andy.entity.Score;
import com.andy.entity.Teacher;
import com.andy.util.HibernateSessionUtil;

public class CourseDaoImpl implements CourseDao{
	Session session = HibernateSessionUtil.getCurrentSession();
	@Override
	public List<String> getAllNames() {
		List<String> names = new ArrayList<String>();
		Query query = session.createQuery("from Course");
		List<Course> courses = query.list();
		for(Course c : courses){
			names.add(c.getName());
		}
		return names;
	}
	@Override
	public Set<Teacher> getAllTeachers(String courseName) {
		Query query = session.createQuery("from Course where name=?");
		query.setString(0, courseName);
		Course course = (Course)query.list().get(0);
		Set<Teacher> teachers = course.getTeachers();
		return teachers;
	}
//	public static void main(String[] args) {
//		new CourseDaoImpl().getAllTeachers("C语言");
//	}
	@Override
	public Course getCourseByName(String courseName) {
		Query query = session.createQuery("from Course where name=?");
		query.setString(0, courseName);
		Course course = (Course)query.list().get(0);
		return course;
	}
	@Override
	public boolean addCourse(Course course) {
		Transaction transaction = session.beginTransaction();
		Course c = (Course)session.get(Course.class, course.getId());
		if(c!=null){
			return false;
		}
		session.save(course);
		transaction.commit();
		return true;
	}
	
	public static void main(String[] args) {
		new CourseDaoImpl().addCourse(null);
	}
	@Override
	public boolean setTeacher(Course course, Teacher teacher) {
		Transaction transaction = session.beginTransaction();
		Set<Teacher> teachers = course.getTeachers();
		teachers.add(teacher);
		course.setTeachers(teachers);
		session.saveOrUpdate(course);
		transaction.commit();
		return true;
	}
}
