package com.spring.project.student.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired; 
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.project.professor.controller.ProfessorController;
import com.spring.project.student.service.StudentServiceImpl;

@Controller
public class StudentController {
	
	@Autowired
	StudentServiceImpl service;
	
	private static final Logger logger = LoggerFactory.getLogger(ProfessorController.class);
	
	@RequestMapping("/student/index")
	public String index() {
		logger.info("index");
		return "student/index";
	}

	//장학금 신청목록
	@RequestMapping("/student/bulletin")
	public String bulletin() {
		logger.info("bulletin");
		return "student/bulletin";
	}

	//장학금 수혜현황
	@RequestMapping("/student/management")
	public String management() {
		logger.info("management");
		return "student/management";
	}
	//학생개인정보
	@RequestMapping("/student/personalProfile")
	public String personalProfile() {
		logger.info("personalProfile");
		return "student/personalProfile";
	}

	//휴학신청
	@RequestMapping("/student/tempSchoolLeave")
	public String tempSchoolLeave() {
		logger.info("tempSchoolLeave");
		return "student/tempSchoolLeave";
	}

	//복학신청
	@RequestMapping("/student/backToSchool")
	public String backToSchool() {
		logger.info("backToSchool");
		return "student/backToSchool";
	}
	
	// 수강신청 페이지
	@RequestMapping(value="/student/lectureList", method=RequestMethod.GET)
	public String lectureList() {
		return "student/lectureListPage";
	}
	
	//수강신청
	@RequestMapping(value="/student/lectureList", method=RequestMethod.POST)
	public String lectureList(@RequestBody Map<String, Object> map, Model model) {
		logger.info("lectureList");
		service.lectureList(map, logger, model);
		
		//service.schoolTimeTable(map, logger, model);
		return "student/lectureList";
	}

	//내 학점 조회
	@RequestMapping("/student/GPA")
	public String GPA() {
		logger.info("GPA");
		return "student/GPA";
	}
	
	// 시간표
	@RequestMapping(value="/student/schoolTimeTable", method=RequestMethod.POST)
	public String schoolTimeTable(@RequestBody Map<String, Object> map, Model model) {
		logger.info("schoolTimeTable");
		
		service.schoolTimeTable(map, logger, model);
		return "student/schoolTimeTable";
	}
	
	//강의 검색
	@RequestMapping("/student/lectureSearch")
	public String lectureSearch(HttpServletRequest req, Model model) {
		logger.info("lectureSearch");
		//service.lectureSearch(req, model);
		return "student/lectureList";
	}
	
	//강의 신청
	@RequestMapping("/student/applyLecture")
	public String applyLecture(HttpServletRequest req, RedirectAttributes red) {
		logger.info("applyLecture");
		//service.applyLecture(req, red);
		
		return "redirect:/student/lectureList";
	}
	
}
