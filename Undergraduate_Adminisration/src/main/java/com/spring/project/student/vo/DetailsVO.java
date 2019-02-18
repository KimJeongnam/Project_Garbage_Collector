package com.spring.project.student.vo;

import java.sql.Date;

public class DetailsVO {
	private int stdnumber; //학번
	private String s_year; //학년도
	private int semester;//학기
	private String scholarname;//장학금명
	private String amount;//지급금액
	private Date year;//지급일자
	private int statcode;//합격여부
	
	public int getStdnumber() {
		return stdnumber;
	}
	public void setStdnumber(int stdnumber) {
		this.stdnumber = stdnumber;
	}
	
	public String getS_year() {
		return s_year;
	}
	public void setS_year(String s_year) {
		this.s_year = s_year;
	}
	public int getSemester() {
		return semester;
	}
	public void setSemester(int semester) {
		this.semester = semester;
	}
	public String getScholarname() {
		return scholarname;
	}
	public void setScholarname(String scholarname) {
		this.scholarname = scholarname;
	}
	public String getAmount() {
		return amount;
	}
	public void setAmount(String amount) {
		this.amount = amount;
	}
	public Date getYear() {
		return year;
	}
	public void setYear(Date year) {
		this.year = year;
	}
	public int getStatcode() {
		return statcode;
	}
	public void setStatcode(int statcode) {
		this.statcode = statcode;
	}
	
	

}
