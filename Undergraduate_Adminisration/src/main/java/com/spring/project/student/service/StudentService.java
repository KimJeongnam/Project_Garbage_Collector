package com.spring.project.student.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

public interface StudentService {
	
	// 강의 목록
	public void lectureList(Map<String, Object> map, Logger logger, Model model);
	
	// 시간표 조회
	public void schoolTimeTable(Map<String, Object> map, Logger logger, Model model);
	
	// 강의 검색
	public void lectureSearch(Map<String, Object> map, Model model);
	
	//강의 신청
	public void applyLecture(Map<String, Object> map, RedirectAttributes red);
}
