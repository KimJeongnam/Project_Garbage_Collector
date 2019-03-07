 package com.spring.project.admin.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.project.admin.vo.lecMVO;
import com.spring.project.share.vo.Major;
import com.spring.project.student.vo.LectureVO;

@Service
public interface AdminService {

	
	//중복확인
	public int confirmNum(Map<Object, Object> map, String userNumber);
	
	//학생등록
	public void stdInputPro(MultipartHttpServletRequest req,  RedirectAttributes red);
	
	//교수등록
	public void ProInputPro(MultipartHttpServletRequest req,  RedirectAttributes red);
	
	//학생 상세페이지
	public void showStdDetail(Map<String, Object> map, HttpServletRequest req, Model model);
	
	//교수 상세페이지
	public void showProDetail(HttpServletRequest req,  Model model);
	
	//학생 이미지수정
	public void stdImgUpdate(MultipartHttpServletRequest req, RedirectAttributes red);
	
	//교수 이미지수정
	public void proImgUpdate(MultipartHttpServletRequest req, RedirectAttributes red);
	
	//학생정보수정
	public void stdDetailUpdate(HttpServletRequest req,  RedirectAttributes model);
	
	//교수정보수정
	public void proDetailUpdate(HttpServletRequest req,  RedirectAttributes model);
		
	//학생+교수 삭제
	public void stdDeletePro(HttpServletRequest req, RedirectAttributes red);
	
	//학생 +교수 목록 
	public void stdList(HttpServletRequest req, Model model);
	
	//단과대 + 학부 리스트
	public void fandMList(HttpServletRequest req, Model model);
	
	//휴복학리스트
	public void schoolLeaveList(HttpServletRequest req, Model model);
	
	//장학심사 
	public void judge(HttpServletRequest req,  Model model); 
	
	//장학심사 
	public void auditPro(HttpServletRequest req,  Model model);
	
	//장학심사 
	public void judge2(Map<String, Object> map, Logger logger, Model model);
	
	//장학 목록 
	public void registrationList(Map<String, Object> map, Model model);
	
	//장학 글 추가
	public void rigisterPro(HttpServletRequest req,  Model model);
	
	//장학 글 상세
	public void contentform(HttpServletRequest req,  Model model);
	
	//장학금 글 수정
	public void rigisterupdate(HttpServletRequest req,  RedirectAttributes red);
	
	//장학 글 삭제
	public void deletePro(HttpServletRequest req,  RedirectAttributes red);
	
	//-----------------------------------교직 업무 관리 START----------------------------------
	// 학사 상태 에따른 redirect 처리
	public String majorLectureManagementRedirector(HttpServletRequest request, RedirectAttributes redirectAttributes);
	// 학과 리스트
	public void getMajors(Map<String, Object> map, Model model);
	// 학과 삭제
	public Map<String, Object> deleteMajor(LectureVO lecture);
	// 학과 추가
	public Map<String, Object> addMajor(Major major);
	// 학과 수정
	public Map<String, Object> modifyMajor(Major major);
	
	// 해당 교수 빈강의시간 조회
	public void getEmptyLecTime(String empNumber, String semester, Model model);
	
	// 강의 시간 조회
	public void getLectureTime(String lecCode, Model model);
	
	// 생성될 강의코드 조회 
	public Map<String, Object> getLectureSeqNextval();
	
	// 강의리스트 게시판
	public void getLectureList(Map<String, Object> map,Model model);
	
	// 교수 리스트 게시판 
	public void getProfessorList(Map<String, Object> map, Model model);
	
	// 강의 추가
	public Map<String, Object> addLecture(LectureVO lecture);
	
	// 강의 조회
	public LectureVO getLecture(Map<String, Object> map);

	// 강의 수정
	public Map<String, Object> modifyLecture(LectureVO lecture);
	
	// 강의 삭제
	public Map<String, Object> deleteLecture(Map<String, Object> map);
	
	//-----------------------------------교직 업무 관리 END-----------------------------
	
	
	//---------------회계 START-------------------
	// 교직원 급여관리
	public void facultyAccountManage(Model model);
	
	// 급여대장 조회
	public void lookupWorkRecord(Map<String, Object> map, Model model);
	
	public void facultyMajorConfirmation(Map<String, Object> map, Model model);
	
	public Map<String, Object> insertPayroll(Map<String, Object> map);
	
	public Map<String, Object> ConfirmationWorkRecord(List<Map<String, Object>> data, Logger logger);
	
	public Map<String, Object> SaveEnterAmountManually(List<Map<String, Object>> data, Logger logger);
	
	public void ConfirmOvertime(Map<String, Object> map, Model model);
	
	public void EnterAmountManually(Map<String, Object> map, Model model);
	
	public void LookupWorkRecord(Map<String, Object> map, Model model);
	
	public Map<String, Object> CopyPayroll(Map<String, Object> map);
	
	public Map<String, Object> ConfirmPayroll(Map<String, Object> map);
	
	public Map<String, Object> DeletePayroll(Map<String, Object> map);
	
	//---------------회계 END-------------------
	
	//메시지 전송부
	public List<String> getUserCellNumList(Map<String, Object> map);
	
	
	
	//---------------학사관리 START-------------------
	
	//학사일정관리 진입
	public void lecM(HttpServletRequest req,  Model model);
	//학사일정 삭제
	public Map<String, Object> delete_sc(lecMVO vo);
	//학사일정 수정
	public void lecScUpdate(HttpServletRequest req, RedirectAttributes red);
	//학사일정 추가
	public void lecScInsert(HttpServletRequest req, RedirectAttributes red);
	//일정 즉시 실행
	public void excuteScUpdate(HttpServletRequest req, RedirectAttributes red);

	
	//---------------학사관리 END-------------------
	
	//---------------성적통계 START-------------------
	
	//성적통계 진입
	public void scoreManagement(HttpServletRequest req, Model model);
	//---------------성적통계 END-------------------
	
	
	//인덱스가즈아
	public void index(HttpServletRequest req, Model model);
	
}
