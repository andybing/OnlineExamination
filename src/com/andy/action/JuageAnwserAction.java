package com.andy.action;

import java.io.PrintWriter;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import com.andy.entity.Course;
import com.andy.entity.Question;
import com.andy.entity.Score;
import com.andy.entity.Student;
import com.andy.entity.Teacher;
import com.andy.service.CourseService;
import com.andy.service.CourseServiceImpl;
import com.andy.service.QuestionService;
import com.andy.service.QuestionServiceImpl;
import com.andy.service.ScoreService;
import com.andy.service.ScoreServiceImpl;
import com.andy.service.StudentService;
import com.andy.service.StudentServiceImpl;
import com.andy.service.TeacherService;
import com.andy.service.TeacherServiceImpl;
import com.opensymphony.xwork2.ActionSupport;

public class JuageAnwserAction extends ActionSupport{
	private String anwser;
	private QuestionService questionService = new QuestionServiceImpl();
	private CourseService courseService = new CourseServiceImpl();
	private StudentService studentService = new StudentServiceImpl();
	private TeacherService teacherService = new TeacherServiceImpl();
	private ScoreService scoreService = new ScoreServiceImpl();
	public String getAnwser() {
		return anwser;
	}

	public void setAnwser(String anwser) {
		this.anwser = anwser;
	}
	public void juage() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		PrintWriter out = response.getWriter();
		int score = 0;
		String[] anwser1 = anwser.split(" ");
		Set<Question> questions = (Set<Question>) request.getSession().getAttribute("questions");
		StringBuffer anwser_db = new StringBuffer();
		for(Question q:questions){
			anwser_db.append(questionService.getAnwserByQuestionId(q.getId())+" ");
		}
		String[] anwser2 = anwser_db.toString().split(" ");
		for(int i = 0;i<anwser1.length;i++){
			if(anwser1[i].equals(anwser2[i])){
				score += 1;
			}
		}
		//out.write("{score:'"+score+"'}");
		//现在答得是那门课
		String courseName =(String) request.getSession().getAttribute("courseName");
		if(courseName.endsWith("  ") && courseName.length()==3){
			courseName="C++";
		}
		//哪个老师
		String teacherName = (String) request.getSession().getAttribute("teacherName");
		//哪个学生
		String studentId = (String) request.getSession().getAttribute("id");
		String studentName = (String) request.getSession().getAttribute("name");
		//获取现在答得课程的实体
		Course course = courseService.getCourseByName(courseName);
		//获取现在答题学生的实体
		Student student = studentService.getStudentById(studentId);
		Set<Student> students = new HashSet<Student>();
		students.add(student);
		//获取现在课程所属老师的实体
		Teacher teacher = teacherService.getTeacherByName(teacherName);
		
		//新建成绩实体
		Score s = new Score(student.getId(),studentName,teacher.getId(),
				teacher.getName(),course.getId(),courseName,score*20,score*20>=60?"及格":"不及格");
		//Set<Score> scores = new HashSet<Score>();
		//scores.add(s);
		//给当前课程设置  成绩，学生，老师
		//course.setStudents(students);
		//course.setScores(scores);
		//courseService.saveScore(course,s);
		if(scoreService.saveScore(s)){
			out.print(score);
		}else{
			out.print("again");
		}
		
	}
	public static void main(String[] args) throws Exception {
		new JuageAnwserAction().juage();
	}
}
