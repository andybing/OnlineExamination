package com.andy.entity;

public class Score {
	private int id;
	private String studentId;
	private String studentName;
	private String teacherId;
	private String teacherName;
	private String courseId;
	private String courseName;
	private double score;
	private String state;
	public Score(){}
	public Score(double score, String state) {
		this.score = score;
		this.state = state;
	}
	
	public Score(String studentId,String studentName, String teacherId, String teacherName,String courseId,
			String courseName,double score, String state) {
		super();
		this.studentId = studentId;
		this.studentName = studentName;
		this.teacherId = teacherId;
		this.teacherName = teacherName;
		this.courseId = courseId;
		this.courseName = courseName;
		this.score = score;
		this.state = state;
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public double getScore() {
		return score;
	}
	public void setScore(double score) {
		this.score = score;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}

	public String getStudentId() {
		return studentId;
	}

	public void setStudentId(String studentId) {
		this.studentId = studentId;
	}

	public String getTeacherId() {
		return teacherId;
	}

	public void setTeacherId(String teacherId) {
		this.teacherId = teacherId;
	}

	public String getCourseId() {
		return courseId;
	}

	public void setCourseId(String courseId) {
		this.courseId = courseId;
	}
	public String getStudentName() {
		return studentName;
	}
	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}
	public String getTeacherName() {
		return teacherName;
	}
	public void setTeacherName(String teacherName) {
		this.teacherName = teacherName;
	}
	public String getCourseName() {
		return courseName;
	}
	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}
	
}
