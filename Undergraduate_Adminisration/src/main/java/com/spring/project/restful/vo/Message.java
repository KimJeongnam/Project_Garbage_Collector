package com.spring.project.restful.vo;

public class Message implements Comparable<Message>, Cloneable{
	private int messageCode;
	private String userNumber;
	private String sendUser;
	private String message;
	private int readStatus;
	private String sendYear;
	private String sendMonth;
	private String sendDay;
	private String sendHour;
	private String sendMin;
	private String sendSec;
	private int day;
	private int hour;
	private int min;
	private int sec;
	private int notifyStatus;
	private String senduserimage;
	
	public int getMessageCode() {
		return messageCode;
	}
	public void setMessageCode(int messageCode) {
		this.messageCode = messageCode;
	}
	public String getUserNumber() {
		return userNumber;
	}
	public void setUserNumber(String userNumber) {
		this.userNumber = userNumber;
	}
	public String getSendUser() {
		return sendUser;
	}
	public void setSendUser(String sendUser) {
		this.sendUser = sendUser;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public int getReadStatus() {
		return readStatus;
	}
	public void setReadStatus(int readStatus) {
		this.readStatus = readStatus;
	}
	public String getSendYear() {
		return sendYear;
	}
	public void setSendYear(String sendYear) {
		this.sendYear = sendYear;
	}
	public String getSendMonth() {
		return sendMonth;
	}
	public void setSendMonth(String sendMonth) {
		this.sendMonth = sendMonth;
	}
	public String getSendDay() {
		return sendDay;
	}
	public void setSendDay(String sendDay) {
		this.sendDay = sendDay;
	}
	public String getSendHour() {
		return sendHour;
	}
	public void setSendHour(String sendHour) {
		this.sendHour = sendHour;
	}
	public String getSendMin() {
		return sendMin;
	}
	public void setSendMin(String sendMin) {
		this.sendMin = sendMin;
	}
	public String getSendSec() {
		return sendSec;
	}
	public void setSendSec(String sendSec) {
		this.sendSec = sendSec;
	}
	public int getDay() {
		return day;
	}
	public void setDay(int day) {
		this.day = day;
	}
	public int getHour() {
		return hour;
	}
	public void setHour(int hour) {
		this.hour = hour;
	}
	public int getMin() {
		return min;
	}
	public void setMin(int min) {
		this.min = min;
	}
	public int getSec() {
		return sec;
	}
	public void setSec(int sec) {
		this.sec = sec;
	}
	public int getNotifyStatus() {
		return notifyStatus;
	}
	public void setNotifyStatus(int notifyStatus) {
		this.notifyStatus = notifyStatus;
	}
	public String getSenduserimage() {
		return senduserimage;
	}
	public void setSenduserimage(String senduserimage) {
		this.senduserimage = senduserimage;
	}
	
	
	@Override
	public int compareTo(Message arg0) {
		if(this.getNotifyStatus() < arg0.getNotifyStatus())
			return 1;
		else if(this.getNotifyStatus() > arg0.getNotifyStatus())
			return -1;
		else {
			if(this.messageCode < arg0.messageCode) 
				return 1;
			else if(this.messageCode > arg0.messageCode)
				return -1;
			else
				return 0;
		}
	}
	@Override
	public Object clone() throws CloneNotSupportedException {
		return super.clone();
	}
	
	
}
