package com.spring.project.professor.vo;

public class Submission_ListVO {
	private int reportcode;//과제 번호
	private String stdNumber;//학번
	private String reportName;//과제 제목
	private String fileName;//파일
	private String fileName2;//파일 명
	private String userName;//유저 이름
	private String userImage;//유저 사진
	private String month;//월
	private String day;//일
	private String year;//일
	
	
	
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getStdNumber() {
		return stdNumber;
	}
	public void setStdNumber(String stdNumber) {
		this.stdNumber = stdNumber;
	}
	public String getFileName2() {
		return fileName2;
	}
	public void setFileName2(String fileName2) {
		this.fileName2 = fileName2;
	}
	public int getReportcode() {
		return reportcode;
	}
	public void setReportcode(int reportcode) {
		this.reportcode = reportcode;
	}
	public String getReportName() {
		return reportName;
	}
	public void setReportName(String reportName) {
		this.reportName = reportName;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserImage() {
		return userImage;
	}
	public void setUserImage(String userImage) {
		this.userImage = userImage;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	

}
