package com.spring.project.student.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface StudentService {
	
	// 강의 목록
	public void lectureList(HttpServletRequest req, Model model);
	
	// 강의 검색
	public void lectureSearch(HttpServletRequest req, Model model);
	
	// 시간표 조회
	public void schoolTimeTable(HttpServletRequest req, Model model);
	
	//강의 신청
	public void applyLecture(HttpServletRequest req, Model model);
}
