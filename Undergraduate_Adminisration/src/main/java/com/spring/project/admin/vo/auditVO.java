package com.spring.project.admin.vo;

import java.sql.Date;

// sibal 소문자
public class auditVO {
	
	private String schinfopk; //장학 정보 코드
	private String userName; //유저 이름
	private int grade; // 학년
	private String scholarName; //장학금명
	private String applyDay; // 신청일
	private String paymentDay; // 지급일
	private String amount; // 신청금액
	private String scholarstatus; //합 / 불
	private int statCode; // 신청코드
	
	
	public String getApplyDay() {
		return applyDay;
	}
	public void setApplyDay(String applyDay) {
		this.applyDay = applyDay;
	}
	public String getPaymentDay() {
		return paymentDay;
	}
	public void setPaymentDay(String paymentDay) {
		this.paymentDay = paymentDay;
	}
	public String getAmount() {
		return amount;
	}
	public void setAmount(String amount) {
		this.amount = amount;
	}
	public String getSchinfopk() {
		return schinfopk;
	}
	public void setSchinfopk(String schinfopk) {
		this.schinfopk = schinfopk;
	}
	public String getScholarstatus() {
		return scholarstatus;
	}
	public void setScholarstatus(String scholarstatus) {
		this.scholarstatus = scholarstatus;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public String getScholarName() {
		return scholarName;
	}
	public void setScholarName(String scholarName) {
		this.scholarName = scholarName;
	}
	public int getStatCode() {
		return statCode;
	}
	public void setStatCode(int statCode) {
		this.statCode = statCode;
	}
	
	

}
