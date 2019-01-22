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
	
	@RequestMapping("majorManage")
	public String majorManage() {
		
		return "majorManage";
	}
	
	@RequestMapping("leactureManage")
	public String leactureManage() {
		return "leactureManage";
	}
	
	@RequestMapping("menu2")
	public String menu2() {
		
		return "menu2";
	}
	
	@RequestMapping("menu3")
	public String menu3() {
		
		return "menu3";
	}
	
	@RequestMapping("menu4")
	public String menu4() {
		
		return "menu4";
	}
	
	@RequestMapping("menu5")
	public String menu5() {
		
		return "menu5";
	}
	
	@RequestMapping("menu6")
	public String menu6() {
		
		return "menu6";
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
	@RequestMapping("menu12")
	public String menu12() {
		
		return "menu12";
	}
	@RequestMapping("menu13")
	public String menu13() {
		
		return "menu13";
	}
	
}
