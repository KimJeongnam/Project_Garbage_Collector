package com.spring.project.admin.vo;

// 강의 시간표 객체
public class LectureTime {
	public int timetblCode;
	public String lectureDay;
	public int lectureTimeCode;
	public String beginningLectureTime;
	public String endLectureTime;
	public int getTimetblCode() {
		return timetblCode;
	}
	public void setTimetblCode(int timetblCode) {
		this.timetblCode = timetblCode;
	}
	public String getLectureDay() {
		return lectureDay;
	}
	public void setLectureDay(String lectureDay) {
		this.lectureDay = lectureDay;
	}
	public int getLectureTimeCode() {
		return lectureTimeCode;
	}
	public void setLectureTimeCode(int lectureTimeCode) {
		this.lectureTimeCode = lectureTimeCode;
	}
	public String getBeginningLectureTime() {
		return beginningLectureTime;
	}
	public void setBeginningLectureTime(String beginningLectureTime) {
		this.beginningLectureTime = beginningLectureTime;
	}
	public String getEndLectureTime() {
		return endLectureTime;
	}
	public void setEndLectureTime(String endLectureTime) {
		this.endLectureTime = endLectureTime;
	}
}
