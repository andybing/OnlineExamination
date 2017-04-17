package com.andy.service;

import java.util.List;

import com.andy.dao.TeacherDao;
import com.andy.dao.TeacherDaoImpl;
import com.andy.entity.Teacher;

public class TeacherServiceImpl implements TeacherService{
	private TeacherDao teacherDao = new TeacherDaoImpl();
	@Override
	public boolean login(Teacher teacher) {
		//System.out.println(teacher.getName()+" "+teacher.getId()+" "+teacher.getPassword());
		Teacher teacher_db = teacherDao.getTeacherById(teacher.getId());
		if(teacher!=null){
			if(teacher.equals(teacher_db)){
				return true;
			}
		}
		return false;
	}
	@Override
	public boolean modifyPassword(String id,String oldPassword ,String newPassword) {
		Teacher teacher = teacherDao.getTeacherById(id);
		if(oldPassword.equals(teacher.getPassword())){
			return teacherDao.modifyPassword(id, newPassword);
		}else{
			return false;
		}
		
	}
	@Override
	public Teacher getTeacherById(String id) {
		return teacherDao.getTeacherById(id);
	}
	@Override
	public Teacher getTeacherByName(String teacherName) {
		return teacherDao.getTeacherByName(teacherName);
	}
	@Override
	public boolean addTeacher(Teacher teacher) {
		return teacherDao.addTeacher(teacher);
	}
	@Override
	public boolean deleteTeacher(String teacherId) {
		return teacherDao.deleteTeacher(teacherId);
	}
	@Override
	public boolean updateTeacher(String id, Teacher teacher) {
		return teacherDao.updateTeacher(id, teacher);
	}
	@Override
	public List<Teacher> getAllTeachers() {
		return teacherDao.getAllTeachers();
	}
}
