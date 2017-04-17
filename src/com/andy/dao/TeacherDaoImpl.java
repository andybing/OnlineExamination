package com.andy.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.andy.entity.Student;
import com.andy.entity.Teacher;
import com.andy.util.HibernateSessionUtil;

public class TeacherDaoImpl implements TeacherDao{
	private Session session = HibernateSessionUtil.getCurrentSession();
	@Override
	public Teacher getTeacherById(String id) {
		//Query query = session.createQuery("from Student where id = '"+id+"'");
		//List<Student> students = query.list();
		//return students.get(0);
		Teacher teacher = (Teacher) session.get(Teacher.class, id);
		return teacher;
	}
	@Override
	public boolean modifyPassword(String id, String newPassword) {
		Teacher teacher = (Teacher)session.get(Teacher.class, id);
		Transaction transaction = session.beginTransaction();
		teacher.setPassword(newPassword);
		transaction.commit();
		return true;
	}
	@Override
	public Teacher getTeacherByName(String teacherName) {
		Query query = session.createQuery("from Teacher where name=?");
		query.setString(0, teacherName);
		Teacher t = (Teacher) query.list().get(0);
		return t;
	}
	@Override
	public boolean addTeacher(Teacher teacher) {
		Transaction transaction = session.beginTransaction();
		Teacher t =(Teacher) session.get(Teacher.class, teacher.getId());
		if(t != null){
			return false;
		}
		session.save(teacher);
		transaction.commit();
		return true;
	}
	@Override
	public boolean deleteTeacher(String teacherId) {
		Transaction transaction = session.beginTransaction();
		Teacher t = (Teacher)session.get(Teacher.class, teacherId);
		if(t == null){
			return false;
		}
		session.delete(t);
		transaction.commit();
		return true;
	}
	@Override
	public boolean updateTeacher(String id, Teacher teacher) {
		Transaction transaction = session.beginTransaction();
		Teacher t = (Teacher)session.get(Teacher.class, id);
		t.setName(teacher.getName());
		t.setSex(teacher.getSex());
		t.setLocation(teacher.getLocation());
		session.saveOrUpdate(t);
		transaction.commit();
		return true;
	}
//	public static void main(String[] args) {
//		new TeacherDaoImpl().updateTeacher("001", new Teacher("吴老师","男","青岛"));
//	}
	@Override
	public List<Teacher> getAllTeachers() {
		Query query = session.createQuery("from Teacher");
		List<Teacher> teachers = query.list();
		return teachers;
	}
}
