package com.spring.project.admin.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.spring.project.admin.vo.AdProVO;
import com.spring.project.admin.vo.AdStdVO;
import com.spring.project.admin.vo.ScholarpkVO;
import com.spring.project.admin.vo.auditVO;
import com.spring.project.admin.vo.payrollVO;
import com.spring.project.share.vo.Major;


@Repository
public interface AdminDAO {
	//학생등록 처리페이지
	public int insertUsers(AdStdVO vo);
	public int insertStudent(AdStdVO vo);
	public int insertMajor(AdStdVO vo);
	public int insertSchoolLeave(AdStdVO vo);
	public int insertStudentState(AdStdVO vo);
	public int insertFaculty(AdStdVO vo);
	
	//학생 리스트
	public List<AdStdVO> getStdList(Map<String, Integer> map);
	
	//교수 리스트
	public List<AdProVO> getProList(Map<String, Integer> map);
	
	//학부 + 학과 리스트
	public List<AdProVO> FandMList(Map<String, Integer> map);
	
	//휴복학 리스트
	public List<AdStdVO> getSchoolLeave(Map<String, Integer> map);
	
	//장학글 갯수
	public int getArticleCnt();
	
	//장학 글 목록
	public List<ScholarpkVO> getArticleList(Map<String,Object> map);
	
	//장학 글 추가 
	public int insertjangjag(ScholarpkVO vo);
	
	//장학 글 상세 
	public ScholarpkVO getArticle(int scholarpk); 
	
	//장학글 삭제
	public int delete(String[] checkbox);
	
	//장학글 심사
	public List<auditVO> auditCnt();
	
	
	//---------------교직 업무 관리 START-------------------
	// 학과 갯수 조회
	public int majorListCount(Map<String, Object> map);
	// 학과 조회
	public List<Major> majorList(Map<String, Object> map);
	// 학과 삭제
	public int  deleteMajor(Map<String, Object> map);
	// 학과 등록
	public int addMajor(Major major);
	// 학과 수정
	public int modifyMajor(Major major);
	
	// 해당 교수 빈 강의 조회
	public List<Object> emptyLecTime(String empNumber);
	
	//---------------교직 업무 관리 END-------------------
	
	public List<payrollVO> payrollList();
	
	public List<payrollVO> getFacultyList();
}
