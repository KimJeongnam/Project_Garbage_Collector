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
import com.spring.project.admin.vo.lecMVO;
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

	//전화번호부 가져오기
	@ResponseBody
	@RequestMapping(value = "/admin/ajax/sendSMSMessage", method = RequestMethod.POST)
	public Map<String, Object> sendSMSMessageStd(@RequestBody Map<String, Object> map) {
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



	//교수상세정보 
	@RequestMapping("/admin/proMyPage") 
	public String proMyPage(HttpServletRequest req, Model model) {
		service.showProDetail(req, model);
		return "admin/HRD/proMyPage";
	}

	//학생상세정보 
	@RequestMapping("/admin/stdMyPage")
	public String stdMyPage(Map<String, Object> map, HttpServletRequest req, Model model) {
		service.showStdDetail(map, req, model);
		return "admin/HRD/stdMyPage";
	}

	//학생이미지 수정
	@RequestMapping("/admin/stdImgUpdate") 
	public String stdImgUpdate(MultipartHttpServletRequest req, RedirectAttributes red) {
		service.stdImgUpdate(req, red);
		return "redirect:/admin/stdMyPage";
	}

	//교수이미지 수정
	@RequestMapping("/admin/proImgUpdate") 
	public String proImgUpdate(MultipartHttpServletRequest req, RedirectAttributes red) {
		service.stdImgUpdate(req, red);
		return "redirect:/admin/proMyPage";
	}

	//학생정보수정
	@RequestMapping("/admin/stdDetailUpdate") 
	public String stdDetailUpdate(HttpServletRequest req,  RedirectAttributes model) {
		service.stdDetailUpdate(req, model);
		return "redirect:/admin/stdMyPage";
	}

	//교수정보수정
	@RequestMapping("/admin/proDetailUpdate") 
	public String proDetailUpdate(HttpServletRequest req,  RedirectAttributes model) {
		service.proDetailUpdate(req, model);
		return "redirect:/admin/proMyPage";
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
	public Map<String, Object> deleteMajor(@RequestBody LectureVO lecture) {
		logger.info("deleteMajor()");
		return service.deleteMajor(lecture);
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
	public String getEmptyLecTime(@PathVariable String empNumber, @PathVariable String semester, Model model) {
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

	// 강의 추가
	@ResponseBody
	@RequestMapping(value = "/admin/major_lecture_Manager/insertLecture", method = RequestMethod.POST)
	public Map<String, Object> insertLecture(@RequestBody LectureVO lecture) {

		logger.info("insertLecture()");
		return service.addLecture(lecture);
	}

	// 강의 수정
	@ResponseBody
	@RequestMapping(value = "/admin/major_lecture_Manager/modifyLecture", method = RequestMethod.POST)
	public Map<String, Object> modifyLecture(@RequestBody LectureVO lecture) {
		logger.info("insertLecture()");
		logger.info("insertLecture-> getTimetblCodes()");
		for (int key : lecture.getTimetblCodes()) {
			logger.info("code:" + key);
		}
		return service.modifyLecture(lecture);
	}

	// 강의 삭제
	@ResponseBody
	@RequestMapping(value = "/admin/major_lecture_Manager/deleteLecture", method = RequestMethod.POST)
	public Map<String, Object> deleteLecture(@RequestBody Map<String, Object> map) {
		logger.info("deleteLecture()");
		return service.deleteLecture(map);
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
	
	@ResponseBody
	@RequestMapping(value = "/admin/insertPayroll", method = RequestMethod.POST)
	public Map<String, Object> insertPayroll(@RequestBody Map<String, Object> map) {
		return service.insertPayroll(map);
	}

	/*@RequestMapping("/admin/insertPayroll")
	public String insertPayroll(HttpServletRequest req, RedirectAttributes red) {
	//service.insertPayroll(req, red);

		return "redirect:/admin/facultyAccountManage";
	}*/
		
	//
	@ResponseBody
	@RequestMapping(value="/admin/ConfirmationWorkRecord", method= RequestMethod.POST)
	public Map<String, Object> ConfirmationWorkRecord(@RequestBody List<Map<String, Object>> data) {
		logger.info("ConfirmationWorkRecord");
		return service.ConfirmationWorkRecord(data, logger);
	}
	
	//
	@ResponseBody
	@RequestMapping(value="/admin/SaveEnterAmountManually", method= RequestMethod.POST)
	public Map<String, Object> SaveEnterAmountManually(@RequestBody List<Map<String, Object>> data) {
		logger.info("SaveEnterAmountManually");
		return service.SaveEnterAmountManually(data, logger);
	}

	// 근무기록확정
	@RequestMapping(value = "/admin/ConfirmOvertime", method = RequestMethod.POST)
	public String ConfirmOvertime(@RequestBody Map<String, Object> map, Model model) {
		service.ConfirmOvertime(map, model);
		return "admin/accountingManagement/ConfirmOvertime";
	}

	// 금액직접입력
	@RequestMapping(value = "/admin/EnterAmountManually", method = RequestMethod.POST)
	public String EnterAmountManually(@RequestBody Map<String, Object> map, Model model) {
		service.EnterAmountManually(map, model);
		return "admin/accountingManagement/EnterAmountManually";
	}

	// 복사
	@RequestMapping(value = "/admin/LookupWorkRecord", method = RequestMethod.POST)
	public String LookupWorkRecord(@RequestBody Map<String, Object> map, Model model) {
		service.LookupWorkRecord(map, model);
		return "admin/accountingManagement/LookupWorkRecord";
	}
	
	//
	@ResponseBody
	@RequestMapping(value="/admin/CopyPayroll", method= RequestMethod.POST)
	public Map<String, Object> CopyPayroll(@RequestBody Map<String, Object> map) {
		logger.info("CopyPayroll");
		return service.CopyPayroll(map);
	}
	

// ---------------------------------회계관리END------------------------------------------
	
	
	
	
	// ---------------------------------학사 수업업무START------------------------------------------
	//진입
	@RequestMapping("/admin/lec_score_Management/lecManagement")
	public String lecManagement(HttpServletRequest req, Model model) {
		service.lecM(req, model);
		logger.info("lecManagement()");
		return "admin/lec_score_Management/lecManagement";
	}
	//일정 삭제
	@ResponseBody
	@RequestMapping(value="/admin/lec_score_Management/lecManagement/delete_sc", method=RequestMethod.POST)
	public Map<String, Object> delete_sc(@RequestBody lecMVO vo) {
		logger.info("delete_sc()");
		return service.delete_sc(vo);
	}
	//수정
	@RequestMapping("/admin/lec_score_Management/lecScUpdate")
	public String lecScUpdate(HttpServletRequest req, RedirectAttributes red) {
		service.lecScUpdate(req, red);
		logger.info("lecScUpdate()");
		return "redirect:/admin/lec_score_Management/lecManagement";
	}
	//입력
	@RequestMapping("/admin/lec_score_Management/lecScInsert")
	public String lecScInsert(HttpServletRequest req, RedirectAttributes red) {
		service.lecScInsert(req, red);
		logger.info("lecScInsert()");
		return "redirect:/admin/lec_score_Management/lecManagement";
	}
	//즉시실행
	@RequestMapping("/admin/lec_score_Management/excuteScUpdate")
	public String excuteScUpdate(HttpServletRequest req, RedirectAttributes red) {
		service.excuteScUpdate(req, red);
		logger.info("excuteScUpdate()");
		return "redirect:/admin/lec_score_Management/lecManagement";
	}
	// ---------------------------------학사 수업업무END------------------------------------------
	
	
	
	// ---------------------------------학사 성적(?)업무START------------------------------------------
	
	//학사 성적 통계 진입
	@RequestMapping("/admin/lec_score_Management/scoreManagement")
	public String scoreManagement(HttpServletRequest req, Model model) {
		service.scoreManagement(req, model);
		logger.info("scoreManagement()");
		return "admin/lec_score_Management/scoreManagement";
	}
	// ---------------------------------학사 성적(?)업무END------------------------------------------
	
	
}
