package com.spring.project.admin.vo;

import java.sql.Date;

public class payrollVO {
	private String imputedYear;
	private String paymentClassfication;
	private String registerName;
	private Date paymentDate;
	private String paymentYear;
	private int totalAmount
;
	
	private String empNumber;
	private String accountHolder;
	private String majorName;
	private int totalPayment;
	private Date beginningPeriod;
	private Date endPeriod;
	
	
	public int getTotalAmount() {
		return totalAmount;
	}
	public void setTotalAmount(int totalAmount) {
		this.totalAmount = totalAmount;
	}
	public Date getBeginningPeriod() {
		return beginningPeriod;
	}
	public void setBeginningPeriod(Date beginningPeriod) {
		this.beginningPeriod = beginningPeriod;
	}
	public Date getEndPeriod() {
		return endPeriod;
	}
	public void setEndPeriod(Date endPeriod) {
		this.endPeriod = endPeriod;
	}
	public String getEmpNumber() {
		return empNumber;
	}
	public void setEmpNumber(String empNumber) {
		this.empNumber = empNumber;
	}
	public String getAccountHolder() {
		return accountHolder;
	}
	public void setAccountHolder(String accountHolder) {
		this.accountHolder = accountHolder;
	}
	public String getMajorName() {
		return majorName;
	}
	public void setMajorName(String majorName) {
		this.majorName = majorName;
	}
	public String getImputedYear() {
		return imputedYear;
	}
	public void setImputedYear(String imputedYear) {
		this.imputedYear = imputedYear;
	}
	public String getPaymentClassfication() {
		return paymentClassfication;
	}
	public void setPaymentClassfication(String paymentClassfication) {
		this.paymentClassfication = paymentClassfication;
	}
	public String getRegisterName() {
		return registerName;
	}
	public void setRegisterName(String registerName) {
		this.registerName = registerName;
	}
	public Date getPaymentDate() {
		return paymentDate;
	}
	public void setPaymentDate(Date paymentDate) {
		this.paymentDate = paymentDate;
	}
	public String getPaymentYear() {
		return paymentYear;
	}
	public void setPaymentYear(String paymentYear) {
		this.paymentYear = paymentYear;
	}
	public int getTotalPayment() {
		return totalPayment;
	}
	public void setTotalPayment(int totalPayment) {
		this.totalPayment = totalPayment;
	}
	
	
	
	
}
