package com.spring.project.admin.vo;

import java.sql.Date;

public class AdProVO {

	//user
	private String userNumber;		//학번 - pk
	private String userPassword;	
	private String userEngName; 	//영엉이름
	private String userName;		//학생이름
	private String userImage;		//학생이미지
	private String userSsn;			//주민등록번호
	private String userCellNum;		//모바일넘버
	private String userEmail;		//이메일
	private String userZipCode;		//우편번호
	private String userAddr1;		//주소1
	private String userAddr2;		//주소2
	private String gender;			//성별
	private int delStatus;			//삭제상태
	private String authority; 
	
	//major
	private int majorNum;			//학과번호 - pk
	private String majorName;		//학과명
	
	//faculty
	private String faculty; 
	
	//employee
	private String empNumber;		//users의 userNumber - 교번
	private Date empHiredDate;		//입사일
	private int annualLevel;		//연차
	private String bankName;		//은행명
	private String accountNumber;	//계좌번호
	private String accountHolder;	//예금주
	
	//payment
	private int paymentCode;		//급여코드
	
	//paymentList
	private Date paymentDate;		//급여지급날자
	
	//registerDetail
	private int regDeCode;			//급여대장 상세코드
	private int totalPayment;		//총금액
	
	public Date getPaymentDate() {
		return paymentDate;
	}
	public void setPaymentDate(Date paymentDate) {
		this.paymentDate = paymentDate;
	}
	public String getBankName() {
		return bankName;
	}
	public void setBankName(String bankName) {
		this.bankName = bankName;
	}
	public String getAccountNumber() {
		return accountNumber;
	}
	public void setAccountNumber(String accountNumber) {
		this.accountNumber = accountNumber;
	}
	public String getAccountHolder() {
		return accountHolder;
	}
	public void setAccountHolder(String accountHolder) {
		this.accountHolder = accountHolder;
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
	public String getUserEngName() {
		return userEngName;
	}
	public void setUserEngName(String userEngName) {
		this.userEngName = userEngName;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
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
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public int getDelStatus() {
		return delStatus;
	}
	public void setDelStatus(int delStatus) {
		this.delStatus = delStatus;
	}
	public String getAuthority() {
		return authority;
	}
	public void setAuthority(String authority) {
		this.authority = authority;
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
	public String getEmpNumber() {
		return empNumber;
	}
	public void setEmpNumber(String empNumber) {
		this.empNumber = empNumber;
	}
	public Date getEmpHiredDate() {
		return empHiredDate;
	}
	public void setEmpHiredDate(Date empHiredDate) {
		this.empHiredDate = empHiredDate;
	}
	public int getAnnualLevel() {
		return annualLevel;
	}
	public void setAnnualLevel(int annualLevel) {
		this.annualLevel = annualLevel;
	}
	public int getPaymentCode() {
		return paymentCode;
	}
	public void setPaymentCode(int paymentCode) {
		this.paymentCode = paymentCode;
	}
	public int getRegDeCode() {
		return regDeCode;
	}
	public void setRegDeCode(int regDeCode) {
		this.regDeCode = regDeCode;
	}
	public int getTotalPayment() {
		return totalPayment;
	}
	public void setTotalPayment(int totalPayment) {
		this.totalPayment = totalPayment;
	}

	
	
	
	
	
	
	
}
