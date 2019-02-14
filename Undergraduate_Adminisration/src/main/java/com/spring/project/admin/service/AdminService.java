 package com.spring.project.admin.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.project.share.vo.Major;

@Service
public interface AdminService {

	//학생등록
	public void stdInputPro(MultipartHttpServletRequest req,  Model model);
	
	//학생 +교수 목록 
	public void stdList(HttpServletRequest req, Model model);
	
	//단과대 + 학부 리스트
	public void fandMList(HttpServletRequest req, Model model);
	
	//휴복학리스트
	public void schoolLeaveList(HttpServletRequest req, Model model);
	
	//장학심사 
	public void judge(HttpServletRequest req,  Model model);
	
	//장학 목록 
	public void registrationList(HttpServletRequest req,  Model model);
	
	//장학 글 추가
	public void rigisterPro(HttpServletRequest req,  Model model);
	
	//장학 글 상세
	public void contentform(HttpServletRequest req,  Model model);
	
	//장학 글 삭제
	public void deletePro(HttpServletRequest req,  RedirectAttributes red);
	
	//---------------교직 업무 관리 START-------------------
	// 학과 리스트
	public void getMajors(Map<String, Object> map, Model model);
	// 학과 삭제
	public Map<String, Object> deleteMajor(Map<String, Object>map);
	// 학과 추가
	public Map<String, Object> addMajor(Major major);
	// 학과 수정
	public Map<String, Object> modifyMajor(Major major);
	
	// 해당 교수 빈강의시간 조회
	public void getEmptyLecTime(String empNumber, Model model);
	
	//---------------교직 업무 관리 END-------------------
	
	
	//---------------회계 START-------------------
	// 교직원 급여관리
	public void facultyAccountManage(Model model);
	
	// 급여대장 조회
	public void lookupWorkRecord(Map<String, Object> map, Model model);
	
	public void facultyMajorConfirmation(Map<String, Object> map, Model model);
	
	public void insertPayroll(HttpServletRequest req,  RedirectAttributes red);
	
	
	//---------------회계 START-------------------
}
