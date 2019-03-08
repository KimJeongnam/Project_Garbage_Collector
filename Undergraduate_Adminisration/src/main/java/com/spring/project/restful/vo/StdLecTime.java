package com.spring.project.restful.vo;

public class StdLecTime {
	private int lecCode;
	private String lectureName;
	private String classRoom;
	private String empName;
	private String empImage;
	private String userNumber;
	private int timeTblcode;
	private int classTime;
	
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
	public String getClassRoom() {
		return classRoom;
	}
	public void setClassRoom(String classRoom) {
		this.classRoom = classRoom;
	}
	public String getEmpName() {
		return empName;
	}
	public void setEmpName(String empName) {
		this.empName = empName;
	}
	public String getEmpImage() {
		return empImage;
	}
	public void setEmpImage(String empImage) {
		this.empImage = empImage;
	}
	public String getUserNumber() {
		return userNumber;
	}
	public void setUserNumber(String userNumber) {
		this.userNumber = userNumber;
	}
	public int getTimeTblcode() {
		return timeTblcode;
	}
	public void setTimeTblcode(int timeTblcode) {
		this.timeTblcode = timeTblcode;
	}
	public int getClassTime() {
		return classTime;
	}
	public void setClassTime(int classTime) {
		this.classTime = classTime;
	}
}
