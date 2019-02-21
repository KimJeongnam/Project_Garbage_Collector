package com.crontab.vo;

public class LectrueSelectPeriod {
	private String year;	 				// 년도
	private int semester;					// 학기
	private String startSelectLecture;	// 수강신청일
	private String endSelectLecture;	// 수강신청 종료일
	private String openingDay;			// 개강일
	private String gradeOpeningDay;		// 학점입력일
	private String endingDAy;				// 종강일
	
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public int getSemester() {
		return semester;
	}
	public void setSemester(int semester) {
		this.semester = semester;
	}
	public String getStartSelectLecture() {
		return startSelectLecture;
	}
	public void setStartSelectLecture(String startSelectLecture) {
		this.startSelectLecture = startSelectLecture;
	}
	public String getEndSelectLecture() {
		return endSelectLecture;
	}
	public void setEndSelectLecture(String endSelectLecture) {
		this.endSelectLecture = endSelectLecture;
	}
	public String getOpeningDay() {
		return openingDay;
	}
	public void setOpeningDay(String openingDay) {
		this.openingDay = openingDay;
	}
	public String getGradeOpeningDay() {
		return gradeOpeningDay;
	}
	public void setGradeOpeningDay(String gradeOpeningDay) {
		this.gradeOpeningDay = gradeOpeningDay;
	}
	public String getEndingDAy() {
		return endingDAy;
	}
	public void setEndingDAy(String endingDAy) {
		this.endingDAy = endingDAy;
	}
}
