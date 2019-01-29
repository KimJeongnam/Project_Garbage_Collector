package com.spring.project.student.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired; 
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.project.student.service.StudentServiceImpl;

@Controller
public class StudentController {
	
	@Autowired
	StudentServiceImpl service;
	
	@RequestMapping("/student/index")
	public String index() {
		return "student/index";
	}

	//장학금 신청목록
	@RequestMapping("/student/bulletin")
	public String bulletin() {

		return "student/bulletin";
	}

	//장학금 수혜현황
	@RequestMapping("/student/management")
	public String management() {

		return "student/management";
	}
	//학생개인정보
	@RequestMapping("/student/personalProfile")
	public String personalProfile() {

		return "student/personalProfile";
	}

	//휴학신청
	@RequestMapping("/student/tempSchoolLeave")
	public String tempSchoolLeave() {

		return "student/tempSchoolLeave";
	}

	//복학신청
	@RequestMapping("/student/backToSchool")
	public String backToSchool() {

		return "student/backToSchool";
	}

	//수강신청
	@RequestMapping("/student/lectureList")
	public String lectureList(HttpServletRequest req, Model model) {
		service.lectureList(req, model);
		
		return "student/lectureList";
	}

	//내 학점 조회
	@RequestMapping("/student/GPA")
	public String GPA() {
		return "student/GPA";
	}

	//시간표 조회
	@RequestMapping("/student/schoolTimeTable")
	public String schoolTimeTable() {

		return "student/schoolTimeTable";
	}
}
