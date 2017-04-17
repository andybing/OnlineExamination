package com.andy.entity;

public class Student {
	private String id;
	private String name;
	private String sex;
	private String clas;
	private String location;
	private String grade;
	private String password;
	public Student(){}
	public Student(String id,String name,String password){
		this.id = id;
		this.name = name;
		this.password = password;
	}
	
	public Student(String name, String sex, String clas, String location,
			String grade) {
		this.name = name;
		this.sex = sex;
		this.clas = clas;
		this.location = location;
		this.grade = grade;
	}
	public Student(String id, String name, String sex, String clas,
			String location, String password) {
		this.id = id;
		this.name = name;
		this.sex = sex;
		this.clas = clas;
		this.location = location;
		this.password = password;
	}
	
	public Student(String id, String name, String sex, String clas,
			String location, String grade, String password) {
		super();
		this.id = id;
		this.name = name;
		this.sex = sex;
		this.clas = clas;
		this.location = location;
		this.grade = grade;
		this.password = password;
	}
	public String getId() {
		return id;
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
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getClas() {
		return clas;
	}
	public void setClas(String clas) {
		this.clas = clas;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	@Override
	public boolean equals(Object obj) {
		Student student = (Student)obj;
		return this.id.equals(student.getId()) && this.name.equals(student.getName()) && this.password.equals(student.getPassword());
	}
	@Override
	public int hashCode() {
		return this.id.hashCode()+this.name.hashCode()+this.password.hashCode();
	}
}
