package com.spring.project.student.dao;

import java.util.List;
import java.util.Map;

import com.spring.project.vo.LectureVO;

public interface StudentDAO {
	
	// 학과 번호 가져오기
	public List<LectureVO> getMajorNum(String userId);
	
	// 수강신청 목록 갯수 구하기
	public int getLectureCnt(int majorNum);
	
	// 수강신청 목록 조회
	public List<LectureVO> lectureList(Map<String, Object> map);
	
}
