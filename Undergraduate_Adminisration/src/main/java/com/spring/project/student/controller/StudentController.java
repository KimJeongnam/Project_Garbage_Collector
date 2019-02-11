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
import org.springframework.web.bind.annotation.ResponseBody;
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
	public String bulletin(HttpServletRequest req, Model model) {
		logger.info("bulletin");
		service.bulletin(req, model);
		
		return "student/bulletin";
	}
	//장학금 글 상세 페이지
	@RequestMapping("/student/contentForm")
	public String contentForm(HttpServletRequest req, Model model) {
		System.out.println("장학 상세");
		service.contentForm(req,model);
		
		return "student/contentForm";
	}
	
	@RequestMapping("/student/apply")
	public String apply(HttpServletRequest req, RedirectAttributes red) {
		System.out.println("장학 신청 완료");
		service.apply(req,red);
		
		return "redirect:/student/bulletin";
	} 

	//장학금 수혜현황
	@RequestMapping("/student/management")
	public String management() {
		logger.info("management");
		//service.management(req, model);
		
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
	public String lectureList(Model model) {
		service.lectureListMajor(model);
		return "student/lecture&timetable/lectureListPage";
	}
	
	//수강신청
	@RequestMapping(value="/student/lectureList", method=RequestMethod.POST)
	public String lectureList(@RequestBody Map<String, Object> map, Model model) {
		logger.info("lectureList");
		service.lectureList(map, logger, model);
		return "student/lecture&timetable/lectureList";
	}

	// 내 학점 조회
	@RequestMapping("/student/GPA")
	public String GPA(HttpServletRequest req, Model model) {
		logger.info("GPA");
		service.GPA(req, model);
		return "student/GPA";
	}
	
	// 시간표
	@RequestMapping(value="/student/schoolTimeTable", method=RequestMethod.POST)
	public String schoolTimeTable(@RequestBody Map<String, Object> map, Model model) {
		logger.info("schoolTimeTable");
		
		service.schoolTimeTable(map, logger, model);
		return "student/lecture&timetable/schoolTimeTable";
	}
	
	/*// 시간표 Hover
	@RequestMapping(value="/student/lectureHover", method=RequestMethod.POST)
	public String lectureHover(@RequestBody Map<String, Object> map, Model model) {
		logger.info("schoolTimeTable");
		
		service.lectureHover(map, logger, model);
		return "student/schoolTimeTable";
	}*/
		
	//강의 신청
	@ResponseBody
	@RequestMapping(value="/student/applyLecture", method=RequestMethod.POST)
	public Map<String, Object> applyLecture(@RequestBody Map<String, Object> map) {
		logger.info("applyLecture");
		
		return service.applyLecture(map, logger);
	}
	
	// 내 강의 신청 내역
	@RequestMapping(value="/student/studentMyLecture", method=RequestMethod.POST)
	public String studentMyLecture(@RequestBody Map<String, Object> map, Model model) {
		logger.info("studentMyLecture");
		
		service.studentMyLecture(map, logger, model);
		return "student/lecture&timetable/studentMyLecture";
	}
	
	// 내 강의 신청 취소
	@ResponseBody
	@RequestMapping(value="/student/cancelLecture", method=RequestMethod.POST)
	public Map<String, Object> cancelLecture(@RequestBody Map<String, Object> map) {
		logger.info("cancelLecture");
		return service.cancelLecture(map, logger);
	}
}
