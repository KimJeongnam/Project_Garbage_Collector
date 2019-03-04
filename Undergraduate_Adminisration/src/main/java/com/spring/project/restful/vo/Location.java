package com.spring.project.restful.vo;

public class Location {
	private String area;
	private String locality;
	private String thoroughfare;
	private int x;
	private int y;
	
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public String getLocality() {
		return locality;
	}
	public void setLocality(String locality) {
		this.locality = locality;
	}
	public String getThoroughfare() {
		return thoroughfare;
	}
	public void setThoroughfare(String thoroughfare) {
		this.thoroughfare = thoroughfare;
	}
	public int getX() {
		return x;
	}
	public void setX(int x) {
		this.x = x;
	}
	public int getY() {
		return y;
	}
	public void setY(int y) {
		this.y = y;
	}
}
