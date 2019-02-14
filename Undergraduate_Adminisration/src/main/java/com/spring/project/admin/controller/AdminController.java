package com.spring.project.admin.controller;

//github.com/KimJeongnam/Project_Garbage_Collector.git
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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

	/* 장학단--------------------------------- */

	// 장학 신청 심사
	@RequestMapping("/admin/judge")
	public String judge(HttpServletRequest req, Model model) {
		System.out.println("장학 심사");
		service.judge(req, model);

		return "admin/judge";
	}

	// 장학 목록
	@RequestMapping("/admin/registrationList")
	public String registrationList(HttpServletRequest req, Model model) {
		System.out.println("장학 목록");
		service.registrationList(req, model);

		return "admin/registrationList";
	}

	// 장학 등록
	@RequestMapping("/admin/registration")
	public String registration() {
		System.out.println("장학 등록");

		return "admin/registration";
	}

	// 장학 등록 완료
	@RequestMapping("/admin/rigisterPro")
	public String rigisterPro(HttpServletRequest req, Model model) {
		System.out.println("장학 등록");
		service.rigisterPro(req, model);

		return "admin/rigisterPro";
	}

	// 장학 상세 페이지
	@RequestMapping("/admin/contentForm")
	public String contentform(HttpServletRequest req, Model model) {
		System.out.println("장학 상세");
		service.contentform(req, model);

		return "admin/contentForm";
	}

	// 장학 삭제 페이지
	@RequestMapping("/admin/deletePro")
	public String deletePro(HttpServletRequest req, RedirectAttributes red) {
		System.out.println("장학 삭제");
		service.deletePro(req, red);

		return "redirect:/admin/registrationList";
	}

	// 장학 예산
	@RequestMapping("/admin/budget")
	public String budget() {
		System.out.println("장학 예산");

		return "admin/budget";
	}

	/* 장학단---------------------------------끝 */

	// -------------------------
	@RequestMapping("/admin/majorLectureManagement")
	public String majorLectureManagement(Model model) {

		return "admin/majorLecMangePage/majorLectureManagement";
	}

	@RequestMapping("/admin/facultyManage")
	public String facultyManage() {

		return "admin/facultyManage";
	}

	// admin - 교수 등록
	@RequestMapping("/admin/proInsert")
	public String proInsert() {

		return "admin/proInsert";
	}

	// admin - 학생 등록
	@RequestMapping("/admin/stdInsert")
	public String stdInsert() {

		return "admin/stdInsert";
	}

	// admin - 학생 등록처리
	@RequestMapping(value = "/admin/stdInsertPro", method = RequestMethod.POST)
	public String stdInsertPro(MultipartHttpServletRequest req, Model model) {
		service.stdInputPro(req, model);
		return "admin/stdInsertPro";
	}

	// 교수 - 학생 리스트
	@RequestMapping("/admin/empStdManagement")
	public String empStdManagement(HttpServletRequest req, Model model) {
		service.stdList(req, model);
		/* service.professorList(req, model); */
		return "admin/empStdManagement";
	}

	// 휴복학 리스트
	@RequestMapping("/admin/schoolLeaveList")
	public String schoolLeaveList(HttpServletRequest req, Model model) {
		service.schoolLeaveList(req, model);
		return "admin/schoolLeaveList";
	}

	// 교수상세정보
	@RequestMapping("/admin/proMyPage")
	public String proMyPage() {

		return "admin/proMyPage";
	}

	// 학생상세정보
	@RequestMapping("/admin/stdMyPage")
	public String stdMyPage() {

		return "admin/stdMyPage";
	}

	// 임시 학생인서트
	@RequestMapping("/admin/stdInsert2")
	public String stdInsert2(HttpServletRequest req, Model model) {
		service.fandMList(req, model);
		return "admin/stdInsert2";
	}

	// 임시 교수인서트
	@RequestMapping("/admin/proInsert2")
	public String proInsert2(HttpServletRequest req, Model model) {
		service.fandMList(req, model);
		return "admin/proInsert2";
	}
	/*
	 * @RequestMapping(value="/admin/selectFaculty", method=RequestMethod.POST)
	 * public void selectFaculty(HttpServletRequest req, HttpServletResponse
	 * response, Model model) {
	 * 
	 * service.fandMList(req, model);
	 * 
	 * }
	 */

	@RequestMapping("/admin/menu7")
	public String menu7() {

		return "admin/menu7";
	}

	// ---------------------------------학과, 강의 관리START----------------------------------------
	// 학과 조회(게시판 형식)
	@RequestMapping(value = "/admin/major_lecture_Manager/getMajors", method = RequestMethod.POST)
	public String getMajors(@RequestBody Map<String, Object> map, Model model) {
		logger.info("String getMajors()");
		service.getMajors(map, model);
		return "admin/majorLecMangePage/majorList";
	}

	// 학과 삭제
	@ResponseBody
	@RequestMapping(value = "/admin/major_lecture_Manager/ajax/deleteMajor", method = RequestMethod.POST)
	public Map<String, Object> deleteMajor(@RequestBody Map<String, Object> map) {
		logger.info("deleteMajor()");
		return service.deleteMajor(map);
	}

	// 학과 추가
	@ResponseBody
	@RequestMapping(value = "/admin/major_lecture_Manager/addMajor", method = RequestMethod.POST)
	public Map<String, Object> addMajor(@RequestBody Major major) {
		logger.info("addMajor()");
		return service.addMajor(major);
	}

	// 학과 추가
	@ResponseBody
	@RequestMapping(value = "/admin/major_lecture_Manager/modifyMajor", method = RequestMethod.POST)
	public Map<String, Object> modifyMajor(@RequestBody Major major) {
		logger.info("modifyMajor()");
		return service.modifyMajor(major);
	}

	// 강의 조회
	@RequestMapping(value = "/admin/major_lecture_Manager/getLectureList", method = RequestMethod.POST)
	public String getLectureList(@RequestBody Map<String, Object> map, Model model) {
		logger.info("getLectureList()");
		service.getLectureList(map, model);
		return "admin/majorLecMangePage/lectureList";
	}

	// 해당 교수의 빈강의 조회
	@RequestMapping(value = "/admin/major_lecture_Manager/getEmptyLecTime/{empNumber}", method = RequestMethod.GET)
	public String getEmptyLecTime(@PathVariable String empNumber, Model model) {
		logger.info("getEmptyLecTime()");
		service.getEmptyLecTime(empNumber, model);
		return "admin/majorLecMangePage/lectureTimeSelector";
	}
	
	// 다음에 생성될 강의코드 조회
	@ResponseBody
	@RequestMapping(value="/admin/major_lecture_Manager/getLectureSeqNextVal",  method = RequestMethod.GET)
	public Map<String, Object> getLectureSeqNextVal() {
		return service.getLectureSeqNextval();
	}
	
	// 교수 선택 페이지
	@RequestMapping(value="/admin/major_lecture_Manager/professorSelector/")
	public String professorSelector(Model model) {
		logger.info("professorSelector()");
		return "admin/majorLecMangePage/professorSelector";
	}
	
	// 해당 강의의 시간 조회
	@RequestMapping(value="/admin/major_lecture_Manager/LecTime/{lecCode}")
	public String getLecTime(@PathVariable String lecCode, Model model) {
		return "admin/majorLecMangePage/lectureTimeSelector";
	}

	// ---------------------------------학과, 강의 관리 END----------------------------------------

	
	// ---------------------------------회계 관리 START----------------------------------------

	// 교직원 급여관리
	@RequestMapping(value = "/admin/facultyAccountManage", method = RequestMethod.GET)
	public String facultyAccountManage(Model model) {
		service.facultyAccountManage(model);
		return "admin/accountingManagement/AccountManagePage";
	}

	// ---------------------------------회계 관리 END------------------------------------------
}
