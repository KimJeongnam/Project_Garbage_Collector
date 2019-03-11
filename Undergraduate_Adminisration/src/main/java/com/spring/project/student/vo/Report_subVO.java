package com.spring.project.student.vo;

import java.sql.Date;

public class Report_subVO {
	private String reportsubmitcode; //과제제출 테이블 번호
	private int reportcode;//교수과제번호
	private String userNumber; //학번
	private String userName; //학생이름
	private String title;//제목
	private String originFileName; //원본파일이름	
	private String fileName;//파일 이름
	private Date year; //제출일
	
	
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getReportsubmitcode() {
		return reportsubmitcode;
	}
	public void setReportsubmitcode(String reportsubmitcode) {
		this.reportsubmitcode = reportsubmitcode;
	}
	public int getReportcode() {
		return reportcode;
	}
	public void setReportcode(int reportcode) {
		this.reportcode = reportcode;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getOriginFileName() {
		return originFileName;
	}
	public void setOriginFileName(String originFileName) {
		this.originFileName = originFileName;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public Date getYear() {
		return year;
	}
	public void setYear(Date year) {
		this.year = year;
	}
	public String getUserNumber() {
		return userNumber;
	}
	public void setUserNumber(String userNumber) {
		this.userNumber = userNumber;
	}	
}
