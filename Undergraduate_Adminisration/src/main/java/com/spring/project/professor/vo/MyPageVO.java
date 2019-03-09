package com.spring.project.professor.vo;

public class MyPageVO {
	private String userNumber;
	private String userPassword;
	private String userName;
	private String userEngName;
	private String userImage;
	private String gender;
	private String userCellNum;
	private String userEmail;
	private String userSsn;
	private String userZipCode;
	private String userAddr1;
	private String userAddr2;
	private String delStatus;
	private String authority;
	
	
	private String accountNumber;
	private String bankName;
	
	
	private String introduction;
	
	//major
	private int majorNum;			//학과번호 - pk
	private String majorName;		//학과명
	
	//faculty
	private String faculty; 

	
	
	
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
	public String getIntroduction() {
		return introduction;
	}
	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}
	public String getUserNumber() {
		return userNumber;
	}
	public void setUserNumber(String userNumber) {
		this.userNumber = userNumber;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserEngName() {
		return userEngName;
	}
	public void setUserEngName(String userEngName) {
		this.userEngName = userEngName;
	}
	public String getUserImage() {
		return userImage;
	}
	public void setUserImage(String userImage) {
		this.userImage = userImage;
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
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserSsn() {
		return userSsn;
	}
	public void setUserSsn(String userSsn) {
		this.userSsn = userSsn;
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
	public String getDelStatus() {
		return delStatus;
	}
	public void setDelStatus(String delStatus) {
		this.delStatus = delStatus;
	}
	public String getAuthority() {
		return authority;
	}
	public void setAuthority(String authority) {
		this.authority = authority;
	}
	public String getAccountNumber() {
		return accountNumber;
	}
	public void setAccountNumber(String accountNumber) {
		this.accountNumber = accountNumber;
	}
	public String getBankName() {
		return bankName;
	}
	public void setBankName(String bankName) {
		this.bankName = bankName;
	}
	
	
	
}
