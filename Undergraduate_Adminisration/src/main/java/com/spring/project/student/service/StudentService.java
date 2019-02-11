package com.spring.project.student.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.project.admin.vo.ScholarpkVO;

public interface StudentService {
	
	// 강의 목록
	public void lectureList(Map<String, Object> map, Logger logger, Model model);
	
	// 시간표 조회
	public void schoolTimeTable(Map<String, Object> map, Logger logger, Model model);
	
	//장학금 신청 
	public void bulletin(Map<String, Object> map, Logger logger, Model model);
	
	//장학금 글 신청 상세
	public void contentForm(HttpServletRequest req,  Model model); 
	
	//장학금 글 신청 상세
	public void apply(HttpServletRequest req,  RedirectAttributes red);
	
	// 시간표 조회
	//public void management(HttpServletRequest req, Model model);
	public void applyLecture(Map<String, Object> map, Logger logger, RedirectAttributes red);
	
	//강의 hover
	public void lectureHover(Map<String, Object> map, Logger logger, Model model);
	
	// 내 강의 신청 내역
	public void studentMyLecture(Map<String, Object> map, Logger logger, Model model);
	
	//강의 hover
	public void cancelLecture(Map<String, Object> map, Logger logger, RedirectAttributes red);
	
}
