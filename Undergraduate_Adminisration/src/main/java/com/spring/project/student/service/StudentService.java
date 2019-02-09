package com.spring.project.student.service;

import java.util.Map;

import org.slf4j.Logger;
import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

public interface StudentService {
	
	// 강의 목록
	public void lectureList(Map<String, Object> map, Logger logger, Model model);
	
	// 시간표 조회
	public void schoolTimeTable(Map<String, Object> map, Logger logger, Model model);
	
	//강의 신청
	public void applyLecture(Map<String, Object> map, Logger logger, RedirectAttributes red);
	
	//강의 hover
	public void lectureHover(Map<String, Object> map, Logger logger, Model model);
	
	// 내 강의 신청 내역
	public void studentMyLecture(Map<String, Object> map, Logger logger, Model model);
	
	//강의 hover
	public void cancelLecture(Map<String, Object> map, Logger logger, RedirectAttributes red);
	
	// 강의 목록 조회(전공)
	public void lectureListMajor(Model model);
}
