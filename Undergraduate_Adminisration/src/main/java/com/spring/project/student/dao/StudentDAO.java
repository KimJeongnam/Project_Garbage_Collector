package com.spring.project.student.dao;

public interface StudentDAO {
	
	// 학과 번호 가져오기
	public String getMajorNum(String userId);
	
	// 수강신청 목록 갯수 구하기
	public int getLectureCnt(String majorNum);
	
	
}
