package com.spring.project.viewtest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TestController {	
	@RequestMapping("test/login")
	public String login() {
		return "login";
	}
	
	@RequestMapping("test/logout")
	public String logout() {
		return "redirect:/test/login";
	}
	
	@RequestMapping(value={"test/index", "/"})
	public String index() {
		return "index";
	}
	
	@RequestMapping("test/tables")
	public String tables() {
		return "tables";
	}
	
	//장학 신청 심사
	@RequestMapping("judge")
	public String janghak() {
		System.out.println("장학 심사");
		
		return "judge";
	}
	
	//장학 등록
	@RequestMapping("registration")
	public String registration() {
		System.out.println("장학 등록");
		
		return "registration";
	}
	
	//장학 예산
	@RequestMapping("budget")
	public String budget() {
		System.out.println("장학 예산");
		
		return "budget";
	}
	
	
}
