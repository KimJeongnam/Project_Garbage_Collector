package com.spring.project.admin.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

@Service
public interface AdminService {

	//학생등록
	public void stdInputPro(HttpServletRequest req,  Model model);
}
