package com.spring.project.admin.controller;

import java.util.List;
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
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.project.admin.service.AdminService;
import com.spring.project.share.vo.Major;


@Controller
public class AdminController {
	
	@Autowired
	AdminService service;
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@RequestMapping("/admin/index")
	public String index() {
		logger.info("index()");
		return "admin/index";
	}
	
	@RequestMapping("/admin/userInfo")
	public String userInfo() {
		return "admin/userInfo";
	}
	
	/*장학단---------------------------------*/
	
	//장학 신청 심사
	@RequestMapping("/admin/judge")
	public String janghak() {
		System.out.println("장학 심사");
		
		return "admin/judge";
	}
	//장학 목록
	@RequestMapping("/admin/registrationList")
	public String registrationList(HttpServletRequest req, Model model) {
		System.out.println("장학 목록");
		service.registrationList(req,model);
		
		return "admin/registrationList";
	}
	
	//장학 등록
	@RequestMapping("/admin/registration")
	public String registration() {
		System.out.println("장학 등록");
		
		return "admin/registration";
	}
	
	//장학 등록 완료
	@RequestMapping("/admin/rigisterPro")
	public String rigisterPro(HttpServletRequest req, Model model) {
		System.out.println("장학 등록");
		service.rigisterPro(req,model);
		
		return "admin/rigisterPro";
	}
	
	//장학 상세 페이지
	@RequestMapping("/admin/contentForm")
	public String contentform(HttpServletRequest req, Model model) {
		System.out.println("장학 상세");
		service.contentform(req,model);
		
		return "admin/contentForm";
	}
	
	//장학 삭제 페이지
	@RequestMapping("/admin/deletePro")
	public String deletePro(HttpServletRequest req, RedirectAttributes red) {
		System.out.println("장학 삭제");
		service.deletePro(req,red);
		
		return "admin/registrationList";
	}
	
	//장학 예산
	@RequestMapping("/admin/budget")
	public String budget() {
		System.out.println("장학 예산");
		
		return "admin/budget";
	}
	
	/*장학단---------------------------------끝*/
	
	//------------------------- 
	@RequestMapping("/admin/majorLectureManagement")
	public String majorLectureManagement(Model model) {
		
		return "admin/majorLecMangePage/majorLectureManagement";
	}

	@RequestMapping("/admin/facultyManage")
	public String facultyManage() {
		
		return "admin/facultyManage";
	}
	
	//admin - 교수 등록
	@RequestMapping("/admin/proInsert")
	public String proInsert() {
		
		return "admin/proInsert";
	}
	//admin - 학생 등록
	@RequestMapping("/admin/stdInsert")
	public String stdInsert() {
		
		return "admin/stdInsert";
	}
	//admin - 학생 등록처리
	@RequestMapping(value="/admin/stdInsertPro",method=RequestMethod.POST )
	public String stdInsertPro(MultipartHttpServletRequest req, Model model) {
		service.stdInputPro(req, model);
		return "admin/stdInsertPro";
	}
	
	//교수 - 학생 리스트
	@RequestMapping("/admin/empStdManagement")
	public String empStdManagement(HttpServletRequest req, Model model) {
		service.stdList(req, model);
		/*service.professorList(req, model);*/
		return "admin/empStdManagement";
	}
	//교수상세정보 
	@RequestMapping("/admin/proMyPage")
	public String proMyPage() {
		
		return "admin/proMyPage";
	}
	//학생상세정보 
	@RequestMapping("/admin/stdMyPage")
	public String stdMyPage() {
		
		return "admin/stdMyPage";
	}
	//임시 학생인서트
	@RequestMapping("/admin/stdInsert2")
	public String stdInsert2() {
		
		return "admin/stdInsert2";
	}
	
	@RequestMapping("/admin/menu7")
	public String menu7() {
		
		return "admin/menu7";
	}
	
	@ResponseBody
	@RequestMapping(value="/rest/json/getMajors")
	public List<Major> getMajors(@RequestBody Map<String, Object> map){
		logger.info("getMajors");
		List<Major> list = null;
		list = service.getMajors(map);
		return list;
	}
	
	// 학과 조회(게시판 형식)
	@RequestMapping(value="/admin/getMajors", method=RequestMethod.POST)
	public String getMajors(@RequestBody Map<String, Object> map, Model model) {
		service.getMajors(map, model);
		return "admin/majorLecMangePage/majorList";
	}
	
	// 학과 삭제
	@RequestMapping(value="/admin/deleteMajor", method=RequestMethod.POST)
	public String deleteMajor(@RequestBody Map<String, Object>map) {
		
		
		return "admin/majorLecMangePage/majorList";
	}
}
