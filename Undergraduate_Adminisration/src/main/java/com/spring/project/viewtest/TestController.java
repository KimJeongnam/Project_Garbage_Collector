package com.spring.project.viewtest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TestController {	
	@RequestMapping("/login")
	public String login() {
		
		return "login";
	}
	
	@RequestMapping("/logout")
	public String logout() {

		return "redirect:/login";
	}
	
	@RequestMapping(value={"index", "/"})
	public String index() {
		
		return "index";
	}
	
	@RequestMapping("userInfo")
	public String userInfo() {
		return "userInfo";
	}
	
	@RequestMapping("/tables")
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
	
	@RequestMapping("/majorLectureManagement")
	public String majorLectureManagement() {
		return "majorLectureManagement";
	}
	
	@RequestMapping("/openMajorAdd")
	public String openMajorAdd() {
		return "openMajorAdd";
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
	public String proInsert() {
		
		return "proInsert";
	}
	
	@RequestMapping("empStdManagement")
	public String empStdManagement() {
		
		return "empStdManagement";
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
	
	
	
	
	
	
//=================================================  밑으로 교수 화면
	@RequestMapping("/professor/index")
	public String index2() {
		
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
//=================================================  교수 화면 끝
}
