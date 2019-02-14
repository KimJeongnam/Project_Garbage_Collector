package com.spring.project.professor.vo;

public class MyClassVO {
	
	private String lectureName; //강의명
	private String empNumber; //교수번호 list에서 사용
	private String userNumber; //교수번호 score에서 사용
	
	public String getUserNumber() {
		return userNumber;
	}
	public void setUserNumber(String userNumber) {
		this.userNumber = userNumber;
	}
	public String getLectureName() {
		return lectureName;
	}
	public void setLectureName(String lectureName) {
		this.lectureName = lectureName;
	}
	public String getEmpNumber() {
		return empNumber;
	}
	public void setEmpNumber(String empNumber) {
		this.empNumber = empNumber;
	}
	
	
}
