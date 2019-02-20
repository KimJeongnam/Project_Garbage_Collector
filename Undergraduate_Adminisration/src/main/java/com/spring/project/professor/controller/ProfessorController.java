package com.spring.project.professor.controller;

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
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.project.professor.service.ProfessorServiceImpl;


@Controller
public class ProfessorController {
	
	@Autowired
	ProfessorServiceImpl service;
	
	private static final Logger logger = LoggerFactory.getLogger(ProfessorController.class);
		
		
	
		//메인
		@RequestMapping("/professor/index")
		public String index(HttpServletRequest req ,Model model) {
			logger.info("index()");
			
			return "professor/index";
		}
		
		
		////////////////////////////////////////마이페이지
		//마이페이지 진입
		@RequestMapping("/professor/myPage")
		public String myPage(HttpServletRequest req ,Model model) {
			logger.info("myPage()");
			service.myPage(req, model);
			return "professor/myPage";
		}
		
		//이미지 변경
		@RequestMapping("/professor/imageUpload")
		public String imageUpload(MultipartHttpServletRequest req ,RedirectAttributes red) {
			logger.info("imageUpload()");
			service.imageUpload(req, red);
			return "redirect:/professor/myPage";
		}
		
		//교수소개 변경
		@RequestMapping("/professor/introUpdate")
		public String introUpdate(HttpServletRequest req ,RedirectAttributes red) {
			logger.info("introUpdate()");
			service.introUpdate(req, red);
			return "redirect:/professor/myPage";
		}
		
		//개인정보 업데이트
		@RequestMapping("/professor/update")
		public String update(HttpServletRequest req ,RedirectAttributes red) {
			logger.info("update()");
			service.update(req, red);
			return "redirect:/professor/myPage";
		}
		////////////////////////////////////////마이페이지끝
		
		
		
		////////////////////////////////////////학생조회
		//학생조회
		@RequestMapping("/professor/list")
		public String list(HttpServletRequest req ,Model model) {
			logger.info("list()");
			service.list(req,model);
			return "professor/list";
		}
		//학생조회 탭 클릭 시 
		@RequestMapping(value="/professor/list/class_click", method=RequestMethod.POST)
		public String getStudent(@RequestBody Map<String, Object> map, HttpServletRequest req, Model model) {
			logger.info("getStudent()");
			service.getStudent(map, req, model);
			return "professor/myClassStudent";
		}
		//학생조회 검색
		@RequestMapping(value="/professor/list/search_student", method=RequestMethod.POST)
		public String search_student(@RequestBody Map<String, Object> map, HttpServletRequest req, Model model) {
			logger.info("search_student()");
			service.search_student(map, req, model);
			return "professor/search_student";
		}
		//학생조회 후 이름  클릭시 내 강의 목록
		@RequestMapping(value="/professor/list/search_student_click", method=RequestMethod.POST)
		public String search_student_click(@RequestBody Map<String, Object> map, HttpServletRequest req, Model model) {
			logger.info("search_student_click()");
			service.search_student_click(map, req, model);
			return "professor/search_student_click";
		}
		////////////////////////////////////////학생조회끝
		
		
		
		////////////////////////////////////////학점관리
		//학점관리 진입
		@RequestMapping("/professor/score")
		public String score(HttpServletRequest req ,Model model) {
			logger.info("score()");
			service.score(req,model);
			return "professor/score";
		}
		
		//학점관리 첫번째 탭
		@RequestMapping(value="/professor/score/firstLec", method=RequestMethod.POST)
		public String firstLec(@RequestBody Map<String, Object> map, HttpServletRequest req, Model model) {
			logger.info("firstLec()");
			service.firstLec(map, req, model);
			return "professor/firstLec";
		}
		//학점관리 탭 클릭
		@RequestMapping(value="/professor/score/class_click", method=RequestMethod.POST)
		public String getLecScore(@RequestBody Map<String, Object> map, HttpServletRequest req, Model model) {
			logger.info("getLecScore()");
			service.getLecScore(map, req, model);
			return "professor/getLecScore";
		}
		
		//학점입력
		@RequestMapping("/professor/insertScore")
		public String insertScore(HttpServletRequest req ,RedirectAttributes red) {
			logger.info("insertScore()");
			service.insertScore(req,red);
			return "redirect:/professor/score";
		}
		
		//학점수정
		@RequestMapping("/professor/updateScore")
		public String updateScore(HttpServletRequest req ,RedirectAttributes red) {
			logger.info("updateScore()");
			service.updateScore(req,red);
			return "redirect:/professor/score";
		}
		
		////////////////////////////////////////학점관리끝
		
		
		////////////////////////////////////////강의계획서
		//강의계획서
		@RequestMapping("/professor/plan")
		public String plan(HttpServletRequest req ,Model model) {
			logger.info("plan()");
			service.plan(req,model);
			return "professor/plan";
		}
		//강의계획서 첫번째 
		@RequestMapping(value="/professor/plan/firstLec", method=RequestMethod.POST)
		public String firstPlan(@RequestBody Map<String, Object> map, HttpServletRequest req, Model model) {
		logger.info("firstPlan()");
		service.firstPlan(map, req, model);
		return "professor/firstPlan";
		}

		//강의계획서  클릭
		@RequestMapping(value = "/professor/plan/class_click", method = RequestMethod.POST)
		public String getPlan(@RequestBody Map<String, Object> map, HttpServletRequest req, Model model) {
		logger.info("getPlan()");
		service.getPlan(map, req, model);
		return "professor/getPlan";
		}
		////////////////////////////////////////강의계획서 끝		
				
		
		//과제관리
		@RequestMapping("/professor/report")
		public String report() {
			logger.info("report()");
			return "professor/report";
		}
		
}
