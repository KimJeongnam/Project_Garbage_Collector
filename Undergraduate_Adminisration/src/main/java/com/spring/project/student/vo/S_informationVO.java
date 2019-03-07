package com.spring.project.student.vo;

public class S_informationVO {
	private String userNumber;//학번
	private String userImage; //이미지
	private String userName;//성명
	private String userSsn;//주민
	private String gender;//성별
	private String userCellNum;//핸드폰번호
	private String userZipCode;//코드
	private String userAddr1;//주소1
	private String userAddr2;//주소2
	private String faculty;//단과맥
	private String majorName;//학과명
	private int majorNum;//학과 번호
	private int grade;//학년
	private int graduation_state;//졸업여부
	private int semester;//현재 학기
	
	
	
	
	public String getUserZipCode() {
		return userZipCode;
	}
	public void setUserZipCode(String userZipCode) {
		this.userZipCode = userZipCode;
	}
	public String getMajorName() {
		return majorName;
	}
	public void setMajorName(String majorName) {
		this.majorName = majorName;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserSsn() {
		return userSsn;
	}
	public void setUserSsn(String userSsn) {
		this.userSsn = userSsn;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getUserCellNum() {
		return userCellNum;
	}
	public void setUserCellNum(String userCellNum) {
		this.userCellNum = userCellNum;
	}
	public String getUserAddr1() {
		return userAddr1;
	}
	public void setUserAddr1(String userAddr1) {
		this.userAddr1 = userAddr1;
	}
	public String getUserAddr2() {
		return userAddr2;
	}
	public void setUserAddr2(String userAddr2) {
		this.userAddr2 = userAddr2;
	}
	public String getFaculty() {
		return faculty;
	}
	public void setFaculty(String faculty) {
		this.faculty = faculty;
	}
	public int getMajorNum() {
		return majorNum;
	}
	public void setMajorNum(int majorNum) {
		this.majorNum = majorNum;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public int getGraduation_state() {
		return graduation_state;
	}
	public void setGraduation_state(int graduation_state) {
		this.graduation_state = graduation_state;
	}
	public int getSemester() {
		return semester;
	}
	public void setSemester(int semester) {
		this.semester = semester;
	}
	public String getUserNumber() {
		return userNumber;
	}
	public void setUserNumber(String userNumber) {
		this.userNumber = userNumber;
	}
	public String getUserImage() {
		return userImage;
	}
	public void setUserImage(String userImage) {
		this.userImage = userImage;
	}
	
	

}
