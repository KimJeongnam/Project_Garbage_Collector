package com.spring.project.student.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class StudentController {
	@RequestMapping("/student/index")
	public String index() {
		return "student/index";
	}
	
	//장학금 신청목록
	@RequestMapping("/student/bulletin")
	public String bulletin() {
		
		return "bulletin";
	}
	
	//장학금 수혜현황
		@RequestMapping("/student/management")
		public String management() {
			
			return "management";
		}
}
