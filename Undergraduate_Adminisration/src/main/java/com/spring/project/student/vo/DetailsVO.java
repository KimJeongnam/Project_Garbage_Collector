package com.spring.project.student.vo;

public class DetailsVO {
	private int stdnumber; //학번
	private String scholarname;//장학금명
	private String amount;//지급금액
	private String applyDay;
	private String paymentDay;
	private int statcode;//합격여부
	private String strStat;
	
	public String getStrStat() {
		return strStat;
	}
	public void setStrStat(String strStat) {
		this.strStat = strStat;
	}
	public int getStdnumber() {
		return stdnumber;
	}
	public void setStdnumber(int stdnumber) {
		this.stdnumber = stdnumber;
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
	public int getStatcode() {
		return statcode;
	}
	public void setStatcode(int statcode) {
		this.statcode = statcode;
	}
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
}
