package com.spring.project.admin.vo;

import java.sql.Date;

public class auditVO {
	private String userName;
	private int grade;
	private int semester;
	private String scholarName;
	private Date year;
	private int statCode;
	
	
	
	public Date getYear() {
		return year;
	}
	public void setYear(Date year) {
		this.year = year;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public int getSemester() {
		return semester;
	}
	public void setSemester(int semester) {
		this.semester = semester;
	}
	public String getScholarName() {
		return scholarName;
	}
	public void setScholarName(String scholarName) {
		this.scholarName = scholarName;
	}
	public int getStatCode() {
		return statCode;
	}
	public void setStatCode(int statCode) {
		this.statCode = statCode;
	}
	
	

}
