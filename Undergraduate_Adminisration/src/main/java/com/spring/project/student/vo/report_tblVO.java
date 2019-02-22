package com.spring.project.student.vo;

import java.sql.Date;

public class report_tblVO {
	private String lectureName; //강의 번호
	private int reportcode;//교수과제번호
	private String lecCode; //강의 번호
	private String year;//강의명
	private String reportInfo; //내용
	private String reportName;//교수 연락처
	private Date endDate; //시간표
	private int progress;//진행 상태
	
	
	
	
	public String getLectureName() {
		return lectureName;
	}
	public void setLectureName(String lectureName) {
		this.lectureName = lectureName;
	}
	public int getProgress() {
		return progress;
	}
	public void setProgress(int progress) {
		this.progress = progress;
	}
	public int getReportcode() {
		return reportcode;
	}
	public void setReportcode(int reportcode) {
		this.reportcode = reportcode;
	}
	public String getLecCode() {
		return lecCode;
	}
	public void setLecCode(String lecCode) {
		this.lecCode = lecCode;
	}
	
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getReportInfo() {
		return reportInfo;
	}
	public void setReportInfo(String reportInfo) {
		this.reportInfo = reportInfo;
	}
	public String getReportName() {
		return reportName;
	}
	public void setReportName(String reportName) {
		this.reportName = reportName;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	
	
}
