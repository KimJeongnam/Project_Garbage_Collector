package com.spring.project.restful.vo;

public class ResponseData {
	private String message;	// toast message 
	private int status;			// success : 1, fail:0
	private Object data;		// response Data
	
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public Object getData() {
		return data;
	}
	public void setData(Object data) {
		this.data = data;
	}
}
