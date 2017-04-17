package com.andy.dao;

import java.util.List;

import com.andy.entity.Student;

public interface StudentDao {
	public Student getStudentById(String id);
	public boolean modifyPassword(String id,String newPassword);
	public boolean addStudent(Student student);
	public boolean deleteStudent(String studentId);
	public boolean updateStudent(String id,Student student);
	public List<String> getAllNames();
}
