package com.spring.project.student.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.project.admin.vo.ScholarpkVO;

public interface StudentService {
	
	// 강의 목록
	public void lectureList(Map<String, Object> map, Logger logger, Model model);
	
	// 시간표 조회
	public void schoolTimeTable(Map<String, Object> map, Logger logger, Model model);
	
	//이미지 업로드
	public void s_imageUpload(MultipartHttpServletRequest req, RedirectAttributes red);
	
	//개인정보
	public void personalProfile(HttpServletRequest req, Model model);
	
	//개인정보 업데이트
	public void s_infoupdate(HttpServletRequest req,RedirectAttributes red);
	
	//과제관리
	public void reportlist(Map<String, Object> map, Logger logger, Model model,HttpServletRequest req);
	
	//과제 내용
	public void reportcode(Map<String, Object> map, Logger logger, Model model,HttpServletRequest req,RedirectAttributes red);
	
	//과제 제출완료
	public void assignment(MultipartHttpServletRequest req,RedirectAttributes red);
	
	//장학금 신청 
	public void bulletin(Map<String, Object> map, Logger logger, Model model);
	
	//장학금 수혜내역
	public void management(Map<String, Object> map, Logger logger, Model model);
	
	//장학금 글 신청 상세
	public void contentForm(HttpServletRequest req,  Model model); 
	
	//장학금 글 신청 
	public void apply(HttpServletRequest req,  RedirectAttributes red);
	
	
	// 강의 신청
	public Map<String, Object> applyLecture(Map<String, Object> map, Logger logger);
	
	//강의 hover
	public void lectureHover(Map<String, Object> map, Logger logger, Model model);
	
	// 내 강의 신청 내역
	public void studentMyLecture(Map<String, Object> map, Logger logger, Model model);
	
	//강의 신청 취소
	public Map<String, Object> cancelLecture(Map<String, Object> map, Logger logger);
	
	// 강의 목록 조회(전공)
	public void lectureListMajor(Model model);
	
	// 내 학점 조회
	public void GPA(HttpServletRequest req, Model model);
	
	// 시간표만 조회
	public void bigschoolTimeTable(HttpServletRequest req, Model model);
	
	// 수강신청 페이지 진입(종강 개강 시기에 따라)
	public String lectureList_Manager(HttpServletRequest req, RedirectAttributes red);

}
