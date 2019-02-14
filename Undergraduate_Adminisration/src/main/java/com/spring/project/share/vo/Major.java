package com.spring.project.share.vo;

public class Major {
	private int majorNum;
	private String faculty;
	private String majorName;
	private int maxNum;
	
	public int getMajorNum() {
		return majorNum;
	}
	public void setMajorNum(int majorNum) {
		this.majorNum = majorNum;
	}
	public String getFaculty() {
		return faculty;
	}
	public void setFaculty(String faculty) {
		this.faculty = faculty;
	}
	public String getMajorName() {
		return majorName;
	}
	public void setMajorName(String majorName) {
		this.majorName = majorName;
	}
	public int getMaxNum() {
		return maxNum;
	}
	public void setMaxNum(int maxNum) {
		this.maxNum = maxNum;
	}
	
	@Override
	public String toString() {
		return "Major [majorNum=" + majorNum + ", faculty=" + faculty + ", majorName=" + majorName + ", maxNum="
				+ maxNum + "]";
	}
}
