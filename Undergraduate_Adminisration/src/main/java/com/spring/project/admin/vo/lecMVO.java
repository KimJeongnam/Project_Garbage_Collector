package com.spring.project.admin.vo;

import java.sql.Date;

public class lecMVO {

	private String year;
	private String semester;
	private Date startSelectLecture;
	private Date endSelectLecture;
	private Date openingDay;
	private Date gradeOpeningDay;
	private Date endingDay;
	
	
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getSemester() {
		return semester;
	}
	public void setSemester(String semester) {
		this.semester = semester;
	}
	public Date getStartSelectLecture() {
		return startSelectLecture;
	}
	public void setStartSelectLecture(Date startSelectLecture) {
		this.startSelectLecture = startSelectLecture;
	}
	public Date getEndSelectLecture() {
		return endSelectLecture;
	}
	public void setEndSelectLecture(Date endSelectLecture) {
		this.endSelectLecture = endSelectLecture;
	}
	public Date getOpeningDay() {
		return openingDay;
	}
	public void setOpeningDay(Date openingDay) {
		this.openingDay = openingDay;
	}
	public Date getGradeOpeningDay() {
		return gradeOpeningDay;
	}
	public void setGradeOpeningDay(Date gradeOpeningDay) {
		this.gradeOpeningDay = gradeOpeningDay;
	}
	public Date getEndingDay() {
		return endingDay;
	}
	public void setEndingDay(Date endingDay) {
		this.endingDay = endingDay;
	}
	
	
	
	
	
	
}
