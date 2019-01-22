package com.spring.project.viewtest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TestController {	
	@RequestMapping("login")
	public String login() {
		
		return "login";
	}
	
	@RequestMapping("logout")
	public String logout() {

		return "redirect:/login";
	}
	
	@RequestMapping(value={"index", "/"})
	public String index() {
		
		return "index";
	}
	
	@RequestMapping("tables")
	public String tables() {
		
		return "tables";
	}
	
	@RequestMapping("menu1")
	public String menu1() {
		
		return "menu1";
	}
	
	@RequestMapping("menu2")
	public String menu2() {
		
		return "menu2";
	}
	
	@RequestMapping("menu3")
	public String menu3() {
		
		return "menu3";
	}
	
	@RequestMapping("facultyManage")
	public String facultyManage() {
		
		return "facultyManage";
	}
	
	@RequestMapping("proInsert")
	public String menu5() {
		
		return "proInsert";
	}
	
	@RequestMapping("infoSearch")
	public String infoSearch() {
		
		return "infoSearch";
	}
	
	@RequestMapping("menu7")
	public String menu7() {
		
		return "menu7";
	}
	
	@RequestMapping("menu8")
	public String menu8() {
		
		return "menu8";
	}
	
	@RequestMapping("menu9")
	public String menu9() {
		
		return "menu9";
	}
	
	@RequestMapping("menu10")
	public String menu10() {
		
		return "menu10";
	}
	
	@RequestMapping("menu11")
	public String menu11() {
		
		return "menu11";
	}
	
}
