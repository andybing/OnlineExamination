package com.andy.entity;

public class Question {
	private String id;
	private String ques;
	private String choose1 ;
	private String choose2 ;
	private String choose3 ;
	private String choose4;
	private String anwser;
	private Course course;
	public Question(){}
	public Question(String id,String question,String choose1,String choose2,String choose3,String choose4,String anwser){
		this.id = id;
		this.ques = question;
		this.choose1 = choose1;
		this.choose2 = choose2;
		this.choose3 = choose3;
		this.choose4 = choose4;
		this.anwser = anwser;
	}
	public String getQuestion() {
		return ques;
	}
	public void setQuestion(String question) {
		this.ques = question;
	}
	public String getChoose1() {
		return choose1;
	}
	public void setChoose1(String choose1) {
		this.choose1 = choose1;
	}
	public String getChoose2() {
		return choose2;
	}
	public void setChoose2(String choose2) {
		this.choose2 = choose2;
	}
	public String getChoose3() {
		return choose3;
	}
	public void setChoose3(String choose3) {
		this.choose3 = choose3;
	}
	public String getChoose4() {
		return choose4;
	}
	public void setChoose4(String choose4) {
		this.choose4 = choose4;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getQues() {
		return ques;
	}
	public void setQues(String ques) {
		this.ques = ques;
	}
	public String getAnwser() {
		return anwser;
	}
	public void setAnwser(String anwser) {
		this.anwser = anwser;
	}
	public Course getCourse() {
		return course;
	}
	public void setCourse(Course course) {
		this.course = course;
	}
	@Override
	public boolean equals(Object obj) {
		Question question = (Question)obj;
		return this.ques.equals(question.getQues());
	}
	@Override
	public int hashCode() {
		return this.ques.hashCode();
	}
}
