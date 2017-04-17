package com.andy.entity;

import java.util.Set;

public class Course {
	private String id;
	private String name;
	private Set<Teacher> teachers;
	private Set<Student> students;
	//private Set<Score> scores;
	public Course(){}
	public String getId() {
		return id;
	}
	public Course(String id, String name) {
		super();
		this.id = id;
		this.name = name;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Set<Teacher> getTeachers() {
		return teachers;
	}
	public void setTeachers(Set<Teacher> teachers) {
		this.teachers = teachers;
	}
	public Set<Student> getStudents() {
		return students;
	}
	public void setStudents(Set<Student> students) {
		this.students = students;
	}
//	public Set<Score> getScores() {
//		return scores;
//	}
//	public void setScores(Set<Score> scores) {
//		this.scores = scores;
//	}
	
}
