package com.spring.project.professor.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;



public interface ProfessorService {
	
	public void myPage(HttpServletRequest req, Model model);
}
