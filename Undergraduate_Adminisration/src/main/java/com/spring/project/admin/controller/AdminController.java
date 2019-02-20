package com.spring.project.admin.controller;

import java.util.HashMap;
import java.util.List;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.project.admin.service.AdminService;
import com.spring.project.share.vo.Major;
import com.spring.project.student.vo.LectureVO;
import com.spring.project.util.AWSUtil;

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
	// 장학 목록
	@RequestMapping(value = "/admin/resister/adminjudgeList", method = RequestMethod.POST)
	public String judgeList(@RequestBody Map<String, Object> map, Model model) {
		System.out.println("장학 목록");
		service.judge2(map, logger, model);

		return "admin/resister/judge";
	}

	// 장학 신청 심사 완료
	@RequestMapping("/admin/auditPro")
	public String auditPro(HttpServletRequest req, Model model) {
		System.out.println("장학 심사 완료");
		service.auditPro(req, model);

		return "redirect:/admin/registrationList";
	}

	// 장학 목록 페이지
	@RequestMapping(value = "/admin/registrationList", method = RequestMethod.GET)
	public String bulletinPage() {
		return "admin/resister/resisterPage";
	}

	// 장학 목록
	@RequestMapping(value = "/admin/resister/adminregistrationList2", method = RequestMethod.POST)
	public String registrationList(@RequestBody Map<String, Object> map, Model model) {
		System.out.println("장학 목록");
		service.registrationList(map, model);

		return "admin/resister/registrationList";
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
	
	//학생인서트페이지
	@RequestMapping("/admin/stdInsert2")
	public String stdInsert2(HttpServletRequest req, Model model) {
		service.fandMList(req, model);
		return "admin/HRD/stdInsert2"; 
	} 
	
	//교수인서트페이지
	@RequestMapping("/admin/proInsert2") 
	public String proInsert2(HttpServletRequest req, Model model) {
		service.fandMList(req, model);
		return "admin/HRD/proInsert2";
	}
	
	//admin - 학생 등록처리
	@RequestMapping(value="/admin/stdInsertPro",method=RequestMethod.POST )
	public String stdInsertPro(MultipartHttpServletRequest req, RedirectAttributes red) {
		service.stdInputPro(req, red);
		return "redirect:/admin/empStdManagement";
	}
	
	//admin - 교수 등록처리
	@RequestMapping(value="/admin/proInsertPro",method=RequestMethod.POST )
	public String proInsertPro(MultipartHttpServletRequest req, RedirectAttributes red) {
		service.ProInputPro(req, red);
		return "redirect:/admin/empStdManagement";
	}
	
	// 교수 - 학생 리스트
	@RequestMapping("/admin/empStdManagement")
	public String empStdManagement(HttpServletRequest req, Model model) {
		service.stdList(req, model);
		/* service.professorList(req, model); */
		return "admin/HRD/empStdManagement";
	}
	
	//학생상세정보 
	@RequestMapping("/admin/stdMyPage")
	public String stdMyPage(Map<String, Object> map, HttpServletRequest req, Model model) {
		service.showStdDetail(map, req, model);
		
		return "admin/HRD/stdMyPage";
	}
	
	//전화번호부 가져오기
	@ResponseBody
	@RequestMapping(value = "/admin/ajax/sendSMSMessage", method = RequestMethod.POST)
	public Map<String, Object> sendSMSMessage(@RequestBody Map<String, Object> map) {
		logger.info("sendSMSMessage" + map.get("authority"));
		
		Map<String, Object> result = new HashMap<String, Object>();
		 
		 try {
			 
			 //Role(Authority)의 핸드폰 번호 조회
			 List<String> userCellNumList = service.getUserCellNumList(map);
			 
			 //AWS SNS Service, SMS 전송
		 	AWSUtil.sendSMSMessage(userCellNumList, map.get("msg").toString());
		 	result.put("result", "success");
		 }catch(Exception e) {
			 logger.error(e.getMessage());
			 result.put("result", "fail");
			 
		 }
		 
		return result;
	}
	
	//학생조회 탭 클릭 시 
	@RequestMapping(value="/admin/list/class_click", method=RequestMethod.POST)
	public String getStudent(@RequestBody Map<String, Object> map, HttpServletRequest req, Model model) {
		service.showStdDetail(map, req, model);
		return "admin/HRD/stdMyPage";
	}
	//교수상세정보 
	 @RequestMapping("/admin/proMyPage") 
	 public String proMyPage(HttpServletRequest req, Model model) {
		 service.showProDetail(req, model);
		 return "admin/HRD/proMyPage";
	 }
	 
	//학생이미지 수정
	 @RequestMapping("/admin/userImgUpdate") 
	 public String userImgUpdate(MultipartHttpServletRequest req, RedirectAttributes red) {
		 service.userImgUpdate(req, red);
		 String userNumber = req.getParameter("userNumber");
			req.setAttribute("userNumber", userNumber);
		 return "redirect:/admin/stdMyPage";
	 }
	 
	//학생정보수정
	 @RequestMapping("/admin/stdDetailUpdate") 
	 public String stdDetailUpdate(HttpServletRequest req, RedirectAttributes red) {
		 service.stdDetailUpdate(req, red);
		 return "redirect:/admin/empStdManagement";
	 }
	 
	//교수정보수정
	 @RequestMapping("/admin/proDetailUpdate") 
	 public String proDetailUpdate(HttpServletRequest req, RedirectAttributes red) {
		 service.proDetailUpdate(req, red);
		 return "redirect:/admin/empStdManagement";
	 }
	 
	  //학생+교수정보삭제
	  @RequestMapping("/admin/stdDeletePro") 
	  public String stdDeletePro(HttpServletRequest req, RedirectAttributes red) {
		  service.stdDeletePro(req, red); 
		  return "redirect:/admin/empStdManagement"; 
	  }
	  
	// 휴복학 리스트
	@RequestMapping("/admin/schoolLeaveList")
	public String schoolLeaveList(HttpServletRequest req, Model model) {
		service.schoolLeaveList(req, model);
		return "admin/HRD/schoolLeaveList";
	}

	@RequestMapping("/admin/menu7")
	public String menu7() {

		return "admin/menu7";
	}

	// ---------------------------------학과,강의관리START----------------------------------------
	/*
	 * 진행중 : ... 완료 : *
	 */

	// 학과 조회(게시판 형식) *
	@RequestMapping(value = "/admin/major_lecture_Manager/getMajors", method = RequestMethod.POST)
	public String getMajors(@RequestBody Map<String, Object> map, Model model) {
		logger.info("String getMajors()");
		service.getMajors(map, model);
		return "admin/majorLecMangePage/majorList";
	}

	// 학과 삭제*
	@ResponseBody
	@RequestMapping(value = "/admin/major_lecture_Manager/ajax/deleteMajor", method = RequestMethod.POST)
	public Map<String, Object> deleteMajor(@RequestBody Map<String, Object> map) {
		logger.info("deleteMajor()");
		return service.deleteMajor(map);
	}

	// 학과 추가*
	@ResponseBody
	@RequestMapping(value = "/admin/major_lecture_Manager/addMajor", method = RequestMethod.POST)
	public Map<String, Object> addMajor(@RequestBody Major major) {
		logger.info("addMajor()");
		return service.addMajor(major);
	}

	// 학과 수정*
	@ResponseBody
	@RequestMapping(value = "/admin/major_lecture_Manager/modifyMajor", method = RequestMethod.POST)
	public Map<String, Object> modifyMajor(@RequestBody Major major) {
		logger.info("modifyMajor()");
		return service.modifyMajor(major);
	}

	// 강의 조회*
	@RequestMapping(value = "/admin/major_lecture_Manager/getLectureList", method = RequestMethod.POST)
	public String getLectureList(@RequestBody Map<String, Object> map, Model model) {
		logger.info("getLectureList()");
		service.getLectureList(map, model);
		return "admin/majorLecMangePage/lectureList";
	}

	// 해당 교수의 빈강의 조회*
	@RequestMapping(value = "/admin/major_lecture_Manager/getEmptyLecTime/{empNumber}/{semester}", method = RequestMethod.GET)
	public String getEmptyLecTime(
			@PathVariable String empNumber
			,@PathVariable String semester
			, Model model) {
		logger.info("getEmptyLecTime()");
		service.getEmptyLecTime(empNumber, semester, model);
		return "admin/majorLecMangePage/lectureTimeSelector";
	}

	// 다음에 생성될 강의코드 조회*
	@ResponseBody
	@RequestMapping(value = "/admin/major_lecture_Manager/getLectureSeqNextVal", method = RequestMethod.GET)
	public Map<String, Object> getLectureSeqNextVal() {
		return service.getLectureSeqNextval();
	}

	// 교수 선택 페이지*
	@RequestMapping(value = "/admin/major_lecture_Manager/professorSelector/")
	public String professorSelector(Model model) {
		logger.info("professorSelector()");
		return "admin/majorLecMangePage/professorSelector";
	}

	// 교수 리스트 페이지 ...
	@RequestMapping(value = "/admin/major_lecture_Manager/getProfessorList", method = RequestMethod.POST)
	public String getProfessorList(@RequestBody Map<String, Object> map, Model model) {
		logger.info("getProfessorList()");
		service.getProfessorList(map, model);
		return "admin/majorLecMangePage/professorList";
	}

	//강의 추가
	@ResponseBody
	@RequestMapping(value="/admin/major_lecture_Manager/insertLecture", method=RequestMethod.POST)
	public Map<String, Object> insertLecture(@RequestBody LectureVO lecture){
		logger.info("insertLecture()");
		return service.addLecture(lecture);
	}
	
	// ---------------------------------학과,강의관리END----------------------------------------

	// ---------------------------------회계관리START----------------------------------------

	// 교직원 급여관리
	@RequestMapping(value = "/admin/facultyAccountManage", method = RequestMethod.GET)
	public String facultyAccountManage(Model model) {
		service.facultyAccountManage(model);
		return "admin/accountingManagement/AccountManagePage";
	}

	// 교직원 급여관리
	@RequestMapping(value = "/admin/facultyMajorConfirmation", method = RequestMethod.GET)
	public String facultyMajorConfirmation(@RequestBody Map<String, Object> map, Model model) {
		service.facultyMajorConfirmation(map, model);
		return "admin/accountingManagement/facultyMajorConfirmation";
	}

	// 급여대장 조회
	@RequestMapping(value = "/admin/lookupWorkRecord", method = RequestMethod.POST)
	public String lookupWorkRecord(@RequestBody Map<String, Object> map, Model model) {
		service.lookupWorkRecord(map, model);
		return "admin/accountingManagement/lookupWorkRecord";
	}

	
	@RequestMapping("/admin/insertPayroll")
	public String insertPayroll(HttpServletRequest req, RedirectAttributes red) {
		service.insertPayroll(req, red);

			return "redirect:/admin/facultyAccountManage";
		}
		
		// 
		@RequestMapping("/admin/ConfirmationWorkRecord")
		public String ConfirmationWorkRecord(HttpServletRequest req, RedirectAttributes red) {
			service.ConfirmationWorkRecord(req, red);

			return "redirect:/admin/facultyAccountManage";
		}
		// 
		@RequestMapping("/admin/SaveEnterAmountManually")
		public String SaveEnterAmountManually(HttpServletRequest req, RedirectAttributes red) {
			service.SaveEnterAmountManually(req, red);

			return "redirect:/admin/facultyAccountManage";
		}
		// 급여대장 조회
		/*@RequestMapping(value="/admin/ConfirmationWorkRecord", method=RequestMethod.POST)
		public String ConfirmationWorkRecord(@RequestBody Map<String, Object> map, RedirectAttributes red, Model model) {
			service.ConfirmationWorkRecord(map, red, model);
			return "admin/accountingManagement/ConfirmationWorkRecord";
		}*/
		//---------------------------------회계 관리 END------------------------------------------
	}

	// ---------------------------------회계관리END------------------------------------------
