package com.spring.project.student.vo;

import java.util.List;

public class LectureVO {
	private List<Integer> timetblCodes;
	private int[] ttc;
	
	private String lecCode;
	private int majorNum;
	private String userNumber;
	private String userName;
	private String userImage;
	private String lectureName;
	private String lectureClassfication;
	private int maximumCapacity;
	private int grade;
	private int grantedSemester;
	private int lectureScore;
	private String classRoom;
	private int lecStatus;
	
	private String empNumber;
	private int timetblCode;
	private String classTime;
	private String accountHolder;
	private String lectureDay;
	private String beginningLectureTime;
	private String endLectureTime;
	private String majorName;
	private int rank;
	
	private int result;
	
	public int[] getTtc() {
		return ttc;
	}
	public void setTtc(int[] ttc) {
		this.ttc = ttc;
	}
	
	public int getResult() {
		return result;
	}
	public void setResult(int result) {
		this.result = result;
	}
	public List<Integer> getTimetblCodes() {
		return timetblCodes;
	}
	public void setTimetblCodes(List<Integer> timetblCodes) {
		this.timetblCodes = timetblCodes;
	}
	public String getUserImage() {
		return userImage;
	}
	public void setUserImage(String userImage) {
		this.userImage = userImage;
	}
	public int getLecStatus() {
		return lecStatus;
	}
	public void setLecStatus(int lecStatus) {
		this.lecStatus = lecStatus;
	}
	public int getRank() {
		return rank;
	}
	public void setRank(int rank) {
		this.rank = rank;
	}
	public String getMajorName() {
		return majorName;
	}
	public void setMajorName(String majorName) {
		this.majorName = majorName;
	}
	public String getLectureDay() {
		return lectureDay;
	}
	public void setLectureDay(String lectureDay) {
		this.lectureDay = lectureDay;
	}
	public String getBeginningLectureTime() {
		return beginningLectureTime;
	}
	public void setBeginningLectureTime(String beginningLectureTime) {
		this.beginningLectureTime = beginningLectureTime;
	}
	public String getEndLectureTime() {
		return endLectureTime;
	}
	public void setEndLectureTime(String endLectureTime) {
		this.endLectureTime = endLectureTime;
	}
	public String getAccountHolder() {
		return accountHolder;
	}
	public void setAccountHolder(String accountHolder) {
		this.accountHolder = accountHolder;
	}
	public String getClassTime() {
		return classTime;
	}
	public void setClassTime(String classTime) {
		this.classTime = classTime;
	}
	public String getEmpNumber() {
		return empNumber;
	}
	public void setEmpNumber(String empNumber) {
		this.empNumber = empNumber;
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
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
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
	public String getClassRoom() {
		return classRoom;
	}
	public void setClassRoom(String classRoom) {
		this.classRoom = classRoom;
	}
	public int getTimetblCode() {
		return timetblCode;
	}
	public void setTimetblCode(int timetblCode) {
		this.timetblCode = timetblCode;
	}
	
}
