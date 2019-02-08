package com.spring.project.student.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.project.admin.vo.ScholarpkVO;

public interface StudentService {
	
	// 강의 목록
	public void lectureList(Map<String, Object> map, Model model);
	
	// 강의 검색
	public void lectureSearch(Map<String, Object> map, Model model);
	
	// 시간표 조회
	public void schoolTimeTable(Map<String, Object> map, Model model);
	
	//강의 신청
	public void applyLecture(Map<String, Object> map, RedirectAttributes red); 
	
	//장학금 신청 
	public void bulletin(HttpServletRequest req, Model model);
	
	//장학금 글 신청 상세
	public void contentForm(HttpServletRequest req,  Model model); 
	
	//장학금 글 신청 상세
	public void apply(HttpServletRequest req,  RedirectAttributes red);
	
	// 시간표 조회
	//public void management(HttpServletRequest req, Model model);
}
