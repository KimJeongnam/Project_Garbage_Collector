package com.spring.project.viewtest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TestController {
	@RequestMapping("test/")
	public String test() {
		return "main2";
	}
	
	@RequestMapping("test/login")
	public String login() {
		return "login";
	}
	
	@RequestMapping("test/logout")
	public String logout() {
		return "redirect:login";
	}
}
