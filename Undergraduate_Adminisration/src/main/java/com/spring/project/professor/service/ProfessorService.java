package com.spring.project.professor.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;




public interface ProfessorService {
	
	public void myPage(HttpServletRequest req, Model model);
	public void imageUpload(MultipartHttpServletRequest req, RedirectAttributes red);
	public void introUpdate(HttpServletRequest req, RedirectAttributes red);
	public void update(HttpServletRequest req, RedirectAttributes red);
	public void list(HttpServletRequest req, Model model);
	public void getStudent(Map<String, Object> map, HttpServletRequest req, Model model);
	public void search_student(Map<String, Object> map, HttpServletRequest req, Model model);
}