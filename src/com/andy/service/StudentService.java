package com.andy.service;

import java.util.List;

import com.andy.entity.Student;

public interface StudentService {
	public Student getStudentById(String id);
	public boolean login(Student student);
	public boolean modifyPassword(String id,String oldPassword,String newPassword);
	public boolean addStudent(Student student);
	public boolean deleteStudent(String studentId);
	public boolean updateStudent(String id,Student student);
	public List<String> getAllNames();
}
