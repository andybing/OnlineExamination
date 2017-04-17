package com.andy.dao;

import java.util.List;

import com.andy.entity.Teacher;

public interface TeacherDao {
	public Teacher getTeacherById(String id);
	public boolean modifyPassword(String id,String newPassword);
	public Teacher getTeacherByName(String teacherName);
	public boolean addTeacher(Teacher teacher);
	public boolean deleteTeacher(String teacherId);
	public boolean updateTeacher(String id,Teacher teacher);
	public List<Teacher> getAllTeachers();
}
