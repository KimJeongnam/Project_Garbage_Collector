package com.spring.project.professor.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;




public interface ProfessorService {
	//마이페이지
	public void myPage(HttpServletRequest req, Model model);
	public void imageUpload(MultipartHttpServletRequest req, RedirectAttributes red);
	public void introUpdate(HttpServletRequest req, RedirectAttributes red);
	public void update(HttpServletRequest req, RedirectAttributes red);
	
	//학생조회
	public void list(HttpServletRequest req, Model model);
	public void getStudent(Map<String, Object> map, HttpServletRequest req, Model model);
	public void search_student(Map<String, Object> map, HttpServletRequest req, Model model);
	public void search_student_click(Map<String, Object> map, HttpServletRequest req, Model model);
	
	//학점관리
	public void score(HttpServletRequest req, Model model);
	public void firstLec(Map<String, Object> map, HttpServletRequest req, Model model);
	public void getLecScore(Map<String, Object> map, HttpServletRequest req, Model model);
	public void insertScore(HttpServletRequest req, RedirectAttributes red);
	public void updateScore(HttpServletRequest req, RedirectAttributes red);
	
	//강의계획
	
	//과제관리
}