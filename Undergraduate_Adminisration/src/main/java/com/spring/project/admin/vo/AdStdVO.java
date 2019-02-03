package com.spring.project.admin.vo;

import java.sql.Date;

public class AdStdVO {

	//user
	private String userNumber;		//학번 - pk
	private String userPassword;	
	private String userEngName; 	//영엉이름
	private String userName;			//학생이름
	private String userImage;		//학생이미지
	private String userSsn;			//주민등록번호
	private String userCellNum;	//모바일넘버
	private String userEmail;		//이메일
	private String userZipCode;		//우편번호
	private String userAddr1;		//주소1
	private String userAddr2;		//주소2
	private String gender;			//성별
	private int delStatus;			//삭제상태
	private String authority; 
	
	//student
	private String stdNumber;		//학번
	private int grade;				//학년
	private Date adDate;			//입학일
	private Date graDate;			//졸업일
	
	//studentState
	private int semester;			//학기
	private int graduation_state;	//졸업 여부
	
	//major
	private int majorNum;			//학과번호 - pk
	private String majorName;		//학과명
	
	//faculty
	private String faculty; 
	
	//schoolLeave
	private int schoolLeaveStateCode;//휴복학 내역코드 -pk
	private int leaveStatus;		 //상태
	private String kind;			 //구분 - 휴학의 종류
	
	
	
	
	public String getUserCellNum() {
		return userCellNum;
	}
	public void setUserCellNum(String userCellNum) {
		this.userCellNum = userCellNum;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getStdNumber() {
		return stdNumber;
	}
	public void setStdNumber(String stdNumber) {
		this.stdNumber = stdNumber;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	public String getAuthority() {
		return authority;
	}
	public void setAuthority(String authority) {
		this.authority = authority;
	}
	public String getUserEngName() {
		return userEngName;
	}
	public void setUserEngName(String userEngName) {
		this.userEngName = userEngName;
	}
	public String getUserNumber() {
		return userNumber;
	}
	public void setUserNumber(String userNumber) {
		this.userNumber = userNumber;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public int getSemester() {
		return semester;
	}
	public void setSemester(int semester) {
		this.semester = semester;
	}
	public int getGraduation_state() {
		return graduation_state;
	}
	public void setGraduation_state(int graduation_state) {
		this.graduation_state = graduation_state;
	}
	public int getMajorNum() {
		return majorNum;
	}
	public void setMajorNum(int majorNum) {
		this.majorNum = majorNum;
	}
	public String getMajorName() {
		return majorName;
	}
	public void setMajorName(String majorName) {
		this.majorName = majorName;
	}
	public String getFaculty() {
		return faculty;
	}
	public void setFaculty(String faculty) {
		this.faculty = faculty;
	}
	public int getSchoolLeaveStateCode() {
		return schoolLeaveStateCode;
	}
	public void setSchoolLeaveStateCode(int schoolLeaveStateCode) {
		this.schoolLeaveStateCode = schoolLeaveStateCode;
	}
	public int getLeaveStatus() {
		return leaveStatus;
	}
	public void setLeaveStatus(int leaveStatus) {
		this.leaveStatus = leaveStatus;
	}
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	public String getUserImage() {
		return userImage;
	}
	public void setUserImage(String userImage) {
		this.userImage = userImage;
	}
	public String getUserSsn() {
		return userSsn;
	}
	public void setUserSsn(String userSsn) {
		this.userSsn = userSsn;
	}
	
	
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserZipCode() {
		return userZipCode;
	}
	public void setUserZipCode(String userZipCode) {
		this.userZipCode = userZipCode;
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
	public Date getAdDate() {
		return adDate;
	}
	public void setAdDate(Date adDate) {
		this.adDate = adDate;
	}
	public Date getGraDate() {
		return graDate;
	}
	public void setGraDate(Date graDate) {
		this.graDate = graDate;
	}
	public int getDelStatus() {
		return delStatus;
	}
	public void setDelStatus(int delStatus) {
		this.delStatus = delStatus;
	}
	
	
}
