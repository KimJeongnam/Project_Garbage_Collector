package com.spring.project.professor.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
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
			logger.info("index");
			
			return "professor/index";
		}
		
		
		/////마이페이지
		//마이페이지 진입
		@RequestMapping("/professor/myPage")
		public String myPage(HttpServletRequest req ,Model model) {
			logger.info("myPage");
			service.myPage(req, model);
			return "professor/myPage";
		}
		
		//이미지 변경
		@RequestMapping("/professor/imageUpload")
		public String imageUpload(MultipartHttpServletRequest req ,RedirectAttributes red) {
			logger.info("imageUpload");
			service.imageUpload(req, red);
			return "redirect:/professor/myPage";
		}
		
		//교수소개 변경
		@RequestMapping("/professor/introUpdate")
		public String introUpdate(HttpServletRequest req ,RedirectAttributes red) {
			logger.info("introUpdate");
			service.introUpdate(req, red);
			return "redirect:/professor/myPage";
		}
		
		//개인정보 업데이트
		@RequestMapping("/professor/update")
		public String update(HttpServletRequest req ,RedirectAttributes red) {
			logger.info("update");
			service.update(req, red);
			return "redirect:/professor/myPage";
		}
		/////마이페이지끝
		
		
		
		/////학생조회
		//학생조회
		@RequestMapping("/professor/list")
		public String list(HttpServletRequest req ,Model model) {
			logger.info("list");
			service.list(req,model);
			return "professor/list";
		}
		
		
		
		/////학생조회끝
		
		
		
		//강의계획서
		@RequestMapping("/professor/plan")
		public String plan() {
			logger.info("plan");
			return "professor/plan";
		}
		
		//과제관리
		@RequestMapping("/professor/report")
		public String report() {
			logger.info("report");
			return "professor/report";
		}
		
		//학점관리
		@RequestMapping("/professor/score")
		public String score() {
			logger.info("score");
			return "professor/score";
		}
}
