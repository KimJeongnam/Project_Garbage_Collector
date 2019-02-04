package com.spring.project.admin.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Service
public interface AdminService {

	//학생등록
	public void stdInputPro(MultipartHttpServletRequest req,  Model model);
	
	//학생 +교수 목록 
	public void stdList(HttpServletRequest req, Model model);
	
}
