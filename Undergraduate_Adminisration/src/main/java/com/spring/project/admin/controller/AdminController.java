package com.spring.project.admin.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.project.admin.service.AdminService;


@Controller
public class AdminController {
	
	/*@Autowired
	AdminService service;*/
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@RequestMapping("/admin/index")
	public String index() {
		logger.info("index()");
		return "admin/index";
	}
	
	@RequestMapping("/admin/userInfo")
	public String userInfo() {
		return "admin/userInfo";
	}
	
	
	
	//장학 신청 심사
	@RequestMapping("/admin/judge")
	public String janghak() {
		System.out.println("장학 심사");
		
		return "admin/judge";
	}
	
	//장학 등록
	@RequestMapping("/admin/registration")
	public String registration() {
		System.out.println("장학 등록");
		
		return "admin/registration";
	}
	
	//장학 예산
	@RequestMapping("/admin/budget")
	public String budget() {
		System.out.println("장학 예산");
		
		return "admin/budget";
	}
	
	@RequestMapping("/admin/majorLectureManagement")
	public String majorLectureManagement() {
		return "admin/majorLectureManagement";
	}
	
	@RequestMapping("/admin/openMajorAdd")
	public String openMajorAdd() {
		return "admin/openMajorAdd";
	}

	@RequestMapping("/admin/facultyManage")
	public String facultyManage() {
		
		return "admin/facultyManage";
	}
	
	//admin - 교수 등록
	@RequestMapping("/admin/proInsert")
	public String proInsert() {
		
		return "admin/proInsert";
	}
	
	//admin - 학생 등록
	@RequestMapping("/admin/stdInsert")
	public String stdInsert(HttpServletRequest req, Model model) {
		/*service.stdInputPro(req, model);*/
		return "admin/stdInsert";
	}
	
	@RequestMapping("/admin/empStdManagement")
	public String empStdManagement() {
		
		return "admin/empStdManagement";
	}
	
	//교수상세정보 
	@RequestMapping("/admin/proMyPage")
	public String proMyPage() {
		
		return "admin/proMyPage";
	}
	
	//학생상세정보 
	@RequestMapping("/admin/stdMyPage")
	public String stdMyPage() {
		
		return "admin/stdMyPage";
	}
	
	@RequestMapping("/admin/menu6")
	public String menu6() {
		
		return "admin/menu6";
	}
	
	@RequestMapping("/admin/menu7")
	public String menu7() {
		
		return "admin/menu7";
	}
}
