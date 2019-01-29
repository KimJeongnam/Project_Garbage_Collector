package com.spring.project.admin.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.project.share.controller.ShareController;

@Controller
public class AdminController {
	
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
	
	@RequestMapping("/admin/proInsert")
	public String proInsert() {
		
		return "admin/proInsert";
	}
	
	@RequestMapping("/admin/empStdManagement")
	public String empStdManagement() {
		
		return "admin/empStdManagement";
	}
	
	@RequestMapping("/admin/menu5")
	public String menu5() {
		
		return "admin/menu5";
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
