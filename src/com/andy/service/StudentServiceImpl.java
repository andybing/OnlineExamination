package com.andy.service;

import java.util.List;

import com.andy.dao.StudentDao;
import com.andy.dao.StudentDaoImpl;
import com.andy.entity.Student;

public class StudentServiceImpl implements StudentService{
	private StudentDao studentDao = new StudentDaoImpl();
	@Override
	public boolean login(Student student) {
		//System.out.println(student.getName()+" "+student.getId()+" "+student.getPassword());
		Student student_db = studentDao.getStudentById(student.getId());
		if(student!=null){
			if(student.equals(student_db)){
				return true;
			}
		}
		return false;
	}
	@Override
	public boolean modifyPassword(String id,String oldPassword ,String newPassword) {
		Student student = studentDao.getStudentById(id);
		if(oldPassword.equals(student.getPassword())){
			return studentDao.modifyPassword(id, newPassword);
		}else{
			return false;
		}
		
	}
	@Override
	public Student getStudentById(String id) {
		return studentDao.getStudentById(id);
	}
	@Override
	public boolean addStudent(Student student) {
		return studentDao.addStudent(student);
	}
	@Override
	public boolean deleteStudent(String studentId) {
		return studentDao.deleteStudent(studentId);
	}
	@Override
	public boolean updateStudent(String id, Student student) {
		return studentDao.updateStudent(id, student);
	}
	@Override
	public List<String> getAllNames() {
		return studentDao.getAllNames();
	}

}
