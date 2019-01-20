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
		return "redirect:/login";
	}
	
	@RequestMapping(value={"test/index", "/"})
	public String index() {
		return "index";
	}
	
	@RequestMapping("test/chiho")
	public String chiho() {
		return "index2";
	}
}
