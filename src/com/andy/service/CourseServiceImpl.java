package com.andy.service;

import java.util.List;
import java.util.Set;

import com.andy.dao.CourseDao;
import com.andy.dao.CourseDaoImpl;
import com.andy.entity.Course;
import com.andy.entity.Score;
import com.andy.entity.Teacher;

public class CourseServiceImpl implements CourseService{
	private CourseDao courseDao = new CourseDaoImpl();
	@Override
	public List<String> getAllNames() {
		return courseDao.getAllNames();
	}
	@Override
	public Set<Teacher> getAllTeachers(String courseName) {
		return courseDao.getAllTeachers(courseName);
	}
	@Override
	public Course getCourseByName(String courseName) {
		return courseDao.getCourseByName(courseName);
	}
	@Override
	public boolean addCourse(Course course) {
		return courseDao.addCourse(course);
	}
	@Override
	public boolean setTeacher(Course course, Teacher teacher) {
		return courseDao.setTeacher(course, teacher);
	}

}
