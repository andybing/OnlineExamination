package com.andy.entity;

public class Manager {
	private String id;
	private String name;
	private String password;
	public Manager(){}
	public Manager(String id, String name, String password) {
		this.id = id;
		this.name = name;
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
	@Override
	public boolean equals(Object obj) {
		Manager manager = (Manager)obj;
		return this.id.equals(manager.getId()) && this.name.equals(manager.getName()) && this.password.equals(manager.getPassword());
	}
	@Override
	public int hashCode() {
		return this.id.hashCode()+this.name.hashCode()+this.password.hashCode();
	}
}
