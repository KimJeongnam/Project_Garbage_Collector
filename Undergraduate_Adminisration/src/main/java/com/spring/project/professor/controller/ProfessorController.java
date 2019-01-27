package com.spring.project.professor.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ProfessorController {
		@RequestMapping("/professor/index")
		public String index() {
			
			return "professor/index";
		}
		
		@RequestMapping("/professor/myPage")
		public String myPage() {
			
			return "professor/myPage";
		}
		
		@RequestMapping("/professor/list")
		public String list() {
			
			return "professor/list";
		}
		
		@RequestMapping("/professor/plan")
		public String plan() {
			
			return "professor/plan";
		}
		
		@RequestMapping("/professor/report")
		public String report() {
			
			return "professor/report";
		}
		
		@RequestMapping("/professor/score")
		public String score() {
			
			return "professor/score";
		}
}
