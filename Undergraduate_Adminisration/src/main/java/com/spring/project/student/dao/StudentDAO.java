package com.spring.project.student.dao;

import java.util.List;

import java.util.Map;

import com.spring.project.admin.vo.ScholarpkVO;
import com.spring.project.student.vo.LectureVO;

public interface StudentDAO {
	// 수강신청 목록 갯수 구하기
	public int getLectureCnt();
	
	// 수강신청 목록 조회
	public List<LectureVO> lectureList(Map<String, Object> map);
	
	// 강의 검색 목록 갯수 구하기
	public int getLectureSearchCnt(String keyword);
	
	// 강의 검색
	public List<LectureVO> lectureSearch(String keyword);
	
	// 시간표 조회
	public List<LectureVO> schoolTimeTable(String userNumber);
	
	// 강의 체크
	public int checkLecture(Map<String, Object> map);
	
	// 강의 체크
	public int checkStudentInLecture(String lecCode);
	
	// 강의 체크
	public int checkStudentInLecture2(Map<String, Object> map2);
	
	// 강의 신청
	public int applyLecture(Map<String, Object> map);
	
	//장학금 갯수 
	public int getArticleCnt();
	
	//장학금 글 목록
	public List<ScholarpkVO> getArticleList(Map<String,Object> map);
	
	//장학 글 상세 
	public ScholarpkVO getArticle(int scholarpk);
	
	
}
