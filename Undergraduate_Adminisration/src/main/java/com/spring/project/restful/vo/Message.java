package com.spring.project.restful.vo;

import java.sql.Timestamp;

public class Message implements Comparable<Message>{
	private int messageCode;
	private String userNumber;
	private String sendUser;
	private String message;
	private int readStatus;
	private Timestamp sendTime;
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
	public Timestamp getSendTime() {
		return sendTime;
	}
	public void setSendTime(Timestamp sendTime) {
		this.sendTime = sendTime;
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
}
