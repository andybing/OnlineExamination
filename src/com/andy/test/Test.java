package com.andy.test;

import java.util.HashSet;
import java.util.Set;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.andy.entity.Course;
import com.andy.entity.Question;
import com.andy.entity.Teacher;
import com.andy.util.HibernateSessionUtil;

public class Test {
	public static void main(String[] args) {
		Session session = HibernateSessionUtil.getCurrentSession();
		Transaction transaction = session.beginTransaction();
//		Course c = new Course();
//		c.setId("c003");
//		c.setName("c");
		Course c =(Course) session.load(Course.class, "c001");
//		Set<Teacher> teachers = c.getTeachers();
//		Teacher t1 =(Teacher) session.load(Teacher.class, "002");
//		Teacher t2 =(Teacher) session.load(Teacher.class, "001");
//		teachers.add(t1);
//		teachers.add(t2);
//		c.setTeachers(teachers);
//		System.out.println(teachers.size());
//		session.save(c);
		
		Question q = new Question();
		q.setQues("1");
		q.setChoose1("2");
		q.setChoose2("3");
		q.setChoose3("4");
		q.setChoose4("5");
		q.setAnwser("6");
		q.setCourse(c);
		session.save(q);
		transaction.commit();
	}
}
