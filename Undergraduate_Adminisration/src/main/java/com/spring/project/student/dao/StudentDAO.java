package com.spring.project.student.dao;

import java.util.List;

import java.util.Map;

import com.spring.project.admin.vo.ScholarpkVO;
import com.spring.project.admin.vo.auditVO;
import com.spring.project.professor.vo.MyPageVO;
import com.spring.project.student.vo.DetailsVO;
import com.spring.project.student.vo.GpaVO;
import com.spring.project.student.vo.LectureVO;
import com.spring.project.student.vo.Report_subVO;
import com.spring.project.student.vo.S_informationVO;
import com.spring.project.student.vo.middle_classVO;
import com.spring.project.student.vo.report_tblVO;

public interface StudentDAO {
	// 수강신청 목록 갯수 구하기
	public int getLectureCnt(Map<String, Object> map);
	
	// 수강신청 목록 조회
	public List<LectureVO> lectureList(Map<String, Object> map);
	
	// 시간표 조회
	public List<LectureVO> schoolTimeTable(String userNumber);
	
	// 시간표 Hover
	public List<LectureVO> lectureHover(Map<String, Object> map);
	
	// 강의 검색 목록 갯수 구하기
	public int getLectureSearchCnt(String keyword);
	
	// 강의 검색
	public List<LectureVO> lectureSearch(String keyword);
	
	// 강의 체크
	public int checkLecture(Map<String, Object> map);
	
	// 강의 체크
	public int checkStudentInLecture(String lecCode);
	
	// 강의 체크
	public int checkStudentInLecture2(Map<String, Object> map2);
	
	// 듣고자 하는 강의 학점 합 
	public int getLectureScoreSum(Map<String, Object> map);
	
	// 강의 신청
	public int applyLecture(Map<String, Object> map);
	
	// 이미지 변경
	public int s_imageUpload(S_informationVO vo);
	
	// 개인정보
	public S_informationVO personalProfile(String userNumber);
	
	// 개인정보 업데이트
	public int s_infoupdate(Map<String, Object> map);
	
	//수강중 강의 
	public List<middle_classVO> s_Lecture(String userNumber);

	//수강중 과제 
	public List<report_tblVO> s_report(Map<String, Object> map); 
	
	// 과제 정보
	public report_tblVO reportcontent(Map<String, Object> map);
	
	//과제 제출
	public Report_subVO reportsub(Map<String, Object> map);
	
	//과제 제출 확인 
	public int reportCheck(Map<String, Object> map);
	
	//과제 제출 완료
	public int s_fileUpload(Report_subVO vo);
	
	//장학금 갯수 
	public int getArticleCnt(Map<String,Object> map);
	
	//장학금 글 목록
	public List<ScholarpkVO> getArticleList(Map<String,Object> map);
	
	//장학금 수혜 내역 갯수 
	public int management_cnt(Map<String,Object> map);
	
	//장학금  수혜 내역 목록
	public List<Object> managementList(Map<String,Object> map);
	
	//장학 글 상세  
	public ScholarpkVO getArticle(int scholarpk);
	
	//장학금 중복 신청 확인 
	public int scholarpk(Map<String,Object> map);
	
	//장학금 신청  
	public int scholarshipinsert(Map<String, Object> map);
	
	
	
	
	
	
	
	// 나의  강의
	public List<LectureVO> studentMyLecture(String userNumber);
	
	// 강의 신청 취소
	public int cancelLecture(Map<String, Object> map);
	
	// 강의 목록 조회(전공)
	public List<LectureVO> getMajor();
	
	// 내 학점 조회
	public List<GpaVO> GPA(String userNumber);
	
	// 신청 학점
	public int ApplyCredit(String userNumber);
	
	// 이수 학점
	public List<GpaVO> grantedCredit(String userNumber);
	
	public int getBachelorStatus();
	
	public int getTotalLecPoint(String userNumber);
	
}
