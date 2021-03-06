package com.spring.project.admin.vo;

public class ScholarpkVO {
	private int  scholarpk; 			//장학금 번호
	private String  scholarname;		//장학금명
	private String  year;				//년도
	private String  semester;			//학기
	private String  scholarcontent;	 	//내용
	private String  amount;				//지급금액
	private String  delstatus;			//상태
	
	
	public String getDelstatus() {
		return delstatus;
	}
	public void setDelstatus(String delstatus) {
		this.delstatus = delstatus;
	}
	public int getScholarpk() {
		return scholarpk;
	}
	public void setScholarpk(int scholarpk) {
		this.scholarpk = scholarpk;
	}
	public String getScholarname() {
		return scholarname;
	}
	public void setScholarname(String scholarname) {
		this.scholarname = scholarname;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getSemester() {
		return semester;
	}
	public void setSemester(String semester) {
		this.semester = semester;
	}
	public String getScholarcontent() {
		return scholarcontent;
	}
	public void setScholarcontent(String scholarcontent) {
		this.scholarcontent = scholarcontent;
	}
	public String getAmount() {
		return amount;
	}
	public void setAmount(String amount) {
		this.amount = amount;
	}
	
	
}
