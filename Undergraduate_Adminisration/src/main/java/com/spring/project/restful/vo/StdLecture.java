package com.spring.project.restful.vo;

import java.util.List;

import com.spring.project.admin.vo.LectureTime;

public class StdLecture {
	private String stdNumber;
	private int leccode;
	private int MajorName;
	private String empNumber;
	private String lectureName;
	private int lectureclassfication;
	private String classRoom;
	private int day; 	// 0:월 1:화 2:수 3:목 4:금
	private List<LectureTime> lectureTimes;
	
}
