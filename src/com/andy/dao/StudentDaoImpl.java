package com.andy.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.chainsaw.Main;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.andy.entity.Course;
import com.andy.entity.Student;
import com.andy.util.HibernateSessionUtil;

public class StudentDaoImpl implements StudentDao{
	private Session session = HibernateSessionUtil.getCurrentSession();
	@Override
	public Student getStudentById(String id) {
		//Query query = session.createQuery("from Student where id = '"+id+"'");
		//List<Student> students = query.list();
		//return students.get(0);
		Student student = (Student) session.get(Student.class, id);
		return student;
	}
	@Override
	public boolean modifyPassword(String id, String newPassword) {
		Student student = (Student)session.load(Student.class, id);
		Transaction transaction = session.beginTransaction();
		student.setPassword(newPassword);
		transaction.commit();
		return true;
	}
	@Override
	public boolean addStudent(Student student) {
		Transaction transaction = session.beginTransaction();
		Student s =(Student) session.get(Student.class, student.getId());
		if(s != null){
			return false;
		}
		session.save(student);
		transaction.commit();
		return true;
	}
	@Override
	public boolean deleteStudent(String studentId) {
		Transaction transaction = session.beginTransaction();
		Student student =(Student) session.get(Student.class, studentId);
		if(student==null){
			return false;
		}
		session.delete(student);
		transaction.commit();
		return true;
	}
//	public static void main(String[] args) {
//		new StudentDaoImpl().getStudentById("201207031");
//	}
	@Override
	public boolean updateStudent(String id, Student student) {
		Transaction transaction = session.beginTransaction();
		Student s = (Student)session.get(Student.class, id);
		s.setName(student.getName());
		s.setSex(student.getSex());
		s.setClas(student.getClas());
		s.setLocation(student.getLocation());
		s.setGrade(student.getGrade());
		session.saveOrUpdate(s);
		transaction.commit();
		return true;
	}
	@Override
	public List<String> getAllNames() {
		List<String> names = new ArrayList<String>();
		Query query = session.createQuery("from Student");
		List<Student> students = query.list();
		for(Student s : students){
			names.add(s.getName());
		}
		return names;
	}
}
