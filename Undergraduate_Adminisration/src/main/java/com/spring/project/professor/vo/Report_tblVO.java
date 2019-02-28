package com.spring.project.professor.vo;

import java.sql.Date;

public class Report_tblVO {

	private int reportcode; //과제번호
	private String lecCode; //강의코드
	private String year; //년도
	private String reportInfo; //과제 내용
	private String reportName; //과제 명
	private String endDate; //마감일
	
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
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	
	
	
	
	
	
}
