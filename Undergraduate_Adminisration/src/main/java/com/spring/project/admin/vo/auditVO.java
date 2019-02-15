package com.spring.project.admin.vo;

import java.sql.Date;

public class auditVO {
	
	private String schinfopk; //장학 신청 완료 콛
	private String userName; //유저 이름
	private int grade; //
	private int semester; //학기
	private String scholarName; //장학금명
	private Date year; //년도
	private String amount; // 신청금액
	private String scholarstatus; //합 / 불
	private int statCode; // 신청코드
	
	
	
	
	
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
	public Date getYear() {
		return year;
	}
	public void setYear(Date year) {
		this.year = year;
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
	public int getSemester() {
		return semester;
	}
	public void setSemester(int semester) {
		this.semester = semester;
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
