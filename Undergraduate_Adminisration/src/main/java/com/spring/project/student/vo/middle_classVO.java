package com.spring.project.student.vo;

public class middle_classVO {
	private String userNumber;//학생 학번
	private int lecCode; //강의 번호
	private String lectureName;//강의명
	private String username; //교수명
	private String userCellNum;//교수 연락처
	private String classTime; //시간표
	
	public String getUserNumber() {
		return userNumber;
	}
	public void setUserNumber(String userNumber) {
		this.userNumber = userNumber;
	}
	public int getLecCode() {
		return lecCode;
	}
	public void setLecCode(int lecCode) {
		this.lecCode = lecCode;
	}
	public String getLectureName() {
		return lectureName;
	}
	public void setLectureName(String lectureName) {
		this.lectureName = lectureName;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getUserCellNum() {
		return userCellNum;
	}
	public void setUserCellNum(String userCellNum) {
		this.userCellNum = userCellNum;
	}
	public String getClassTime() {
		return classTime;
	}
	public void setClassTime(String classTime) {
		this.classTime = classTime;
	}
	
	
}
