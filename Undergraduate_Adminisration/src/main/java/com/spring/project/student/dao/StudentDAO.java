package com.spring.project.student.dao;

import java.util.List;

import java.util.Map;

import com.spring.project.student.vo.LectureVO;

public interface StudentDAO {
	// 수강신청 목록 갯수 구하기
	public int getLectureCnt();
	
	// 수강신청 목록 조회
	public List<LectureVO> lectureList(Map<String, Object> map);
	
	// 시간표 조회
	public List<LectureVO> schoolTimeTable(String userNumber);
	
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
	
	// 강의 신청
	public int applyLecture(Map<String, Object> map);
}
