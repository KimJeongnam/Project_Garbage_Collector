package com.spring.project.professor.vo;

public class PlanVO {
	
	private String empNumber;
	private String lecCode;
	private String lectureName;
	private String week;
	private String lecStatus;
	private String delStatus;
	private String contents;
	private String text;
	
	
	public String getLecCode() {
		return lecCode;
	}
	public void setLecCode(String lecCode) {
		this.lecCode = lecCode;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public String getEmpNumber() {
		return empNumber;
	}
	public void setEmpNumber(String empNumber) {
		this.empNumber = empNumber;
	}
	public String getLectureName() {
		return lectureName;
	}
	public void setLectureName(String lectureName) {
		this.lectureName = lectureName;
	}
	public String getWeek() {
		return week;
	}
	public void setWeek(String week) {
		this.week = week;
	}
	public String getLecStatus() {
		return lecStatus;
	}
	public void setLecStatus(String lecStatus) {
		this.lecStatus = lecStatus;
	}
	public String getDelStatus() {
		return delStatus;
	}
	public void setDelStatus(String delStatus) {
		this.delStatus = delStatus;
	}
	
	
	
}
