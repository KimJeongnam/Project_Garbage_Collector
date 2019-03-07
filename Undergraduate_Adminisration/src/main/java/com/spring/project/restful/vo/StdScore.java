package com.spring.project.restful.vo;

public class StdScore {
	private String year;
	private String semester;
	private String avgscore;
	private String lectureCount;
	private String passScore;
	private String grade;
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
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
	public String getAvgscore() {
		return avgscore;
	}
	public void setAvgscore(String avgscore) {
		this.avgscore = avgscore;
	}
	public String getLectureCount() {
		return lectureCount;
	}
	public void setLectureCount(String lectureCount) {
		this.lectureCount = lectureCount;
	}
	public String getPassScore() {
		return passScore;
	}
	public void setPassScore(String passScore) {
		this.passScore = passScore;
	}
}
