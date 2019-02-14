 package com.spring.project.admin.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
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
	
	//장학 글 삭제
	public void deletePro(HttpServletRequest req,  RedirectAttributes red);
	
	//---------------교직 업무 관리 START-------------------
	public void getMajors(Map<String, Object> map, Model model);
	
	public Map<String, Object> deleteMajor(Map<String, Object>map);
	
	public Map<String, Object> addMajor(Major major);
	
	public Map<String, Object> modifyMajor(Major major);
	
	//---------------교직 업무 관리 END-------------------
}
