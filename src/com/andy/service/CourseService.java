package com.andy.service;

import java.util.List;
import java.util.Set;

import com.andy.entity.Course;
import com.andy.entity.Score;
import com.andy.entity.Teacher;

public interface CourseService {
	public List<String> getAllNames();
	public Set<Teacher> getAllTeachers(String courseName);
	public Course getCourseByName(String courseName);
	public boolean addCourse(Course course);
	public boolean setTeacher(Course course, Teacher teacher);
}	
