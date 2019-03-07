package com.spring.project.student.vo;

public class GpaVO {
	
	private int year;
	private int semester;
	private String credit;
	private float score;
	private float multiply;
	private String lecCode;
	private int majorNum;
	private String userNumber;
	private String lectureName;
	private String lectureClassfication;
	private int maximumCapacity;
	private int grade;
	private int grantedSemester;
	private int lectureScore;
	private int jscore ; 					//백분위점수
	private int rownum; 					//글번호
	private int grantedCredit;				//이수학점
	private int grantedCnt;					//이수학점 갯수
	private int totalJscore;				//평균학점 알파벳표시
	private float avgScore;					//총 평균학점
	
	
	
	
	public float getAvgScore() {
		return avgScore;
	}
	public void setAvgScore(float avgScore) {
		this.avgScore = avgScore;
	}
	public int getGrantedCredit() {
		return grantedCredit;
	}
	public void setGrantedCredit(int grantedCredit) {
		this.grantedCredit = grantedCredit;
	}
	public int getGrantedCnt() {
		return grantedCnt;
	}
	public void setGrantedCnt(int grantedCnt) {
		this.grantedCnt = grantedCnt;
	}
	public int getTotalJscore() {
		return totalJscore;
	}
	public void setTotalJscore(int totalJscore) {
		this.totalJscore = totalJscore;
	}
	public int getRownum() {
		return rownum;
	}
	public void setRownum(int rownum) {
		this.rownum = rownum;
	}
	public int getJscore() {
		return jscore;
	}
	public void setJscore(int jscore) {
		this.jscore = jscore;
	}
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	public int getSemester() {
		return semester;
	}
	public void setSemester(int semester) {
		this.semester = semester;
	}
	public String getCredit() {
		return credit;
	}
	public void setCredit(String credit) {
		this.credit = credit;
	}
	public float getScore() {
		return score;
	}
	public void setScore(float score) {
		this.score = score;
	}
	public float getMultiply() {
		return multiply;
	}
	public void setMultiply(float multiply) {
		this.multiply = multiply;
	}
	public String getLecCode() {
		return lecCode;
	}
	public void setLecCode(String lecCode) {
		this.lecCode = lecCode;
	}
	public int getMajorNum() {
		return majorNum;
	}
	public void setMajorNum(int majorNum) {
		this.majorNum = majorNum;
	}
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
	public String getLectureClassfication() {
		return lectureClassfication;
	}
	public void setLectureClassfication(String lectureClassfication) {
		this.lectureClassfication = lectureClassfication;
	}
	public int getMaximumCapacity() {
		return maximumCapacity;
	}
	public void setMaximumCapacity(int maximumCapacity) {
		this.maximumCapacity = maximumCapacity;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public int getGrantedSemester() {
		return grantedSemester;
	}
	public void setGrantedSemester(int grantedSemester) {
		this.grantedSemester = grantedSemester;
	}
	public int getLectureScore() {
		return lectureScore;
	}
	public void setLectureScore(int lectureScore) {
		this.lectureScore = lectureScore;
	}
	
	
	
	
}
