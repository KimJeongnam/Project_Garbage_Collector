package com.spring.project.student.dao;

import java.util.List;

import java.util.Map;

import com.spring.project.student.vo.LectureVO;

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
	
	// 강의 신청
	public int applyLecture(Map<String, Object> map);
	
	// 나의  강의
	public List<LectureVO> studentMyLecture(String userNumber);
	
	// 강의 신청 취소
	public int cancelLecture(Map<String, Object> map);
}
