package com.spring.project.student.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface StudentService {
	
	public void lectureList(HttpServletRequest req, Model model);

}
