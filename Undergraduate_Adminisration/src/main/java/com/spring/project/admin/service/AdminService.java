package com.spring.project.admin.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Service
public interface AdminService {

	//학생등록
	public void stdInputPro(MultipartHttpServletRequest req,  Model model);
	
	//학생 +교수 목록 
	public void stdList(HttpServletRequest req, Model model);
	
	//장학심사 
	public void judge(HttpServletRequest req,  Model model);
	
	//장학 목록 
	public void registrationList(HttpServletRequest req,  Model model);
	
	//장학 글 추가
	public void rigisterPro(HttpServletRequest req,  Model model);
	
	//장학 글 상세
	public void contentform(HttpServletRequest req,  Model model);
	
	//장학 글 삭제
	public void deletePro(HttpServletRequest req,  RedirectAttributes red);
}
