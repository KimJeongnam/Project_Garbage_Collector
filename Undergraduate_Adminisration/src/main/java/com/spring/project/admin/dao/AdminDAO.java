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
import com.spring.project.student.vo.LectureVO;


@Repository
public interface AdminDAO {
	
	//학생등록 처리페이지
	public int insertUsers(AdStdVO vo);
	public int insertStudent(AdStdVO vo);
	public int insertStudentState(AdStdVO vo);
	
	//교수등록 처리
	public int insertPUsers(AdProVO vo);
	public int insertEmployees(AdProVO vo);

	//학생정보 업데이트
	public int updateUsers(AdStdVO vo);
	public int updateStudent(AdStdVO vo);
	public int updateStudentState(AdStdVO vo);
	
	//교수정보 업데이트
	public int updatePUsers(AdProVO vo);
	public int updateEmployees(AdProVO vo);
		
	//이미지 업데이트
	public int proImgUpdate(AdProVO vo);
	public int stdImgUpdate(AdStdVO vo);
	//학생 상세페이지
	public AdStdVO stdDetail(String userNumber);
	
	//교수 상세페이지
	public AdProVO proDetail(String userNumber);
	
	//학생+ 교수 삭제
	public int stdDelete(String userNum);
		
	//학생 리스트
	public List<AdStdVO> getStdList(Map<String, Integer> map);
	
	//교수 리스트
	public List<AdProVO> getProList(Map<String, Integer> map);
	
	//학부 + 학과 리스트
	public List<AdProVO> FandMList(Map<String, Integer> map);
	
	//휴복학 리스트
	public List<AdStdVO> getSchoolLeave(Map<String, Integer> map);
	
	//장학글 갯수
	public int Jang_getArticleCnt(Map<String,Object> map);
	
	//장학 글 목록
	public List<ScholarpkVO> jang_getArticleList(Map<String,Object> map);
	
	//장학 심사 글 갯수 
	public int audit_getArticleCnt(Map<String,Object> map);
	
	//장학 글 추가 
	public int insertjangjag(ScholarpkVO vo);
	
	//장학 글 상세 
	public ScholarpkVO content_getArticle(int scholarpk); 
	
	//장학글 삭제
	public int jang_delete(String[] checkbox);
	
	//장학글 심사
	public List<auditVO> auditCnt();
	
	//장학글 심사
	public List<auditVO> auditCnt2(int auditct);
	
	//장학금 심사 합격
	public int auditupdate(String[] checkbox);
	
	//장학금 심사 탈락
	public int auditupdate2(String[] checkbox);
	
	//장학금 심사 심사 완료
	public int auditupdate3(String[] checkbox);
	
	
	//---------------교직 업무 관리 START-------------------
	// 학과 갯수 조회
	public int majorListCount(Map<String, Object> map);
	// 학과 조회
	public List<Object> majorList(Map<String, Object> map);
	// 학과 삭제
	public void  deleteMajor(LectureVO lecture);
	// 학과 등록
	public int addMajor(Major major);
	// 학과 수정
	public int modifyMajor(Major major);
	
	// 해당 교수 빈 강의 조회
	public List<Object> emptyLecTime(Map<String, Object>map);
	
	// 해당 교수가 맡은 강의 조회
	public List<Object> getLecturesTimes(Map<String, Object>map);
	// 강의코드 시퀀스 다음 번호 조회
	public int getLectureSeqNextval();
	
	// 강의 목록 갯수
	public int getLectureCount(Map<String, Object> map);
	// 강의 목록 조회
	public List<Object> getLectureList(Map<String, Object> map);
	
	// 교수 조회 
	public int getProfessorCount(Map<String, Object> map);
	public List<Object> getProfessorList(Map<String, Object> map);

	// 강의 추가
	public void addLecture(LectureVO lecture);
	
	// 강의 조회
	public LectureVO getLecture(Map<String, Object> map);
	
	//---------------교직 업무 관리 END-------------------
	
	public List<payrollVO> payrollList();
	
	public List<payrollVO> getFacultyList();
	
	public List<payrollVO> getFacultyMajor();
	
	public List<payrollVO> getPaymentClassfication();
	
	public List<payrollVO> getFinalPayrollList();
	
	public List<payrollVO> lookupWorkRecord(Map<String, Object> map);
	
	public List<payrollVO> accountFacultyList(Map<String, Object> map);
	
	
	public int insertPayroll(payrollVO vo);
	
	public List<String> getUserCellNumList(Map<String, Object> map);
}
