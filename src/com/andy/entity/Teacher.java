package com.andy.entity;

public class Teacher {
	private String id;
	private String name;
	private String sex;
	private String location;
	private String password;
	public Teacher(){}
//	public Teacher(String id,String name,String sex,String location,String password){
//		this.id = id;
//		this.name = name;
//		this.sex = sex;
//		this.location = location;
//	}
	
	public Teacher(String id, String name, String sex,
			String location, String password) {
		super();
		this.id = id;
		this.name = name;
		this.sex = sex;
		this.location = location;
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
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	@Override
	public boolean equals(Object obj) {
		Teacher teacher = (Teacher)obj;
		return this.id.equals(teacher.getId()) && this.name.equals(teacher.getName()) && this.password.equals(teacher.getPassword());
	}
	@Override
	public int hashCode() {
		return this.id.hashCode()+this.name.hashCode()+this.password.hashCode();
	}
}
