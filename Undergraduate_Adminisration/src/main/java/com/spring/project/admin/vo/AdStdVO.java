package com.spring.project.admin.vo;

import java.sql.Date;

public class AdStdVO {

	//student
	private String userNumber;		//학번
	private String stdName;			//학생이름
	private String stdImage;		//학생이미지
	private int stdGrade;			//학년
	private String stdSsn;			//주민등록번호
	private String stdCellNumber;	//모바일넘버
	private String stdEmail;		//이메일
	private String stdZipCode;		//우편번호
	private String stdAddr1;		//주소1
	private String stdAddr2;		//주소2
	private Date adDate;			//입학일
	
	private Date graDate;			//졸업일
	private int delStatus;			//삭제상태
	
	//studentState
	private int grade;				//학생상태 테이블 - 학년
	private int semester;			//학기
	private int graduation_state;	//졸업 여부
	
	//major
	private int majorNum;			//학과번호
	private String majorName;		//단과대명
	
	
	//faculty
	private String faculty; 
	
	//schoolLeave
	private int schoolLeaveStateCode;//휴복학 내역코드
	private int leaveStatus;		 //상태
	private String kind;			 //구분 - 휴학의 종류
	
	
	public String getUserNumber() {
		return userNumber;
	}
	public void setUserNumber(String userNumber) {
		this.userNumber = userNumber;
	}
	public int getStdGrade() {
		return stdGrade;
	}
	public void setStdGrade(int stdGrade) {
		this.stdGrade = stdGrade;
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
	public String getStdName() {
		return stdName;
	}
	public void setStdName(String stdName) {
		this.stdName = stdName;
	}
	public String getStdImage() {
		return stdImage;
	}
	public void setStdImage(String stdImage) {
		this.stdImage = stdImage;
	}
	
	public String getStdSsn() {
		return stdSsn;
	}
	public void setStdSsn(String stdSsn) {
		this.stdSsn = stdSsn;
	}
	public String getStdCellNumber() {
		return stdCellNumber;
	}
	public void setStdCellNumber(String stdCellNumber) {
		this.stdCellNumber = stdCellNumber;
	}
	public String getStdEmail() {
		return stdEmail;
	}
	public void setStdEmail(String stdEmail) {
		this.stdEmail = stdEmail;
	}
	public String getStdZipCode() {
		return stdZipCode;
	}
	public void setStdZipCode(String stdZipCode) {
		this.stdZipCode = stdZipCode;
	}
	public String getStdAddr1() {
		return stdAddr1;
	}
	public void setStdAddr1(String stdAddr1) {
		this.stdAddr1 = stdAddr1;
	}
	public String getStdAddr2() {
		return stdAddr2;
	}
	public void setStdAddr2(String stdAddr2) {
		this.stdAddr2 = stdAddr2;
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
