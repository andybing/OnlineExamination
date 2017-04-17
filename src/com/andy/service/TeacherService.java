package com.andy.service;

import java.util.List;

import com.andy.entity.Teacher;

public interface TeacherService {
	public Teacher getTeacherById(String id);
	public Teacher getTeacherByName(String teacherName);
	public boolean login(Teacher teacher);
	public boolean modifyPassword(String id,String oldPassword,String newPassword);
	public boolean addTeacher(Teacher teacher);
	public boolean deleteTeacher(String teacherId);
	public boolean updateTeacher(String id,Teacher teacher);
	public List<Teacher> getAllTeachers();
}
